'use strict';
angular.module('codewars').directive('linearSpinner', function () {
    return {
        restrict: 'E',
        scope: false,
        replace : true,
        templateUrl: './content/components/linearSpinner/linearSpinnerTemplate.html'
    };
});