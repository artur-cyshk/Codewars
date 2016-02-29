var socket = require('../router').socket;

module.exports.on = function (data) {
    console.log(data);
    socket.emit('like',111);
};