app.controller('RemovingTaskCtrl', [ '$scope','$rootScope', 'removingTaskService','managementTaskService', 'taskId','creatorId', 'alertService','$state','$uibModalInstance', function($scope, $rootScope, removingTaskService, managementTaskService, taskId, creatorId, alertService, $state, $uibModalInstance) {
    var self = this;
    $scope.deleteTask = function () {
        removingTaskService.removeTask(taskId)
            .success(function () {
                alertService.alert('Task successfully removed', 'success');
                managementTaskService.addHonor($scope.HONOR_BY_REMOVE, creatorId)
                    .success(function () {
                        if($rootScope.currUserId == creatorId) {
                            alertService.alert('honor ' + $scope.HONOR_BY_REMOVE, 'error');
                            $rootScope.$broadcast('changeHonor', $scope.HONOR_BY_REMOVE);
                        }
                    });
                $uibModalInstance.dismiss('cancel');
                $state.go('root.tasks');
            })
            .error(function () {
                $uibModalInstance.dismiss('cancel');
                alertService.alert('Error while removing, try later', 'error');
            })
    };

    $scope.cancel = function () {
       $uibModalInstance.dismiss('cancel');
    };

    self.init = function () {
        $scope.HONOR_BY_REMOVE = -5;
    };

    self.init();
}]);
