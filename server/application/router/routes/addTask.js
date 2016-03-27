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
            var query = 'INSERT into tasks (name, description, user_id, language_id, add_date, entry_point) VALUES ("' +
                task.name + '","' + task.description + '","' + req.session.userId + '","' + task.language.languageId +
                    '","' + new Date().toLocaleDateString() + '","' + task.entryPoint + '")';
            connection.query(query, function(err) {
                console.log(err);
                callback(err);
            })
        },
        function(callback){
            var query = 'select task_id as taskId from tasks' +
                ' where task_id = LAST_INSERT_ID()';
            connection.query(query, function(err, tasks) {
                callback(err || _.isEmpty(tasks), tasks[0].taskId);
            })
        },
        function(callback, taskId) {
            if(task.additionalType) {
                var query = 'insert into types (type_name) VALUES ("' + task.additionalType.name + '")';
                connection.query(query, function(err) {
                    callback(err, taskId, true);
                })
            }else {
                callback(taskId);
            }
        },
        function(callback, taskId, wasTypeInserted) {
            if(wasTypeInserted) {
                var query = 'select type_id as typeId from types' +
                    ' where type_id = LAST_INSERT_ID()';
                connection.query(query, function(err, types) {
                    callback(err ||  _.isEmpty(types),taskId, types[0].typeId);
                })
            }else{
                callback(taskId);
            }
        },
        function(callback, taskId, typeId) {
            var query = "insert into tasks_types VALUES"
        },
    ], function (err, task) {
        if(err) {
            return next(err.data || true);
        }
        res.status(200).send(task);
    });
}