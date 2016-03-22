app.factory('leadersService', function ($http) {
    return {
        getLeaders : function(offset){
            return $http.get('/leaders/' + offset);
        }
    };
});