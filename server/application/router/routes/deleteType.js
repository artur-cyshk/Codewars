var connection = require('../../../configuration/database/connection');
module.exports = function (req, res, next) {
    if(req.session.currUserRole != 'admin'){
        return next({
            'status' : 409
        })
    }
    if(req.session.authorized && req.params) {
        var query = 'DELETE from types where type_id = ? ';
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