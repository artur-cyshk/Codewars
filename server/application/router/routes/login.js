var connection = require('../../../configuration/database/connection');
module.exports = function (req, res, next) {
    req.session.authorized = true;
    res.status(200).end();
};