var connection = require('../../../configuration/database/connection');
module.exports = function (req, res, next) {
    if(req.session.currUserRole != 'admin') {
        return next({
            'status' : 409
        })
    }
    if(!req.body || !req.params || !req.body.role || !req.params.id) {
        return next(true);
    }

    var query = 'UPDATE users set ? where user_id = ? ';
    connection.query(query,[{type : req.body.role}, req.params.id],
        function(err) {
            if(err){
                return next(true);
            }
            res.status(200).end();
        })
};