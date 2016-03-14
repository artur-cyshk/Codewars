app.controller('TasksCtrl', [ '$scope', '$rootScope','tasksService','alertService', function($scope, $rootScope, tasksService, alertService) {

    var self = this;

    self.loadTasksFromServer = function(page, filter) {
        $rootScope.loadingInformation = true;
        if(page == 0) {
            $scope.tasksOffset = 0;
            $scope.noMoreTasks = false;
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
                    $rootScope.loadingInformation = false;
                },
                function error(msg) {
                    alertService.alert(msg, 'error');
                    $rootScope.loadingInformation = false;
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
