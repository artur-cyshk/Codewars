'use strict';
angular.module('codewars').directive('tasksFilter', function ($rootScope) {
    return {
        restrict: 'E',
        scope: false,
        replace: true,
        templateUrl: './content/states/tasksFilter/tasksFilterTemplate.html',
        controller: function ($scope, alertService, tasksFilterService) {
            var self = this;

            self.Filter = function() {
                var self = this;
                this.filterModel = {};
                this.getFilter = function() {
                    return this.filterModel;
                };
                this.setDefaultFilter = function() {
                    this.filterModel = {};
                    this.filterModel.group = 'all';
                    return this;
                };
                this.setChooseProperties = function() {
                    tasksFilterService.getTypes()
                        .then(
                            function success(types) {
                                var filterProperties = {};
                                filterProperties.groups =(!$rootScope.authorized) ? ['all'] : ['all', 'own', 'later', 'favorite'];
                                filterProperties.types = types;
                                filterProperties.levels = Array.apply(null, {length: 8}).map(function(item, i) {return i + 1 });
                                filterProperties.sortBy = ['level', 'date', 'name'];
                                filterProperties.sortOrder = ['A-Z', 'Z-A'];
                                self.filterProperties = filterProperties;
                            },
                            function error(err) {
                                alertService.alert(err, 'error');
                            })
                };
            };

            $scope.clearFilter = function() {
                $scope.filter = $scope.filter.setDefaultFilter();
                $scope.loadTasksFromServer(0, $scope.filter.getFilter());
            };

            $scope.updateTasksByFilter = function() {
                $scope.loadTasksFromServer(0, $scope.filter.getFilter());
            };

            self.init = function() {
                $scope.filter = new self.Filter();
                $scope.filter = $scope.filter.setDefaultFilter();
                $scope.filter.setChooseProperties();
                $scope.loadTasksFromServer(0, $scope.filter.getFilter());
            };

            self.init();
        }
    }
});