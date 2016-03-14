var connection = require('../../../configuration/database/connection');
var async = require('async');
module.exports = function (req, res, next) {
    console.log(req.body);
    var query = 'SELECT tasks.name as name, level, description, language, add_date from tasks LIMIT 21 OFFSET ' + req.body.fromItem + ' ';
    connection.query(query, function(err,data){
        res.status(200).send(data);
    });
};