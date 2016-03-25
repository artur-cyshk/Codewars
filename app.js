var express = require('express'),
    morgan = require('morgan'),
    bodyParser = require('body-parser'),
    cookieParser = require('cookie-parser'),
    router = require('./server/application/router/router'),
    errorHandler = require('./server/configuration/errorHandler'),
    port = require('./server/configuration/config').port,
    sessionMiddleware = require('./server/configuration/session/session'),
    socketRouter = require('./server/application/socketRouter/router'),
    app = express();

app.use(express.static('./client'));
app.use(morgan('dev'));
app.use(bodyParser.urlencoded({'extended':'true'}));
app.use(bodyParser.json());
app.use(bodyParser.json({ type: 'application/vnd.api+json' }));
app.use(cookieParser());

var server = app.listen(port, function() {
    console.log('server listening on port 8000');
});

var io = require('socket.io').listen(server);
io.use(function(socket, next) {
    sessionMiddleware(socket.request, socket.request.res, next);
});

socketRouter(io);

app.use(sessionMiddleware);
app.use('/',router);
app.use(errorHandler.handler);