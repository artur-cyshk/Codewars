app.controller('NewTaskCtrl', [ '$scope', '$rootScope','newTaskService', function($scope, $rootScope, newTaskService) {

    var self = this;

    $scope.addNewTask = function () {
        //validate
        $scope.newTaskModel.tests = $scope.newTask.defaultData.tests;
        console.log($scope.newTaskModel);
    };

    self.init = function() {
        $scope.newTaskModel = {};
        $scope.newTask = new newTaskService.TaskData();
        $scope.newTask.getInformation();
    };

    self.init();
}]);
