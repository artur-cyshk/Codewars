'use strict';
angular.module('codewars').directive('profile', function ($rootScope, profileService, alertService, $state, levelsFactory, $stateParams) {
    return {
        restrict: 'E',
        scope: false,
        replace : true,
        templateUrl: './content/states/profile/profileTemplate.html',
        controller: function ($scope) {

            $scope.selectAvatar = function() {
                var modalInstance = profileService.openSelectAvatarModal();
                modalInstance.result.then(function (dataUrl, name) {
                    profileService.uploadAvatar(dataUrl, name)
                        .then(function (response) {
                            $scope.currentUser.avatarUrl = response.data;
                            alertService.alert('avatar successfully loaded', 'success');
                        }, function () {
                            alertService.alert('server error, try later', 'error');
                        });
                });
            };

            $scope.$watch('status.openedProfile', function(value) {
                if(value != undefined) {
                    $scope.profileVisible = value;
                }
            });
            $scope.$on('changeState', function() {
                $scope.status.openedProfile = false;
            });

            $scope.signOut = function() {
                profileService.logout()
                    .success(function() {
                        delete $scope.currentUser;
                        $rootScope.authorized = false;
                        $rootScope.logout = true;
                        $state.go(
                            $state.current,
                            $stateParams,
                            {
                                reload: true,
                                inherit: false,
                                notify: true
                            }
                        );
                    })
                    .error(function() {
                        alertService.alert('server error, try later', 'error');
                    })
            };

            $scope.$watch('authorized', function(value) {
                if(value) {
                    $scope.userDataLoaded = false;
                    profileService.getUser()
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