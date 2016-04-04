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

    var query = 'select name,user_id as userId, avatar_url as avatarUrl, type from users where user_id != ?' +
        ' order by name limit 11 OFFSET ' + req.params.page;
    connection.query(query,[req.session.userId],
        function(err, users) {
            if(err) {
                return next(true);
            }
            if(_.isObject(users)){
                users = _.map(users, function (item) {
                    if(!item.avatarUrl) {
                        item.avatarUrl = 'noAvatar.png';
                    }
                    return item;
                })
            }
            res.status(200).send(users);
        })
};