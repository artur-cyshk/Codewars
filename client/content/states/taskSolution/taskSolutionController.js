app.controller('TaskSolutionCtrl', [ '$scope', '$rootScope','aceFactory','taskSolutionService','$stateParams','alertService', function($scope, $rootScope, aceFactory, taskSolutionService, $stateParams, alertService) {
    $scope.taskSolutionConfiguration = aceFactory.getConfiguration('aa',false,true,true,true);
    $scope.test = function () {
        taskSolutionService.testSolution($stateParams.id, $scope.taskAceSolution)
            .success(function (data) {
                $scope.info = data;
            })
            .error(function (err) {
                alertService.alert(err,'error');
            })
    }
}]);
