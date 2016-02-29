var sessionMiddleware = require('./session');
var server = require('./server').server;

var io = require('socket.io').listen(server);
io.use(function(socket,next){
    sessionMiddleware(socket.request,socket.request.res,next);
});

module.exports = io;