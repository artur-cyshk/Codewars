var app = angular.module('codewars', ['ui.router', 'ui.bootstrap', 'btford.socket-io', 'ngAnimate', 'angular-svg-round-progress']);

app.run(['checkAccessFactory','$rootScope','$http', function(checkAccessFactory, $rootScope) {
    checkAccessFactory.checkAccess();
    $rootScope.$on('$stateChangeStart', function(event, toState, toParams, fromState) {
        checkAccessFactory.checkAccess(event, toState, toParams, fromState);
    });
}]);