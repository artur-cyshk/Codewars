angular.module('codewars').factory('taskSolutionService', function($http) {
    return {
        testSolution : function (taskId, solution, finish, level) {
            return $http.post('/testSolution', {
                taskId : taskId,
                solution : solution,
                finish : finish,
                level : level
            });
        },
        checkDoneTask : function (taskId) {
            return $http.get('/taskDone/'+ taskId);
        },
        getSolutionEntryText : function (entryPoint) {
            var comment = "// entry function name is " + entryPoint + "\n// don't remove it \n";
            return comment + 'function ' + entryPoint + '() {\n\t\n}';
        }
    }
});