var connection = require('../../../configuration/database/connection');
var async = require('async');
var _ = require('lodash');
module.exports = function (req, res, next) {
    if(!req.session.authorized){
        return next({status : 401});
    }
    if(!req.params || !req.params.task || isNaN(req.params.task) ) {
        return next(true);
    }
    async.waterfall([
        function(callback){
            var query = 'SELECT tasks.task_id as taskId, tasks.name, tasks.description, tasks.entry_point as entryPoint'+
                ' FROM tasks' +
                ' where tasks.task_id = ? and tasks.user_id = ?';
            connection.query(query, [req.params.task, req.session.userId],
                function(err, tasks) {
                    if(!tasks.length) {
                        err = {};
                        err.data = {'data' : "no access or task doesn't exist "};
                    }
                    callback(err, tasks[0]);
            })
        },
        function(task, callback){
            var query = 'SELECT languages.name ,languages.language_id as languageId'+
                ' FROM languages' +
                ' join tasks using(language_id)' +
                ' where tasks.task_id = ?';
            connection.query(query,[task.taskId],
                function(err, languages) {
                    task.language = languages[0];
                    callback(err, task);
            })
        },
        function(task, callback){
            var query = 'select types.type_name as name, types.type_id as typeId' +
                ' from types' +
                ' join tasks_types using(type_id)' +
                ' where tasks_types.task_id = ?';
            connection.query(query, [task.taskId],
                function(err, types) {
                    if(!_.isEmpty(types)){
                        task.types = types;
                    }
                    callback(err, task);
            })
        },
        function(task, callback){
            var query = 'select tests.test_id as testId, tests.parameters as variables, tests.answer as result' +
                ' from tests' +
                ' where tests.task_id = ?';
            connection.query(query, [task.taskId],
                function(err, tests) {
                    if(_.isArray(tests)){
                        _.map(tests, function(item){
                            item.variables =
                                (item.variables) ?
                                    _.map(item.variables.split(','), function(variable) {
                                        return {
                                            value : variable
                                        }
                                    }) : [];
                            return item;
                        });
                        task.tests = tests;
                    }
                    callback(err, task);
            })
        }
    ], function (err, task) {
        if(err) {
            return next(err.data || true);
        }
        res.status(200).send(task);
    });
};