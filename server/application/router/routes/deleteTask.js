var connection = require('../../../configuration/database/connection');
module.exports = function (req, res, next) {
    if(req.session.authorized && req.params) {
        var whereEnd = (req.session.currUserRole == 'admin') ? '' : ' and tasks.user_id = "' + req.session.userId + '"';
        var query = 'DELETE from tasks where task_id = ? ' + whereEnd;
        connection.query(query,[req.params.task],
            function(err, result) {
                if(err || !result.affectedRows) {
                    return next(true);
                }
                res.status(200).end();
            })
    }else {
        return next(true);
    }
};