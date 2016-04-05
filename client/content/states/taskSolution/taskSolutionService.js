angular.module('codewars').factory('taskSolutionService', function($http, alertService) {
    return {
        testSolution : function (taskId, solution) {
            return $http.post('/testSolution', {
                taskId : taskId,
                solution : solution
            });
        }
    }
});