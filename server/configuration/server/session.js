var session = require('express-session');
var MongoStore = require('connect-mongo')(session);
var mongoose = require('mongoose');

module.exports = session( {
    key: 'codewars',
    secret: 'codewars',
    cookie:{
        path:"/",
        httpOnly:true,
        maxAge:null
    },
    resave: true,
    saveUninitialized: true,
    store: new MongoStore({ mongooseConnection: mongoose.connection })
} );