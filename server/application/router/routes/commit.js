var connection = require('../../../configuration/database/connection');
var async = require('async');
module.exports = function (req, res, next) {
    if(!req.session.authorized || !req.body || !req.body.task || isNaN(req.body.task)) {
        return next(true);
    }
    async.waterfall([
        function(callback){
            var commentObject = {
                'user_id' : req.session.userId,
                'task_id' : req.body.task,
                'comment' : req.body.comment,
                'add_date': new Date().toLocaleString()
            };
            var query = 'INSERT into comments set ?';
            connection.query(query,commentObject, function(err) {
                callback(err);
            })
        },
        function(callback){
            var query = 'select comments.comment_id as commentId, comments.user_id as userId, comments.comment, comments.add_date as commentAddDate, users.name as commentAuthor from comments' +
                ' join users using (user_id) where comment_id = LAST_INSERT_ID()';
            connection.query(query, function(err, comments) {
                if(!comments) {
                    callback(true);
                }else{
                    callback(err, comments[0]);
                }

            })
        }
    ], function (err, comment) {
        if(err) {
            return next(true);
        }
        res.status(200).send(comment);
    });
};