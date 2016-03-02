app.controller('HomeCtrl', [ '$scope', '$http', 'socket','$state', function($scope,$http, socket,$state) {

    $scope.a = function(){
        $http.get('/logout').success(function(){
            $state.go('login');
        }).error(function(){
            //todo modal error
        })
    };

}]);
