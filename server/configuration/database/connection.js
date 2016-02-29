var mongoose = require ('mongoose'),
    mongooseConnection = require ('./config.js').mongoose;

mongoose.connect (mongooseConnection.uri,function  (err) {
    console.log(err || "database connection success");
});

module.exports = mongoose;
