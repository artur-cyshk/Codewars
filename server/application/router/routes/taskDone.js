var connection = require('../../../configuration/database/connection');
var _ = require('lodash');
module.exports = function (req, res, next) {
    if(!req.session.authorized) {
        return next({
            status : 409
        })
    }

    if(!req.params || req.params.id == undefined) {
        return next(true);
    }

    var query = 'select count(*) as count from solutions where user_id = ? and task_id = ?';
    connection.query(query,[req.session.userId, req.params.id],
        function(err, data) {
            if(err || !_.isObject(data) || data[0].count) {
                return next(true);
            }
            return res.status(200).end();
        })
};