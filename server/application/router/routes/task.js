var connection = require('../../../configuration/database/connection');
var async = require('async');
module.exports = function (req, res, next) {
    if(!req.params || !req.params.task || isNaN(req.params.task) ){
        next(true);
    }
    async.waterfall([
        function(callback){
            var query = 'SELECT tasks.task_id as taskId, tasks.name, tasks.level, tasks.description, tasks.language, tasks.add_date as taskAddDate,'+
                ' users.name as creator' +
                ' FROM codewars_db.tasks' +
                ' left join users using(user_id)' +
                ' where tasks.task_id = "' + req.params.task + '"';
            connection.query(query, function(err, tasks) {
                if(!tasks.length){
                    err = {};
                    err.data = {'data' : "a task doesn't exist "};
                }
                callback(err, tasks[0]);
            })
        },
        function(task, callback){
            if(req.session.authorized) {
                var query = 'INSERT into watchings (user_id, task_id)' +
                    ' values ("' + req.session.userId + '","' + req.params.task + '")';
                connection.query(query, function(err) {
                    if(err && err.code == 'ER_DUP_ENTRY'){
                        err = null;
                        task.watchCountUp = false;
                    }else{
                        task.watchCountUp = true;
                    }
                    callback(err, task);
                })
            }else{
                callback(null, task);
            }
        },
        function(task, callback){
            var query = 'select COUNT(watchings.watch_id) as watchingCount from watchings where task_id = "' + req.params.task + '"';
            connection.query(query, function(err, data) {
                if(data){
                    task.watchingCount = data[0].watchingCount;
                }
                callback(err, task);
            })
        },
        function(task, callback){
            var query = 'select COUNT(likes.like_id) as likesCount from likes where task_id = "' + req.params.task + '"';
            connection.query(query, function(err, data){
                if(data){
                    task.likesCount = data[0].likesCount;
                }
                callback(err, task);
            })
        },
        function(task, callback){
            var query = 'select comments.comment, comments.add_date as commentAddDate, users.name as commentAuthor from comments' +
                ' join users using (user_id) where task_id = "' + req.params.task + '" order by comments.add_date DESC';
            connection.query(query, function(err, comments){
                if(comments){
                    task.comments = comments;
                }
                callback(err, task);
            })
        },
        function(task, callback) {
            var query = 'select types.type_name from types join tasks_types using(type_id)' +
                ' where task_id = "' + req.params.task + '"';
            connection.query(query, function(err, types) {
                if(types){
                    task.types = types;
                }
                callback(err, task);
            })
        },
        function(task, callback) {

            if(req.session.authorized) {
                var query = 'select likes.like_id from likes where task_id = "'
                    + req.params.task + '" and user_id = "' + req.session.userId + '"';
                connection.query(query, function (err, like) {
                    if(like){
                        task.canLike = !like.length;
                    }
                    callback(err, task);
                })
            }else {
                callback(null, task);
            }
        },
        function(task, callback) {
            if(req.session.authorized) {
                var query = 'select favorite_id from favorites_tasks where task_id = "'
                    + req.params.task + '" and user_id = "' + req.session.userId + '"';
                connection.query(query, function (err, favorite) {
                    if(favorite){
                        task.canFavorite = !favorite.length;
                    }
                    callback(err, task);
                })
            }else{
                callback(null,task);
            }
        },
        function(task, callback) {
            if(req.session.authorized) {
                var query = 'select later_id from later_tasks where task_id = "'
                    + req.params.task + '" and user_id = "' + req.session.userId + '"';
                connection.query(query, function (err, later) {
                    if(later){
                        task.canLater = !later.length;
                    }
                    callback(err, task);
                })
            }else{
                callback(null,task);
            }
        },
        function(task, callback) {
            if(req.session.authorized) {
                var query = 'select solutions.solution_id from solutions' +
                    ' where task_id = "' + req.params.task + '" and user_id = "' +
                    req.session.userId + '"';
                connection.query(query, function(err, data) {
                    if(data.length) {
                        var query = 'select solutions.solution_text,users.name, solutions.add_date from solutions' +
                            ' join users using(user_id) where task_id = ' + req.params.task + ' order by solutions.add_date DESC';
                        connection.query(query, function(err, solutions) {
                            if(solutions){
                                task.solutions = solutions;
                            }
                            callback(err, task);
                        })
                    }else {
                        callback(null, task);
                    }

                })
            }else {
                callback(null, task);
            }
        }
    ], function (err, task) {
        if(err) {
            return next(err.data || true);
        }
        res.status(200).send(task);
    });
};