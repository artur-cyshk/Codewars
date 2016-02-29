var app = require('../../app').app;
var http=require('http');
var server=http.createServer(app);

server.listen(8000,function(){
    console.log('server listening on port 8000');
});

module.exports.server = server;