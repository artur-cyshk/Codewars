app.controller('RemovingTaskCtrl', [ '$scope','removingTaskService','taskId','alertService','$state','$uibModalInstance', function($scope, removingTaskService, taskId, alertService, $state, $uibModalInstance) {
    $scope.deleteTask = function () {
        removingTaskService.removeTask(taskId)
            .success(function () {
                alertService.alert('Task removed success', 'success');
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

}]);
