var connection = require('../../../configuration/database/connection');
module.exports = function (req, res, next) {
    var query = 'select languages.name as name, languages.language_id as languageId from languages';
    connection.query(query, function(err, data){
        if(err || !data) {
            return next(true);
        }
        res.status(200).send(data);
    })
};