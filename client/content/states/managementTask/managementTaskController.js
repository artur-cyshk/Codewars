app.controller('ManagementTaskCtrl', [ '$scope', '$rootScope','managementTaskService','$state','$stateParams', function($scope, $rootScope, managementTaskService, $state, $stateParams) {

    var self = this;

    $scope.manageTask = function () {
        console.log($scope.managementTask.model);
    };

    self.init = function() {
        $scope.managementTask = new managementTaskService.TaskData($state.current.role, $stateParams.id);
        $scope.managementTask.getInformation();
    };

    self.init();
}]);
