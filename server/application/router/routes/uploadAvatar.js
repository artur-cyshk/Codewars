var connection = require('../../../configuration/database/connection');
module.exports = function (req, res, next) {
    console.log(req.body);
    res.status(200).end();
};