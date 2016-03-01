app.config(['$urlRouterProvider', '$stateProvider', function($urlRouterProvider, $stateProvider) {
        $urlRouterProvider.otherwise('/home');
        $stateProvider
            .state('home',{
                url : '/home',
                templateUrl: '../content/home/homeTemplate.html',
                controller : 'HomeCtrl',
                requiredAuthorization : true
            })
            .state('login', {
                url: '/login',
                templateUrl: '../content/login/loginTemplate.html',
                controller : 'LoginCtrl',
                requiredAuthorization : false
            });
    }

]);