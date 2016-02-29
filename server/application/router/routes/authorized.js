module.exports = function (req, res) {
	res.status(req.session.authorized ? 200 : 403).end();
};