var connection = require('../../../configuration/database/connection');
var _ = require('lodash');
module.exports = function (req, res, next) {
    console.log(req.body);
    var group = {};
    var where = [];
    var join = [];
    var sort = "";
    var sortBy = "";
    var filter = req.body.filter;
    if(req.session.authorized && req.body.filter) {
        switch(filter.group){
            case 'own':
                where.push( ' tasks.user_id = "' + req.session.userId + '" ' );
                break;
            case 'favorite':
                where.push( ' favorites_tasks.user_id = "' + req.session.userId + '" ');
                join.push( ' join favorites_tasks using(task_id) ' );
                break;
            case 'later':
                where.push(' later_tasks.user_id = "' + req.session.userId + '" ');
                join.push(' join later_tasks using(task_id) ');
                break;
            default:
                break;
        }
        if(!_.isEmpty(filter.levels)){
            where.push(' level in (' + filter.levels.join(',') + ') ' );
        }
        if(filter.sortOrder) {
            sort = (filter.sortOrder == 'Z-A') ? 'DESC' : 'ASC' ;
        }

        console.log(filter.sortBy);
        if(filter.sortBy){
            if(filter.sortBy == 'date'){
                sortBy = " order by add_date ";
            }
            if(filter.sortBy == 'name' || filter.sortBy == 'level'){
                sortBy = " order by " + filter.sortBy + ' ';
            }
        }

        if(!_.isEmpty(filter.types)) {
            join.push(' join tasks_types using (task_id) join types using(type_id) ');
            filter.types = '"' + filter.types.join('","') + '"';
            where.push(' types.type_name in (' + filter.types + ') ');
        }

        if(_.isEmpty(where)){
            where = "";
        }else{
            where.unshift('where ');
            where = where.join(' ');
        }
        if(_.isEmpty(join)){
            join = "";
        }else{
            join.join(' ');
        }
    }
    var query = 'SELECT tasks.task_id as taskId, tasks.name as name, level, description, language, add_date as addDate' +
        ' from tasks' + (join || ' ') +
        (where || ' ') + (sortBy || ' ') + (sort || ' ') +
        ' LIMIT 21 OFFSET ' + req.body.fromItem + ' ';
    console.log(query);
    connection.query(query, function(err,data){

        res.status(200).send(data);
    });
};