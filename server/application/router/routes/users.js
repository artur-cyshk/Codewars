var connection = require('../../../configuration/database/connection');
var _ = require('lodash');
module.exports = function (req, res, next) {
    if(req.session.currUserRole == 'admin'){
        return next({
            'data' : 'No access, need root'
        })
    }
    
    var query = 'select name, avatar_url as avatarUrl, type from users';
    connection.query(query,
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