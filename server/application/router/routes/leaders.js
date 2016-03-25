var connection = require('../../../configuration/database/connection');
var _ = require('lodash');
module.exports = function (req, res, next) {
    var query = 'select name, clan, honor,avatar_url as avatarUrl from users' +
        ' order by honor DESC, name limit 21 OFFSET ' + req.params.page ;
    connection.query(query, function(err, data){
        if(err || !data) {
            return next(true);
        }
        res.status(200).send(data);
    })
};