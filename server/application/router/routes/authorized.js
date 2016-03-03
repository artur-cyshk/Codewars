module.exports = function (req, res, next) {
	if(!req.session.authorized) {
		return next({
			status: 403
		})
	}
	res.status(200).end();
};