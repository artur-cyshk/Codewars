app.controller('SelectAvatarCtrl', [ '$scope','$uibModalInstance', function($scope, $uibModalInstance) {
    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };

    $scope.avatar = {};
    $scope.setAvatar = function (dataUrl, name) {
        $uibModalInstance.close(dataUrl, name);
    };
}]);
