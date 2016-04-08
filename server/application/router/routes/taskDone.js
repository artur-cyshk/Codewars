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
    var query = 'select tasks.task_id as id from tasks left join solutions using(task_id) where solutions.user_id = ? or tasks.user_id = ? or tasks.level IS NULL';
    connection.query(query,[req.session.userId, req.session.userId],
        function(err, data) {
            if(err || !_.isObject(data)) {
                return next(true);
            }
            if (_.isObject(data[0])) {
                if (_.some(data, {id: +req.params.id})) {
                    return next({
                        data: 'you already done this task or you creator or this task without level'
                    });
                }
            }
            return res.status(200).end();


        })
};