exports.handler = function (err, req, res, next) {
    res.status(err.status).send(err.data);
}