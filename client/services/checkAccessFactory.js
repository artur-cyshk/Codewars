angular.module('codewars').factory('checkAccessFactory', function($rootScope, $state, $http, alertService) {
    return {
        checkAccess : function(event, toState, toParams, fromState) {
            $rootScope.$broadcast('changeState');
            var argLength = arguments.length;
            $rootScope.rootLoadingFinish = false;
            $http.get('/authorized')
                .success(function() {
                    $rootScope.authorized = true;
                    if(!argLength) {
                        $rootScope.firstLoadingFinish = true;
                        return;
                    }
                    if(toState.name == 'root.login' || toState.name == 'root.registration') {
                        $state.go('root.home');
                    }
                    $rootScope.rootLoadingFinish = true;


                })
                .error(function() {
                    $rootScope.authorized = false;
                    if(!argLength) {
                        $rootScope.firstLoadingFinish = true;
                        return;
                    }
                    if(toState.name == 'root.login' && fromState.requiredAuthorization){
                        toState.from = fromState.name;
                    }
                    if(toState.requiredAuthorization) {
                        alertService.alert('no access, login please', 'error');
                        $state.go('root.login');
                    }
                    $rootScope.rootLoadingFinish = true;

            });
        }
    }
});