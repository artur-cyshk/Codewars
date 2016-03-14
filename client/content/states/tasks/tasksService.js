angular.module('codewars').factory('tasksService', function($http , $q) {
    return {
        concat : function(before, to) {
            return before.concat(to);
        },
        loadTasksWithPagination: function (from, filter) {
            return $q(function (resolve, reject) {
                var TASKS_OFFSET = 20;
                var data = {
                    fromItem: from,
                    filter: filter
                };
                $http.post('/tasks', data)
                    .success(function (tasks) {
                        var noMoreTasks =(_.isEmpty(tasks) || tasks.length <= TASKS_OFFSET);
                        if  (!noMoreTasks) {
                            tasks = tasks.splice(0, tasks.length - 1);
                        }
                        resolve({
                            tasks: tasks,
                            offset: TASKS_OFFSET,
                            noMoreTasks: noMoreTasks
                        });
                    })
                    .error(function () {
                        reject('server error, try later', 'error');
                    });
            })
        }
    }
});