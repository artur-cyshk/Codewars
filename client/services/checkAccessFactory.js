angular.module('codewars').factory('checkAccessFactory', function($rootScope, $state, $http, alertService) {
    return {
        checkAccess : function(event, toState, toParams, fromState) {
                $rootScope.rootLoading = true;
                $http.get('/authorized').success(function(id) {
                    $rootScope.userId = id;
                    if(toState.name == 'root.login' || toState.name == 'root.registration'){
                        $state.go('root.home');
                    }
                    $rootScope.rootLoading = false;
                    $rootScope.access = true;
                }).error(function() {
                    if(toState.name == 'root.login' && fromState.requiredAuthorization){
                        toState.from = fromState.name;
                    }
                    if(toState.requiredAuthorization) {
                        alertService.alert('no access, login please', 'error');
                        $state.go('root.login');
                    }
                    $rootScope.rootLoading = false;
                });
        }
    }
});