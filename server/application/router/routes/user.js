var connection = require('../../../configuration/database/connection');
var _ = require('lodash');
module.exports = function (req, res, next) {
    var query = 'select users.name as user_name, clans.name as clan_name, honor, type from users' +
                ' left join clans using(clan_id) where user_id="' + req.session.userId + '"';
    connection.query(query, function(err, data){
        if(err || !data || !data[0]) {
            return next(true);
        }
        res.status(200).send(data[0]);
    })
};