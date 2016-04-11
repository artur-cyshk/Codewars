app.factory('taskSolutionService', function($http) {
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
            return 'function ' + entryPoint + '() {\n\t\n}';
        }
    }
});