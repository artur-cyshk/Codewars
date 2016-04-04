app.controller('RootCtrl', [ '$scope', '$rootScope','$timeout', function($scope, $rootScope, $timeout) {

    var self = this;

    $scope.closeAlert = function(index) {
        $scope.alerts.splice(index, 1);
    };

    self.checkSame = function(alerts, mess){
        return (alerts.length > 0 && _.last(alerts,1).msg == mess)
    };

    $scope.$on('alert',function(event, info) {
        if($scope.alerts.length < $scope.MAX_ALERTS_COUNT ) {
            if(self.checkSame($scope.alerts, info.message)) {
                return;
            }
            if($scope.timer) {
                $timeout.cancel($scope.timer);
            }
            $scope.alerts.unshift(
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
        $scope.status.openDescription = true;
        $scope.status.openTestsPanel = true;
    };

    self.init();
}]);
