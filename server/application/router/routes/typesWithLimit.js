var connection = require('../../../configuration/database/connection');
module.exports = function (req, res, next) {
    if(req.session.currUserRole != 'admin'){
        return next({
            status : 409
        })
    }

    if(!req.params || req.params.page == undefined) {
        return next(true);
    }

    var query = 'select types.type_name as name, types.type_id as typeId from types order by type_name limit 101 OFFSET ' + req.params.page;
    connection.query(query,
        function(err, tasks) {
            if(err) {
                return next(true);
            }
            res.status(200).send(tasks);
        });

};