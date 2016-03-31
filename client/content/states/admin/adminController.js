app.controller('AdminCtrl', [ '$scope', '$rootScope', 'adminService', 'alertService', function($scope, $rootScope, adminService, alertService) {
    var self = this;

    self.successAddingItemsFunction = function (tab, init) {
        return function (response) {
            tab.items = (init) ? response.items : adminService.concat(tab.items, response.items);
            tab.fromItems = (init) ? response.offset : tab.fromItems + response.offset;
            tab.noMoreItems = response.noMoreItems;
            $rootScope.loadingInformation = false;
        }
    };

    self.errorAddingItemsFunction = function (err) {
        $rootScope.loadingInformation = false;
        alertService.alert(err, 'error');
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
            .then(self.successAddingItemsFunction(tab, init), self.errorAddingItemsFunction);
        if($event) {
            $event.stopPropagation();
        }
    };

    $scope.init = function(tab) {
        $scope.loadItems(tab, 0, true);
    };

    self.init = function () {
        $scope.adminTabs = [{name:'tasks'},{name: 'types'},{name :  'users'}];
        $scope.adminTabs.forEach(function (tab) {
            $scope.init(tab);
        })
    };

    self.init();
}]);
