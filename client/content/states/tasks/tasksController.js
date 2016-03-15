app.controller('TasksCtrl', [ '$scope', '$rootScope','tasksService','alertService','$state','levelsFactory', function($scope, $rootScope, tasksService, alertService, $state, levelsFactory) {

    var self = this;

    $scope.openTask = function(taskId) {
        $state.go('root.task',{id:taskId});
    };

    $scope.loadTasksFromServer = function(page, filter) {
        $rootScope.loadingInformation = true;
        if(page == 0) {
            $scope.tasksOffset = 0;
        }
        tasksService.loadTasksWithPagination(page, filter)
            .then(
                function success(info) {
                    if(page == 0) {
                        $scope.loadedTasks = (_.isEmpty(info.tasks)) ? undefined : [] ;
                        $scope.loadedTasksEmpty = !$scope.loadedTasks;
                    }
                    if($scope.loadedTasks) {
                        $scope.loadedTasks = tasksService.concat($scope.loadedTasks, info.tasks);
                        $scope.tasksOffset += info.offset;
                    }

                    $scope.noMoreTasks = info.noMoreTasks;
                    $rootScope.loadingInformation = false;
                },
                function error(msg) {
                    alertService.alert(msg, 'error');
                    $rootScope.loadingInformation = false;
                }
            )
    };

    $scope.loadMoreTasks = function() {
        $scope.filter.name = "";
        $scope.loadTasksFromServer($scope.tasksOffset || 0, $scope.filter.getFilter() || null);
    };

    self.init = function() {
        $scope.mapColor = levelsFactory.mapColors;
    }

    self.init();
}]);
