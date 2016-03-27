var connection = require('../../../configuration/database/connection');
var _ = require('lodash');
module.exports = function (req, res, next) {
    console.log(req.params, req.body);
    res.status(200).end();
};