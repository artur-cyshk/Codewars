'use strict';
angular.module('codewars').directive('profile', function ($rootScope) {
    return {
        restrict: 'E',
        scope: false,
        replace : true,
        templateUrl: './content/states/menu/profileTemplate.html',
        controller: function ($scope) {
            $scope.$watch('openedProfile', function(value) {
                if(value != undefined){
                    $scope.profileVisible = value;
                }
            });
        }
    };
});