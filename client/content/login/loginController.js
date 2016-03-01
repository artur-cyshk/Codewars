app.controller('LoginCtrl', [ '$scope', '$http', 'socket','$state', function($scope,$http, socket, $state) {
    $scope.login = function(){
        $http.login('/login', $scope.user).success(function(){
            console.log('success');
        }).error(function(){
            console.log('error');
        })
    }
    console.log('login');
}]);
