angular.module('codewars').factory('removingTaskService', function($http) {
    return {
        removeTask : function (id) {
            return $http.delete('/deleteTask/' + id);
        }
    }
});