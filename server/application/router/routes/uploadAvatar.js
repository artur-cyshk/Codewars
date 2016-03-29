var connection = require('../../../configuration/database/connection');
_ = require('lodash');
module.exports = function (req, res, next) {
    if(!req.session.authorized || _.isEmpty(req.files)){
        return next(true);
    }
    var query = 'UPDATE users SET avatar_url = ? WHERE user_id = ?';
    connection.query(query,
        [req.files.file.path.split('client\\content\\images\\avatars\\')[1], req.session.userId],
        function (err, data) {
            if(err){
                return next(true);
            }
            res.status(200).send(req.files.file.path.split('client\\content\\images\\avatars\\')[1]);
    });
};