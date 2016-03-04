'use strict';
angular.module('codewars').directive('profile', function ($rootScope, $http, alertService) {
    return {
        restrict: 'E',
        scope: false,
        replace : true,
        templateUrl: './content/states/profile/profileTemplate.html',
        controller: function ($scope) {
            var self = this;
            $scope.status = {};
            self.mapColors = function(level) {
                var color = {};
                if(level <= 2) {
                    color.in = "rgb(50, 82, 98)";
                    color.out ="rgb(104, 224, 244)";
                }
                if(level > 2 && level <= 4) {
                    color.in = "rgb(57, 50, 98)";
                    color.out ="rgb(106, 104, 244)";
                }
                if(level >= 5 && level < 8) {
                    color.in = "rgb(98, 50, 50)";
                    color.out ="rgb(244, 104, 104)";
                }

                if(level == 8) {
                    color.in = "rgb(50, 98, 65)";
                    color.out ="rgb(132, 244, 104)";
                }
                return color;
            };

            self.levelObjectMapping = function(userHonor) {
                var LEVEL_COUNT = 8;
                var MAX_HONOR = 3600;
                var levels = [];
                for(var i = 0; i< LEVEL_COUNT; i++) {
                    levels[i] = {};
                    var num = i + 1;
                    var prevLevelHonor = 0;
                    if(levels[i-1]) {
                        prevLevelHonor = levels[i-1].honor;
                    }
                    levels[i].honor = num * 100 + prevLevelHonor;
                    levels[i].levelNum = num;
                    levels[i].diffHonor = (userHonor <= MAX_HONOR) ?levels[i].honor - prevLevelHonor : userHonor;
                    levels[i].currHonor = (userHonor <= MAX_HONOR) ? userHonor - prevLevelHonor : userHonor;
                    levels[i].color = self.mapColors(num);
                }
                return levels;
            };

            self.getLevelByHonor = function(levels, userHonor){
                var LAST_LEVEL = 7;
                var index = _.indexOf(levels, _.find(levels, function(level, i, levels) {
                                var prevLevelHonor = 0;
                                if(levels[i-1]) {
                                    prevLevelHonor = levels[i-1].honor;
                                }
                                return  (userHonor < level.honor && userHonor >= prevLevelHonor)
                            }));
                return (index == -1) ? LAST_LEVEL : index;
            };

            $scope.$watch('openedProfile', function(value) {
                if(value != undefined){
                    $scope.profileVisible = value;
                }
            });
            $scope.changeColor = function(val) {
                angular.element('.glyphicon.glyphicon-user').css({
                    'color' : (val) ? $scope.levels[$scope.currentUser.level].color.out : '#B4B4B5'
                })
            };
            $scope.$on('changeState', function(){
                $scope.openedProfile = false;
            });

            $scope.$watch('authorized', function(value) {
                if(value) {
                    $http.get('/user')
                        .success(function(user) {
                            $scope.currentUser = user;
                            $scope.levels = self.levelObjectMapping(user.honor);
                            $scope.currentUser.level = self.getLevelByHonor($scope.levels, $scope.currentUser.honor);
                            console.log($scope);
                        })
                        .error(function() {
                            alertService.alert('cant get user info, server error, try later', 'error');
                        })
                }
            })
        }
    };
});