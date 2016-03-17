angular.module('codewars').factory('checkAccessFactory', function($rootScope, $state, $http, alertService) {
    var self = this;
    self.loginStateFormating = function(toState, fromState, fromParams, logout) {

        var requireMemory = (
            !fromState.abstract && fromState.name != 'root.registration' && !(logout)
        );

        if(requireMemory){
            toState.from = fromState.name ;
            toState.paramsTo = fromParams;
        }else{
            if(logout) {
                delete toState.from;
                delete toState.paramsTo;
            }
        }
        return {
            from : toState.from,
            paramsTo : toState.paramsTo
        };
    };

    self.setRootScope = function(value, param){
        $rootScope[param] = value;
    };

    return {
        checkAccess : function(event, toState, toParams, fromState, fromParams) {
            var argLength = arguments.length;
            $rootScope.$broadcast('changeState');
            self.setRootScope(false,'rootLoadingFinish');

            $http.get('/authorized')
                .success(function(userData) {
                    self.setRootScope(true,'authorized');
                    self.setRootScope(userData.userId, 'currUserId');

                    if(!argLength) {
                        self.setRootScope(true, 'firstLoadingFinish');
                        return;
                    }

                    self.setRootScope(true, 'rootLoadingFinish');

                    if(toState.requiredRoot) {
                        if(userData.type != 'admin') {
                            alertService.alert('no access, need root', 'error');
                            $state.go('root.home');
                        }
                    }

                    self.setRootScope((userData.type == 'admin' ), 'adminRoot');

                    if(toState.name == 'root.login' || toState.name == 'root.registration') {
                        $state.go('root.home');
                    }
                })
                .error(function() {

                    self.setRootScope(false, 'authorized');

                    if(!argLength) {
                        self.setRootScope(true, 'firstLoadingFinish');
                        return;
                    }
                    self.setRootScope(true, 'rootLoadingFinish');
                    if(toState.name == 'root.login') {
                        var params = self.loginStateFormating(toState, fromState, fromParams, $rootScope.logout);
                        $rootScope.logout = false;
                        toState.from = params.from;
                        toState.paramsTo = params.paramsTo;
                    }

                    if(toState.requiredAuthorization) {
                        if(!$rootScope.logout){
                            alertService.alert('no access, login please', 'error');
                        }
                        $state.go('root.login');
                    }

            });
        }
    }
});