module.exports = function(io) {
    io.on('connection',function(socket) {
        socket.on('like', function(canLike) {
            socket.broadcast.emit('like', canLike);
        });
        socket.on('watch', function() {
            socket.broadcast.emit('watch');
        });
        socket.on('comment', function(comment) {
            socket.broadcast.emit('comment', comment);
        });
    });
};
