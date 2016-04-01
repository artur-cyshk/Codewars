app.factory('adminService', function ($q, $http, $uibModal, $templateCache, alertService, $rootScope) {
    
    return {
        openConfirmModal : function (text) {
            return $uibModal.open({
                animation: true,
                templateUrl: 'content/states/admin/confirmModal/confirmTemplate.html',
                controller: 'ConfirmCtrl',
                size: 'sm',
                resolve: {
                    modalText: function () {
                        return text;
                    }
                }
            });
        },
        getText : function (tab, name, selected) {
            switch (tab){
                case 'level':
                    return "Selected task : <span class='name'>" + _.capitalize(name) + "</span><br> Selected level : <span class='name'>" + selected +
                    "<span class='name'>" ;
                    break;
                case 'role':
                    return "Selected user : <span class='name'>" + _.capitalize(name) + "</span><br> Selected role : <span class='name'>" + selected +
                    "<span class='name'>" ;
                    break;
                case 'newType':
                    return "New type : <span class='name'>" + name + '</span>';
                    break;
                case 'removeType':
                    return "Task to remove : <span class='name'>" + name +  "</span>";
                    break;
            }
        },
        changeErrorHandler : function (err, status) {
            if(status != 409) {
                alertService.alert(err || 'Server error, try later', 'error');
            }
            $rootScope.loadingInformation = false;
        },
        addErrorHandler : function (err) {
            if(err.status != 409) {
                alertService.alert(err.mes, 'error');
            }
            $rootScope.loadingInformation = false;
        },
        changeLevelErrorHandler : function (tab, id, err, status) {
            delete tab.model[id];
            if(err || status) {
                return this.changeErrorHandler(err, status);
            }
        },
        blurTypeAddInput : function (selector) {
            angular.element(selector).blur();
        },
        changeRoleErrorHandler : function (tab, id, err, status) {
            tab.model[id] = (tab.model[id] == 'admin') ? 'user' : 'admin';
            if(err || status) {
                return this.changeErrorHandler(err, status);
            }
        },
        allDoneHandler : function (text) {
            $rootScope.loadingInformation = false;
            alertService.alert(text, 'success');
        },
        changeRole : function (role, id) {
            return $http.put('/user/'+id, { role : role});
        },
        changeLevel : function (level, id) {
            return $http.put('/task/level/'+id, { level : level});
        },
        addType : function (type) {
            return $http.post('/type/', { name : type});
        },
        removeType : function (id) {
            return $http.delete('/type/'+ id);
        },
        getUsersInfo : function (from) {
            return this.getInfoWithPagination(function () {
                return $http.get('/users/' + from)
            });
        },
        getTypes : function (from) {
            return this.getInfoWithPagination(function () {
                return $http.get('/typesWithLimit/' + from);
            }, true);
        },
        getNullLevelTasks : function (from) {
            return this.getInfoWithPagination(function () {
                return $http.get('/nullTasks/' + from)
            });
        },
        concat : function(before, to) {
            return before.concat(to);
        },
        getInfoWithPagination : function (tabFunction, isTypes) {
            return $q(function (resolve, reject) {
                var ITEM_OFFSET =(isTypes) ? 100 : 10;
                tabFunction()
                    .success(function (items) {
                        var noMoreItems = (_.isEmpty(items) || items.length <= ITEM_OFFSET);
                        if (!noMoreItems) {
                            items = items.splice(0, items.length - 1);
                        }
                        resolve({
                            items: items,
                            offset: ITEM_OFFSET,
                            noMoreItems: noMoreItems
                        });
                    })
                    .error(function (err, status) {
                        reject({
                            mes : err || 'server error, try later',
                            status : status
                        });
                    });
            })
        }
    }

});