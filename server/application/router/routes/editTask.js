var connection = require('../../../configuration/database/connection');
var async = require('async');
var _ = require('lodash');
var taskService = require('../../services/taskService');
module.exports = function (req, res, next) {
    if(!req.session.authorized) {
        return next({status : 401});
    }
    if(!req.body || !req.params) {
        return next(true);
    }

    var task = req.body;
    async.waterfall([
        function(callback){
            if (!taskService.validate(task)) {
                return callback({
                    data : 'validation error!',
                    status : 409
                });
            }
            var updateTaskObject  = taskService.getTaskObject(task, req.session.userId);
            var query = 'UPDATE tasks set ? where task_id = ?';
            connection.query(query,[updateTaskObject, req.params.task],
                function(err) {
                    callback(err);
                })
        },
        function(callback) {
            var query = 'DELETE from tasks_types where task_id = ? ';
            connection.query(query, [req.params.task], function(err) {
                callback(err);
            });
        },
        function(callback) {
            var query = "INSERT INTO tasks_types (type_id, task_id) VALUES ?";
            connection.query(query,
                [taskService.mapTypes(task.types, req.params.task)],
                function(err) {
                    callback(err);
                });

        },
        function(callback) {
            var query = 'DELETE from tests where task_id = ? ';
            connection.query(query, [req.params.task], function(err) {
                callback(err);
            });
        },
        function(callback) {
            var query = "INSERT INTO tests (task_id, parameters, answer) VALUES ?";
            connection.query(query,
                [taskService.mapTests(task.tests, req.params.task)],
                function(err) {
                    callback(err);
                });
        }
    ], function (err) {
        if(err) {
            if(err.code == "ER_DUP_ENTRY") {
                err.data = "Task with this name already exists";
            }
            return next(err || true);
        }
        res.status(200).end();
    });
};