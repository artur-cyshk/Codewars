var app = angular.module('codewars', ['ui.router', 'ui.bootstrap', 'btford.socket-io', 'restangular', 'ngAnimate']);

app.run(['checkAccessFactory','$rootScope', function(checkAccessFactory, $rootScope) {
    $rootScope.$on('$stateChangeStart', function(event, toState, toParams, fromState) {
        checkAccessFactory.checkAccess(event, toState, toParams, fromState);
    })
}]);