var connection = require('../../../configuration/database/connection');
var _ = require('lodash');
module.exports = function (req, res, next) {
    var query = 'select name, clan, honor,avatar_url as avatarUrl, type from users' +
        ' where user_id= ?';
    connection.query(query, [req.session.userId],
        function(err, data){
            if(err || !data || !data[0]) {
                return next(true);
            }
            if(!data[0].avatarUrl) {
                data[0].avatarUrl = 'noAvatar.png';
            }
            res.status(200).send(data[0]);
    })
};