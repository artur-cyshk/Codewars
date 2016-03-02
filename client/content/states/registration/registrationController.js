app.controller('RegistrationCtrl', [ '$scope', '$http','alertService','$state', function($scope, $http, alertService, $state) {
    var validate = function(user) {
        if(!user.name || user.name.length < 4) {
            alertService.alert('username minimal length - 4','error');
            return;
        }
        if(user.password.length < 8 || user.repeatedPassword.length < 8) {
            alertService.alert('password minimal length - 8','error');
            return;
        }
        if(user.password != user.repeatedPassword) {
            alertService.alert('passwords are not equals','error');
            return;
        }
        return true;
    };

    $scope.registr = function() {
        if(validate($scope.user) ) {
            $http.post('/registration', $scope.user)
                .success(function() {
                    alertService.alert('registration success', 'success');
                    $state.go('root.login');
                })
                .error(function(err) {
                    var text = err || 'server error, try later';
                    alertService.alert(text, 'error');
                })
        }
    }
}]);
