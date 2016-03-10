angular.module('codewars').factory('checkAccessFactory', function($rootScope, $state, $http, alertService) {
    return {
        checkAccess : function(event, toState, toParams, fromState, fromParams) {
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
                    $rootScope.rootLoadingFinish = true;
                    if(toState.name == 'root.login' || toState.name == 'root.registration') {
                        $state.go('root.home');
                    }
                })
                .error(function() {
                    $rootScope.authorized = false;
                    if(!argLength) {
                        $rootScope.firstLoadingFinish = true;
                        return;
                    }
                    $rootScope.rootLoadingFinish = true;
                    if(toState.name == 'root.login' && fromState.requiredAuthorization){
                        console.log(fromState);
                        toState.from = fromState.name;
                        toState.paramsTo = fromParams;
                    }
                    if(toState.requiredAuthorization) {
                        alertService.alert('no access, login please', 'error');
                        $state.go('root.login');
                    }
            });
        }
    }
});