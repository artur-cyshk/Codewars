angular.module('codewars').factory('checkAccessFactory', function($rootScope, $state, $http) {
    return {
        checkAccess : function(event, toState) {
                $rootScope.rootLoading = true;
                $http.get('/authorized').success(function() {
                    if(toState.name == 'root.login' || toState.name == 'root.registration'){
                        $state.go('root.home');
                    }
                    $rootScope.rootLoading = false;
                }).error(function() {
                    if(toState.requiredAuthorization) {
                        $state.go('root.login');
                    }
                    $rootScope.rootLoading = false;
                });
        }
    }
});