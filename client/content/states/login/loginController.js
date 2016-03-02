app.controller('LoginCtrl', [ '$scope', '$http', 'alertService','$rootScope','$state', function($scope, $http, alertService, $rootScope, $state) {
    $scope.login = function() {
        $http.post('/login', $scope.user)
            .success(function(id) {
                $rootScope.userId = id;
                alertService.alert('success authorization', 'success');
                $state.go('root.home');
            }).error(function(err) {
                var text = err || 'server error, try later';
                alertService.alert(text, 'error');
            })
    };
}]);
