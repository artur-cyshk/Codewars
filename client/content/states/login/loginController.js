app.controller('LoginCtrl', [ '$scope', '$http', 'alertService','$state', function($scope, $http, alertService, $state) {
    $scope.login = function() {
        $http.post('/login', $scope.user)
            .success(function() {
                alertService.alert('success authorization', 'success');
                $state.go($state.current.from, $state.current.paramsTo);
            }).error(function(err) {
                var text = err || 'server error, try later';
                alertService.alert(text, 'error');
            })
    };
}]);
