'use strict';
angular.module('codewars').directive('profile', function ($rootScope, $http, alertService, $state, levelsFactory) {
    return {
        restrict: 'E',
        scope: false,
        replace : true,
        templateUrl: './content/states/profile/profileTemplate.html',
        controller: function ($scope) {
            $scope.$watch('openedProfile', function(value) {
                if(value != undefined){
                    $scope.profileVisible = value;
                }
            });
            $scope.$on('changeState', function(){
                $scope.openedProfile = false;
            });

            $scope.signOut = function() {
                $http.get('/logout')
                    .success(function() {
                        alertService.alert('sign out success', 'success');
                        delete $scope.currentUser;
                        $state.go('root.login');
                    })
                    .error(function() {
                        alertService.alert('server error, try later', 'error');
                    })
            };

            $scope.$watch('authorized', function(value) {
                if(value) {
                    $scope.userDataLoaded = false;
                    $http.get('/user')
                        .success(function(user) {
                            $scope.currentUser = user;
                            $scope.levels = levelsFactory.levelObjectMapping(user.honor);
                            $scope.currentUser.level = levelsFactory.getLevelByHonor($scope.levels, $scope.currentUser.honor);
                            $scope.userDataLoaded = true;
                        })
                        .error(function() {
                            alertService.alert('cant get user info, server error, try later', 'error');
                        })
                }
            })
        }
    };
});