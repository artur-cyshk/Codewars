app.controller('ConfirmCtrl', [ '$scope','$uibModalInstance','modalText', function($scope, $uibModalInstance, modalText) {
    var self = this;

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };

    $scope.confirm = function () {
        $uibModalInstance.close(true);
    };

    self.init = function () {
        $scope.modalText = modalText;
    };

    self.init();
}]);
