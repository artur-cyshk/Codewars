var connection = require('../../../configuration/database/connection');
var async = require('async');
var _ = require('lodash');
var taskService = require('../../services/taskService');
module.exports = function (req, res, next) {
    if(!req.session.authorized) {
        return next({status : 401});
    }
    if(!req.body) {
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

            var insertTaskObject  = taskService.getTaskObject(task, req.session.userId);
            var query = 'INSERT into tasks set ?';
            connection.query(query,insertTaskObject,
                function(err) {
                    callback(err);
            })
        },
        function(callback){
            var query = 'select task_id as taskId from tasks' +
                ' where task_id = LAST_INSERT_ID()';
            connection.query(query, function(err, tasks) {
                callback(err || !_.isArray(tasks), tasks[0].taskId);
            })
        },
        function(taskId, callback) {
            var query = "INSERT INTO tasks_types (type_id, task_id) VALUES ?";
            connection.query(query,
                [taskService.mapTypes(task.types, taskId)],
                function(err) {
                    callback(err, taskId);
                });
        },
        function(taskId, callback) {
            var query = "INSERT INTO tests (task_id, parameters, answer) VALUES ?";

            connection.query(query,
                [taskService.mapTests(task.tests, taskId)],
                function(err) {
                    callback(err);
                });
        }
    ], function (err, task) {
        if(err) {
            if(err.code == "ER_DUP_ENTRY") {
                err.data = "Task with this name already exists";
            }
            return next(err || true);
        }
        res.status(200).send(task);
    });
};