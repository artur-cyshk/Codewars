var connection = require('../../../configuration/database/connection');
module.exports = function (req, res, next) {
    if(req.session.authorized && req.params) {
        var query = 'DELETE from comments where user_id = ? and comment_id = ?';
        connection.query(query,[req.session.userId, req.params.id],
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