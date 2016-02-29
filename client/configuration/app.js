var app = angular.module('codewars', ['ui.router', 'ui.bootstrap', 'btford.socket-io', 'restangular']);


app.run(function($http, $state) {
    console.log('z');
    $http.get('/authorized').success(function() {
        $state.go('home');
    }).error(function() {
        $state.go('login');
    })
});