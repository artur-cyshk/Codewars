var connection = require('../../../configuration/database/connection');
var _ = require('lodash');
module.exports = function (req, res, next) {
    var query = 'select types.type_name as name from types';
    connection.query(query, function(err, data){
        if(err || !data) {
            return next(true);
        }
        res.status(200).send(data);
    })
};