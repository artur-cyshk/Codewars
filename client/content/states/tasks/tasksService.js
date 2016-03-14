angular.module('codewars').factory('tasksService', function($http , $q) {
    return {
        concat : function(before, to) {
            return before.concat(to);
        },
        loadTasksWithPagination: function (from, filter) {
            return $q(function (resolve, reject) {
                var TASKS_OFFSET = 20;
                if (!filter || !_.every(filter)) {
                    filter = null;
                }
                var data = {
                    fromItem: from,
                    filter: filter
                };
                $http.post('/tasks', data)
                    .success(function (tasks) {
                        var noMoreTasks = false;
                        if (!_.isEmpty(tasks)) {
                            if (tasks.length <= TASKS_OFFSET) {
                                noMoreTasks = true;
                            } else {
                                tasks = tasks.splice(0, tasks.length - 1);
                            }
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