app.controller('AdminCtrl', [ '$scope', '$rootScope', 'adminService', 'alertService', function($scope, $rootScope, adminService, alertService) {
    var self = this;

    self.successAddingItemsFunction = function (tab, init) {
        return function (response) {
            if(tab.name == 'users') {
                _.forEach(response.items, function (item) {
                    tab.model[item.userId] = item.type;
                })
            }else{
                if(tab.name == 'types'){
                    tab.model = '';
                }
            }
            tab.items = (init) ? response.items : adminService.concat(tab.items, response.items);
            tab.fromItems = (init) ? response.offset : tab.fromItems + response.offset;
            tab.noMoreItems = response.noMoreItems;
            $rootScope.loadingInformation = false;
        }
    };
    
    self.getTabFunction = function (name, offset) {
        switch (name) {
            case 'tasks':
                return adminService.getNullLevelTasks(offset);
                break;
            case 'users':
                return adminService.getUsersInfo(offset);
                break;
            case 'types':
                return adminService.getTypes(offset);
                break;
        }
    };

    $scope.loadItems = function (tab, offset, init, $event) {
        $rootScope.loadingInformation = true;
        self.getTabFunction(tab.name, offset)
            .then(self.successAddingItemsFunction(tab, init), adminService.addErrorHandler);
        if($event) {
            $event.stopPropagation();
        }
    };

    $scope.init = function(tab) {
        $scope.loadItems(tab, 0, true);
    };

    $scope.changeLevel = function (selectedLevel, id, name) {
        var text = adminService.getText('level', name, selectedLevel);
        var modalInstance = adminService.openConfirmModal(text);
        modalInstance.result.then(function (data) {
            if(data){
                $rootScope.loadingInformation = true;
                adminService.changeLevel(selectedLevel, id)
                    .success(function () {
                        $scope.init($scope.adminTabs[0]);
                        adminService.allDoneHandler('Task level successfully changed');
                    })
                    .error(function (err, status) {
                        adminService.changeLevelErrorHandler($scope.adminTabs[0], id, err, status);
                    });
            }else{
                adminService.changeLevelErrorHandler($scope.adminTabs[0], id);
            }
        });
    };

    $scope.addType = function (newType) {
        if(!newType) {
            return alertService.alert('Type minimal length : 1', 'error');
        }
        var text = adminService.getText('newType', newType);
        var modalInstance = adminService.openConfirmModal(text);
        modalInstance.result.then(function (data) {
            if(data) {
                $rootScope.loadingInformation = true;
                adminService.addType(newType)
                    .success(function () {
                        $scope.init($scope.adminTabs[1]);
                        adminService.allDoneHandler('Type successfully added');
                        adminService.blurTypeAddInput('.new-type-input');
                    })
                    .error(adminService.changeErrorHandler);
            }else {
                $scope.adminTabs[1].model = '';
                adminService.blurTypeAddInput('.new-type-input');
            }
        });

    };

    $scope.removeType = function (typeId, name) {
        var text = adminService.getText('removeType', name);
        var modalInstance = adminService.openConfirmModal(text);
        modalInstance.result.then(function (data) {
            if(data){
                $rootScope.loadingInformation = true;
                adminService.removeType(typeId)
                    .success(function () {
                        adminService.allDoneHandler('Type successfully removed');
                        $scope.init($scope.adminTabs[1]);
                    })
                    .error(adminService.changeErrorHandler);
            }
        });
    };


    $scope.changeRole = function (selectedRole, id, name) {
        var text = adminService.getText('role', name, selectedRole);
        var modalInstance = adminService.openConfirmModal(text);
        modalInstance.result.then(function (data) {
            if(data){
                adminService.changeRole(selectedRole, id)
                    .success(function () {
                        adminService.allDoneHandler('User role successfully changed');
                    })
                    .error(function (err, status) {
                        adminService.changeRoleErrorHandler($scope.adminTabs[2], id, err, status);
                    });
            }else{
                adminService.changeRoleErrorHandler($scope.adminTabs[2], id);
            }
        });
    };

    self.init = function () {
        $scope.adminTabs = [
            {
                name:'tasks',
                levels : [1, 2, 3, 4, 5, 6, 7, 8],
                model: {}
            },
            {
                name: 'types'
            },
            {
                name :  'users',
                roles:['admin', 'user'],
                model: {}
            }
        ];
            $scope.adminTabs.forEach(function (tab) {
                $scope.init(tab);
            })

    };

    self.init();
}]);
