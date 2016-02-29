app.controller('LoginCtrl', [ '$scope', '$http', 'socket','$state', function($scope,$http, socket, $state) {
    $scope.click = function(){
        $http.post('/login', {1:1}).success(function(){
            $state.go('home');
        }).error(function(){
            //todo modal view
        })
    };
    $scope.clock = function(){
        $state.go('home');
    }
    console.log('login');
}]);
