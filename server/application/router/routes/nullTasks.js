var connection = require('../../../configuration/database/connection');
var _ = require('lodash');
module.exports = function (req, res, next) {
    if(req.session.currUserRole == 'admin'){
        return next({
            'data' : 'No access, need root'
        })
    }

    var query = 'select task_id as taskId,name from tasks where level is NULL';
    connection.query(query,
        function(err, tasks) {
            if(err) {
                return next(true);
            }
            res.status(200).send(tasks);
        })
};