var express = require('express');

var morgan = require('morgan');
var bodyParser = require('body-parser');
var cookieParser = require('cookie-parser');

var sessionMiddleware = require('./configuration/server/session');
var socketRouter = require('./application/socketRouter/router');
var app = express();


var router = require('./application/router/router');
//var errorHandler = require('./server/config/errorHandler');
app.use(express.static('client'));
app.use(morgan('dev'));
app.use(bodyParser.urlencoded({'extended':'true'}));
app.use(bodyParser.json());
app.use(bodyParser.json({ type: 'application/vnd.api+json' }));
app.use(cookieParser());

app.use(sessionMiddleware);

//app.use(errorHandler.handler);

app.use('/',router);

module.exports.app = app;
socketRouter();
