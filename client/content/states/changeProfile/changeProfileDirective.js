'use strict';
angular.module('codewars').directive('changeProfile', function ($rootScope) {
    return {
        restrict: 'E',
        scope: false,
        replace: true,
        templateUrl: './content/states/changeProfile/changeProfileTemplate.html',
        controller: function ($scope, alertService, changeProfileService) {
            if($scope.currentUser){
                $scope.newUser = {};
                $scope.newUser.name = $scope.currentUser.name;
                $scope.newUser.clan = $scope.currentUser.clan;
            }

            var changeProfilePost = function(state, user) {
                if(state == 'password'){
                    var pass = {};
                    pass.password = user[state];
                    pass.repeatedPassword = user.repeatedPassword;
                }
                changeProfileService.changeProfile({
                    'state' : state,
                    'value' : pass || user[state]
                }).success(function() {
                    $scope.currentUser.name = $scope.newUser.name;
                    $scope.currentUser.clan = $scope.newUser.clan;
                    alertService.alert(state + ' edit done', 'success');
                }).error(function(err) {
                    $scope.newUser.name = $scope.currentUser.name;
                    $scope.newUser.clan = $scope.currentUser.clan;
                    var text = err || 'server error, try later';
                    alertService.alert(text, 'error');
                })


            };

            $scope.changeProfile = function(state){
                if( !changeProfileService.validate(state, $scope.newUser) ) {
                    changeProfilePost(state, $scope.newUser);
                }
            };

            $scope.$watch('status.openPanel', function(value){
                if(!value){
                    if($scope.newUser) {
                        delete $scope.newUser.currState;
                    }
                }
            })
        }
    }
});