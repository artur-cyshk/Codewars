app.controller('RootCtrl', [ '$scope', '$rootScope','$timeout','$http','alertService','$state', function($scope, $rootScope, $timeout, $http, alertService, $state) {
    $scope.alerts = [];
    $scope.status = {};
    $scope.status.levelPanelInHome = true;

    $scope.closeAlert = function(index) {
        $scope.alerts.splice(index, 1);
    };
    $scope.$on('alert',function(event, info) {
        if($scope.timer) {
            $timeout.cancel($scope.timer);
        }
        $scope.alerts.push(
            {
                msg: info.message,
                type: info.type
            }
        );
        $scope.timer = $timeout(function() {
            _.remove($scope.alerts);
        }, 5000);

    });

    $scope.signOut = function() {
        $http.get('/logout')
            .success(function() {
                alertService.alert('sign out success', 'success');
                $state.go('root.login');
            })
            .error(function() {
                alertService.alert('server error, try later', 'error');
            })
    };
}]);
