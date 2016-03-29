var connection = require('../../../configuration/database/connection');
var async = require('async');
var _ = require('lodash');
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
            //validatation
            var insertTaskObject  = {
                name : task.name,
                description : task.description,
                user_id : req.session.userId,
                language_id : task.language.languageId,
                add_date : new Date().toLocaleString(),
                entry_point : task.entryPoint
            };
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
            var query = "INSERT INTO tasks_types (type_id, task_id) VALUES ?",
                values = [];
            values = _.map(task.types, function(type){
                return  [type.typeId, taskId];
            });
            connection.query(query, [values], function(err) {
                callback(err, taskId);
            });
        },
        function(taskId, callback) {
            var query = "INSERT INTO tests (task_id, parameters, answer) VALUES ?",
                values = [];

            values = _.map(task.tests, function(test){
                test.variables =_.map(test.variables, function (variable) {
                    return variable.value;
                });
                test.variables = _.filter(test.variables, function (variable) {
                    return variable;
                });
                return  [taskId, test.variables.join(','), test.result];
            });

            connection.query(query, [values], function(err) {
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