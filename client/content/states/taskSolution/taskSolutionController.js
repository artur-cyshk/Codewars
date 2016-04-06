app.controller('TaskSolutionCtrl', [ '$scope', '$rootScope','aceFactory','taskSolutionService','$stateParams','alertService', function($scope, $rootScope, aceFactory, taskSolutionService, $stateParams, alertService) {
    var self = this;
    $scope.test = function () {
        taskSolutionService.testSolution($stateParams.id, $scope.taskAceSolution.inner)
            .success(function (data) {
                $scope.output = {};
                $scope.output.data = data;
                $scope.output.index = 1;
            })
            .error(function (err, status) {
                if(status != 409) {
                    alertService.alert('server error, try later', 'error');
                }
            })
    };

    self.init = function () {
        $scope.taskAceSolution = {};
        $scope.taskAceSolution.config = aceFactory.getConfiguration(false, false, true, true, true);
        $scope.taskAceSolution.inner = taskSolutionService.getSolutionEntryText($scope.currentTask.entryPoint);
    };

    self.init();
}]);
