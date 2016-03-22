app.factory('loginService', function ($http) {
    return {
        login : function(user) {
            return $http.post('/login', user);
        }
    };
});