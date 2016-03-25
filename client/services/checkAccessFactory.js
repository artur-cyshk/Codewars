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
                    if(!argLength) {
                        self.setRootScope(true, 'firstLoadingFinish');
                    }else {
                        self.setRootScope(true, 'rootLoadingFinish');
                        if(toState.requiredRoot) {
                            if(userData.type != 'admin') {
                                alertService.alert('no access, need root', 'error');
                                $state.go('root.home');
                            }
                        }
                        if(toState.name == 'root.login' || toState.name == 'root.registration') {
                            $state.go('root.home');
                        }
                    }
                    self.setRootScope(userData.userId, 'currUserId');
                    self.setRootScope((userData.type == 'admin' ), 'adminRoot');
                    self.setRootScope(true,'authorized');
                })
                .error(function() {
                    if(!argLength) {
                        self.setRootScope(true, 'firstLoadingFinish');
                    }else{
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
                    }
                    self.setRootScope(undefined, 'currUserId');
                    self.setRootScope(undefined, 'adminRoot');
                    self.setRootScope(false, 'authorized');
            });
        }
    }
});