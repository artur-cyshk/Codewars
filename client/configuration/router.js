app.config(['$urlRouterProvider', '$stateProvider', function($urlRouterProvider, $stateProvider) {
        $urlRouterProvider.otherwise('/home');
        $stateProvider
            .state('root',{
                abstract:true,
                templateUrl:'../content/states/root/rootTemplate.html',
                controller:'RootCtrl'
            })
            .state('root.home',{
                url : '/home',
                templateUrl: '../content/states/home/homeTemplate.html',
                controller : 'HomeCtrl',
                requiredAuthorization : false
            })
            .state('root.login', {
                url: '/login',
                templateUrl: '../content/states/login/loginTemplate.html',
                controller : 'LoginCtrl',
                requiredAuthorization : false
            })
            .state('root.registration', {
                url: '/registration',
                templateUrl: '../content/states/registration/registrationTemplate.html',
                controller : 'RegistrationCtrl',
                requiredAuthorization : false
            })
            .state('root.tasks', {
                url: '/tasks',
                templateUrl: '../content/states/tasks/tasksTemplate.html',
                controller : 'TasksCtrl',
                requiredAuthorization : false
            })
    }

]);