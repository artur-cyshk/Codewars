var connection = require('../../../configuration/database/connection');
module.exports = function (req, res, next) {
    var query = 'select name, clan, honor from users' +
        ' order by honor DESC, name limit 21 OFFSET ' + req.params.page ;
    connection.query(query, function(err, data){
        if(err || !data) {
            return next(true);
        }
        res.status(200).send(data);
    })
};