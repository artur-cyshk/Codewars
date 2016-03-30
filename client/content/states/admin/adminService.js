app.factory('adminService', function () {
    
    return {
        getUsersInfo : function () {
            return $http.get('/users');
        },
        getTypes : function () {
            return $http.get('/types');
        },
        getNullLevelTasks : function () {
            return $http.get('/nullTasks');
        }
    }

});