var connection = require('../../../configuration/database/connection');
var async = require('async');
module.exports = function (req, res, next) {
    if(!req.session.authorized || !req.body || !req.body.honor) {
        return next(true);
    }

    var query = 'update users set honor = honor + ? where user_id = ?';
    connection.query(query,
                    [req.body.honor, req.body.creatorId || req.session.userId],
                    function (err) {
                        if(err){
                            return next(true);
                        }
                        res.status(200).end();
                    })

};