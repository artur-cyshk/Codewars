var connection = require('../../../configuration/database/connection');
module.exports = function (req, res, next) {
    if(req.session.authorized && req.params) {
        var query = 'DELETE from comments where user_id = "' + req.session.userId + '"' +
            ' and comment_id = "' + req.params.id + '"';
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