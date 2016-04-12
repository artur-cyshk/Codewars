app.controller('TaskSolutionCtrl', [ '$scope', '$rootScope','codeConfigurationFactory','taskSolutionService','$stateParams','alertService','$state', function($scope, $rootScope, codeConfigurationFactory, taskSolutionService, $stateParams, alertService, $state) {
    var self = this;
    $scope.test = function (finish) {
        $rootScope.loadingInformation = true;
        taskSolutionService.testSolution($scope.currentTask.taskId, $scope.codeSolution.inner, finish, $scope.currentTask.level)
            .success(function (data) {
                $scope.output = {};
                $scope.output.data = data;
                $scope.output.index = 1;
                if(data.allDone) {
                    $rootScope.$broadcast('changeHonor', data.addedHonor);
                    alertService.alert('well done, your honor + ' + data.addedHonor, 'success');
                    $state.go('root.tasks');
                }
                $rootScope.loadingInformation = false;
            })
            .error(function (err, status) {
                if(status != 409) {
                    alertService.alert('server error, try later', 'error');
                }
                $rootScope.loadingInformation = false;
            })
    };

    self.init = function () {
        $scope.codeSolution = {};
        $scope.codeSolution.config = codeConfigurationFactory.getConfiguration(false);
        $scope.codeSolution.inner = taskSolutionService.getSolutionEntryText($scope.currentTask.entryPoint);
        $rootScope.loadingInformation = true;
        taskSolutionService.checkDoneTask($scope.currentTask.taskId)
            .success(function () {
                if(status != 409) {
                    $scope.userCanDo = true;
                }
                $rootScope.loadingInformation = false;
            })
            .error(function (err, status) {
                if(status != 409) {
                    alertService.alert(err || 'server error, try later', 'error');
                    $state.go('root.task.information', {
                        id: $stateParams.id
                    });
                }
                $rootScope.loadingInformation = false;
            });
    };

    self.init();
}]);
