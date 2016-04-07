angular.module('codewars').factory('taskSolutionService', function($http, alertService) {
    return {
        testSolution : function (taskId, solution, finish) {
            return $http.post('/testSolution', {
                taskId : taskId,
                solution : solution,
                finish: finish
            });
        },
        getSolutionEntryText : function (entryPoint) {
            return 'function ' + entryPoint + '() {\n\n}';
        }
    }
});