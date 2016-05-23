app.controller('LeadersCtrl', [ '$scope', '$rootScope','levelsFactory','leadersService','alertService','$document', function($scope, $rootScope, levelsFactory, leadersService, alertService, $document) {
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
        $rootScope.loadingInformation = true;
        leadersService.getLeaders($scope.lidersOffset)
            .success(function(users) {

                if($scope.lidersOffset == 0) {
                    if(_.isEmpty(users)) {
                        alertService.alert('there are no users', 'error');
                    }else {
                        $scope.leaders = [];
                    }
                }

                if(!_.isEmpty(users)) {
                    $scope.moreUsers = (users.length > LEADERS_OFFSET);
                    if($scope.moreUsers) {
                        users = users.splice(0, users.length - 1);
                    }
                    $scope.leaders = self.concat($scope.leaders, users);
                    $scope.leaders = self.setInfo($scope.leaders, $scope.levels);
                    $scope.lidersOffset += LEADERS_OFFSET;
                }
                $rootScope.loadingInformation = false;

            })
            .error(function(){
                alertService.alert('server error, try later', 'error');
                $rootScope.loadingInformation = false;
            });
    };

    self.init = function() {
        self.getLeadersHandler();
        $scope.levels = levelsFactory.levelObjectMapping();
    };

    $document.bind('scroll', function(){
        if(angular.element(window).scrollTop() + angular.element(window).height() == angular.element(document).height() && $scope.moreUsers) {
            self.getLeadersHandler();
        }
    });

    $scope.checkYourself = function(currentName, nameInTop) {
        return currentName == nameInTop;
    };

    self.init();
}]);
