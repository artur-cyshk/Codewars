app.controller('TasksCtrl', [ '$scope', '$rootScope','tasksService','alertService', function($scope, $rootScope, tasksService, alertService) {

    var self = this;

    self.loadTasksFromServer = function(page, filter) {
        if(page == 0) {
            $scope.tasksOffset = 0;
        }
        tasksService.loadTasksWithPagination(page, filter)
            .then(
                function success(info) {
                    if(!_.isEmpty(info.tasks)) {
                        if(page == 0) {
                            $scope.loadedTasks = [];
                        }
                        $scope.loadedTasks = tasksService.concat($scope.loadedTasks, info.tasks);
                        $scope.tasksOffset += info.offset;
                    }
                    if(info.noMoreTasks) {
                        $scope.noMoreTasks = info.noMoreTasks;
                    }
                },
                function error(msg) {
                    alertService.alert(msg, 'error');
                }
            )
    };

    $scope.$watch('filter', function(filter) {
        if(filter) {
            self.loadTasksFromServer(0, filter);
        }
    }, true);

    $scope.loadMoreTasks = function() {
        self.loadTasksFromServer($scope.tasksOffset, $scope.filter);
    };

    self.init = function() {
        self.loadTasksFromServer(0);
    };

    self.init();
}]);
