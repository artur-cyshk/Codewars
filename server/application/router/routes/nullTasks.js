var connection = require('../../../configuration/database/connection');
var _ = require('lodash');
module.exports = function (req, res, next) {
    if(req.session.currUserRole != 'admin'){
        return next({
            status : 409
        })
    }

    if(!req.params || req.params.page == undefined) {
        return next(true);
    }

    var query = 'select task_id as taskId,name from tasks where level is NULL order by add_date limit 11 OFFSET ' + req.params.page;
    connection.query(query,
        function(err, tasks) {
            if(err) {
                return next(true);
            }
            res.status(200).send(tasks);
        })
};