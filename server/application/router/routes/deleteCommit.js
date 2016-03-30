var connection = require('../../../configuration/database/connection');
module.exports = function (req, res, next) {
    if(req.session.authorized && req.params) {
        var whereEnd = (req.session.currUserRole == 'admin') ? '' : ' and user_id = "' + req.session.userId + '"';
        var query = 'DELETE from comments where comment_id = ? ' + whereEnd;
        connection.query(query,[req.params.id],
            function(err) {
                if(err){
                    return next(true);
                }
                res.status(200).end();
            })
    }else {
        return next(true);
    }
};