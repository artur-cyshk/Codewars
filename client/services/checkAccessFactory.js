angular.module('codewars').factory('checkAccessFactory', function($rootScope, $state, $http) {
    return {
        checkAccess : function(event, toState) {
            if(toState.requiredAuthorization) {
                $rootScope.rootLoading = true;
                $http.get('/authorized').success(function() {
                    $rootScope.rootLoading = false;
                }).error(function() {
                    $rootScope.rootLoading = false;
                    $state.go('login');
                });
            }
        }
    }
});