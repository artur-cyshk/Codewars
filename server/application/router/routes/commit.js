var connection = require('../../../configuration/database/connection');
module.exports = function (req, res, next) {
    if(req.session.authorized && req.body) {
         var query = 'INSERT into comments (user_id, task_id, comment, add_date)' +
            ' values ("' + req.session.userId + '","' + req.body.task + '","' +
             req.body.comment + '","' + new Date().toLocaleString() + '")';
        connection.query(query, function(err) {
            if(err){
                return next(true);
            }
            res.status(200).end();
        })
    }else{
        return next(true);
    }
};