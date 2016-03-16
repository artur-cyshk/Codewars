var connection = require('../../../configuration/database/connection');
module.exports = function (req, res, next) {
	if(!req.session.authorized) {
		return next({
			status: 403
		})
	}else {
		var query = 'select user_id as userId, type from users where user_id = "' + req.session.userId + '"';
		connection.query(query, function(err, data) {
			if(err || !data){
				return next(true);
			}
			res.status(200).send(data[0]);
		})
	}

};