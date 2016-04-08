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

    var query = 'select count(*) as count from solutions join tasks using(task_id) where solutions.user_id = ? and solutions.task_id = ? or tasks.creator = ? or tasks.level IS NULL';
    connection.query(query,[req.session.userId, req.params.id, req.session.userId],
        function(err, data) {
            if(err || !_.isObject(data) || data[0].count) {
                return next(true);
            }
            return res.status(200).end();
        })
};