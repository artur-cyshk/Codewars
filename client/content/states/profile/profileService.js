app.factory('profileService', function ($http) {
    return {
        getUser : function() {
            return $http.get('/user');
        },
        logout : function() {
            return $http.get('/logout');
        }
    };
});