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
            .state('root.newTask', {
                url: '/tasks/newTask',
                templateUrl: '../content/states/managementTask/managementTaskTemplate.html',
                controller : 'ManagementTaskCtrl',
                role : 'add',
                requiredAuthorization : true
            })
            .state('root.editTask', {
                url: '/task/{id}/editTask',
                templateUrl: '../content/states/managementTask/managementTaskTemplate.html',
                controller : 'ManagementTaskCtrl',
                role : 'edit',
                requiredAuthorization : true
            })
            .state('root.leaders', {
                url: '/leaders',
                templateUrl: '../content/states/leaders/leadersTemplate.html',
                controller : 'LeadersCtrl',
                requiredAuthorization : false
            })
            .state('root.task', {
                url: '/task/{id}',
                templateUrl: '../content/states/task/taskTemplate.html',
                controller : 'TaskCtrl',
                requiredAuthorization : false
            })
            .state('root.taskSolution', {
                url: '/task/{id}/taskSolution',
                templateUrl: '../content/states/taskSolution/taskSolutionTemplate.html',
                controller : 'TaskSolutionCtrl',
                requiredAuthorization : true
            })
            .state('root.admin', {
                url: '/admin',
                templateUrl: '../content/states/admin/adminTemplate.html',
                controller : 'AdminCtrl',
                requiredAuthorization : true,
                requiredRoot : true
            })
    }

]);