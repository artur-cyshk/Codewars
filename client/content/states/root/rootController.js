app.controller('RootCtrl', [ '$scope', '$rootScope','$timeout', function($scope, $rootScope, $timeout) {

    var self = this;

    $scope.closeAlert = function(index) {
        $scope.alerts.splice(index, 1);
    };
    $scope.$on('alert',function(event, info) {
        if($scope.alerts.length < $scope.MAX_ALERTS_COUNT ) {
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
            }, 3000);
        }
    });

    self.init = function() {
        $scope.alerts = [];
        $scope.MAX_ALERTS_COUNT = 4;
        $scope.status = {};
        $scope.status.levelPanelInHome = true;
        $scope.status.openSortFilter = true;
    };

    self.init();
}]);
