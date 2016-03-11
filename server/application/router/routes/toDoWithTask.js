var connection = require('../../../configuration/database/connection');
module.exports = function (req, res, next) {
    if(req.session.authorized && req.body) {
        var query;
        switch(req.body.currentState) {
            case true :
                query = 'INSERT into ' + req.body.stateName + ' (user_id, task_id)' +
                    ' values ("' + req.session.userId + '","' + req.body.task + '")';
                break;
            case false :
                query = 'DELETE from ' + req.body.stateName +
                    ' where user_id = "' + req.session.userId + '" and task_id = "' + req.body.task + '"';
                break;
            default:
                return next(true);
                break;

        }
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