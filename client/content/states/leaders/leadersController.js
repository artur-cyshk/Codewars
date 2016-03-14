app.controller('LeadersCtrl', [ '$scope', '$rootScope','levelsFactory','$http','alertService', function($scope, $rootScope, levelsFactory, $http, alertService) {
    var self = this;

    self.setInfo = function(leaders, levels) {
        return _.map(leaders, function(user) {
            user.level = levelsFactory.getLevelByHonor(levels, user.honor);
            return user;
        })
    };

    self.concat = function(before, to) {
        return before.concat(to);
    };

    self.getLeadersHandler = function() {
        var LEADERS_OFFSET = 20;
        if(!$scope.lidersOffset) {
            $scope.lidersOffset = 0;
        }
        $http.get('/leaders/'+ $scope.lidersOffset)
            .success(function(users) {
                if($scope.lidersOffset == 0) {
                    $scope.leaders = [];
                }
                if(!_.isEmpty(users)) {
                    if(users.length <= LEADERS_OFFSET) {
                        $scope.noMoreUsers = true;
                    }else {
                        users = users.splice(0, users.length - 1);
                    }
                    $scope.leaders = self.concat($scope.leaders, users);
                    $scope.leaders = self.setInfo($scope.leaders, $scope.levels);
                }
                $scope.lidersOffset += LEADERS_OFFSET;
            })
            .error(function(){
                alertService.alert('server error, try later', 'error');
            });
    };

    self.init = function() {
        self.getLeadersHandler();
        $scope.levels = levelsFactory.levelObjectMapping();
    };

    $scope.checkYourself = function(currentName, nameInTop) {
        return currentName == nameInTop;
    };

    $scope.loadMoreUsers = function() {
        self.getLeadersHandler();
    };

    self.init();
}]);
