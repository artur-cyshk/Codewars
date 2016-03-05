'use strict';
angular.module('codewars').directive('changeProfile', function ($rootScope) {
    return {
        restrict: 'E',
        scope: false,
        replace: true,
        templateUrl: './content/states/changeProfile/changeProfileTemplate.html',
        controller: function ($scope) {
            $scope.status = {};
        }
    }
});