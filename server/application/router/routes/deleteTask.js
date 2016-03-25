var connection = require('../../../configuration/database/connection');
module.exports = function (req, res, next) {
    if(req.session.authorized && req.params) {
        var query = 'DELETE from tasks where user_id = "' + req.session.userId + '"' +
            ' and task_id = "' + req.params.task + '"';
        connection.query(query, function(err) {
            if(err){
                return next(true);
            }
            res.status(200).end();
        })
    }else {
        return next(true);
    }
};