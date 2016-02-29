module.exports = function() {
    var io = require('../../configuration/server/socket');

    io.on('connection',function(socket) {

        module.exports.socket = socket;

        socket.on('like', require('./routes/like').on);
        /*socket.on('watch', function () {
            socket.broadcast.emit('watch');
        });
        socket.on('comment', function (data) {
            socket.broadcast.emit('comment',data);
        });
        socket.on('favorites', function (data) {
            data.userId=socket.request.session.user;
            socket.broadcast.emit('favorites',data);
        });
        socket.on('username',function(data){
            data.userId=socket.request.session.user;
            socket.emit('username',data);
        });*/
    });
};
