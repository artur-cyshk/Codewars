var app = angular.module('codewars', ['ui.router', 'ui.bootstrap', 'btford.socket-io', 'restangular']);

app.run(['checkAccessFactory','$rootScope', function(checkAccessFactory, $rootScope) {
    $rootScope.$on('$stateChangeStart', function(event, toState) {
        checkAccessFactory.checkAccess(event, toState);
    })
}]);