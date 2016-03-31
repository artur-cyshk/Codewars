var connection = require('../../../configuration/database/connection');
module.exports = function (req, res, next) {
    console.log(req.params);
    var query = 'select types.type_name as name, types.type_id as typeId from types order by type_name';
    connection.query(query, function(err, data){
        if(err || !data) {
            return next(true);
        }
        res.status(200).send(data);
    })
};