app.controller('LoginCtrl', [ '$scope', 'loginService', 'alertService','$state', function($scope, loginService, alertService, $state) {
    $scope.login = function() {
        loginService.login($scope.user)
            .success(function() {
                alertService.alert('success authorization', 'success');
                $state.go($state.current.from || 'root.home', $state.current.paramsTo || {});
            }).error(function(err) {
                var text = err || 'server error, try later';
                alertService.alert(text, 'error');
            })
    };
}]);
