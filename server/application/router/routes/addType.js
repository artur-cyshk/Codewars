var connection = require('../../../configuration/database/connection');
var async = require('async');
module.exports = function (req, res, next) {
    if(req.session.currUserRole != 'admin'){
        return next({
            'status' : 409
        })
    }
    if(!req.body || !req.body.name || req.body.name.length < 1) {
        return next(true);
    }

    var query = 'INSERT into types set ?';
    connection.query(query,
        {
            'type_name' : req.body.name
        },
        function(err) {
            if(err) {
                if(err.code == "ER_DUP_ENTRY") {
                    next({
                        data: "type already exists"
                    });
                }else {
                    next(true);
                }
                return;
            }
            res.status(200).end();
        }
    )

};