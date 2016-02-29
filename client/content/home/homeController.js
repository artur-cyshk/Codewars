app.controller('HomeCtrl', [ '$scope', '$http', 'socket', function($scope,$http, socket) {

    $scope.a = function(){
        console.log('z');
        socket.emit('like',111);
    };
    $http.get('/types').error(function(){
        console.log('z');
    });
    socket.on('like', function (data) {
        console.log(data);

        //data.userId=socket.request.session.user;
    });
}]);
