var connection = require('../../../configuration/database/connection');
var _ = require('lodash');
module.exports = function (req, res, next) {
    console.log(req.body);
    var group = {};
    var where = "";
    var join = "";
    if(req.session.authorized && req.body.filter) {
        switch(req.body.filter.group){
            case 'own':
                where += ' where tasks.user_id = "' + req.session.userId + '"';
                break;
            case 'favorite':
                where += ' where favorites_tasks.user_id = "' + req.session.userId + '"';
                join += ' join favorites_tasks using(task_id) ';
                break;
            case 'later':
                where += ' where later_tasks.user_id = "' + req.session.userId + '"';
                join += ' join later_tasks using(task_id) ';
                break;
            default:
                break;
        }
    }
    var query = 'SELECT tasks.name as name, level, description, language, add_date from tasks' + (join || ' ') +
        (where || ' ') +
        ' LIMIT 21 OFFSET ' + req.body.fromItem + ' ';
    console.log(query);
    connection.query(query, function(err,data){

        res.status(200).send(data);
    });
};