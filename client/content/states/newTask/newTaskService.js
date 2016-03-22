app.factory('newTaskService', function ($http) {
    return {
        getTypes : function() {
            return $http.get('/types');
        }
    };
});