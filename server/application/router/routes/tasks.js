var connection = require('../../../configuration/database/connection');
var tasksService = require('../../services/tasksService');
module.exports = function (req, res, next) {
    var getTasksQuering = function(filter) {
        var query = 'SELECT tasks.task_id as taskId, tasks.name as name, tasks.level, tasks.description, languages.name as language, tasks.add_date as addDate' +
            ' from tasks join languages using (language_id) ' + (filter.join || ' ') +
            (filter.where || ' ') + ' group by tasks.name ' + (filter.sortBy || ' ') + (filter.sort || ' ') +
            ' LIMIT 11 OFFSET ' + (req.body.fromItem || 0) + ' ';
        connection.query(query, function(err,data) {
            if(err) {
                return next(true);
            }
            res.status(200).send(data);
        });
    };

    getTasksQuering( tasksService.checkFilter(req.body.filter, req.session.authorized, req.session.userId) );

};