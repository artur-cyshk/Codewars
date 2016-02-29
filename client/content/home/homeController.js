app.controller('HomeCtrl', [ '$scope', '$uibModal', 'socket', function($scope, $uibModal, socket) {
    socket.emit('like',111);
    socket.on('like', function (data) {
        console.log(data);

        //data.userId=socket.request.session.user;
    });
}]);
