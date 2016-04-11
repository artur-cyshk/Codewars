'use strict';
app.directive('tasksFilter', function () {
    return {
        restrict: 'E',
        scope: false,
        replace: true,
        templateUrl: './content/states/tasksFilter/tasksFilterTemplate.html',
        controller: function ($scope, tasksFilterService) {
            var self = this;

            $scope.clearFilter = function() {
                $scope.filter = $scope.filter.setDefaultFilter();
                $scope.loadTasksFromServer(0, $scope.filter.getFilter());
            };

            $scope.updateTasksByFilter = function() {
                $scope.loadTasksFromServer(0, $scope.filter.getFilter());
            };

            self.init = function() {
                $scope.filter = new tasksFilterService.Filter();
                $scope.filter = $scope.filter.setDefaultFilter();
                $scope.filter.setChooseProperties();
                $scope.loadTasksFromServer(0, $scope.filter.getFilter());
            };

            self.init();
        }
    }
});