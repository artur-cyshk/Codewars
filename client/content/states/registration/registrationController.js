app.controller('RegistrationCtrl', [ '$scope', '$http','alertService','$state','registrationService', function($scope, $http, alertService, $state, registrationService) {

    $scope.registr = function() {
        if(registrationService.validate($scope.user) ) {
            registrationService.registrUser($scope.user)
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
