app.controller('ManagementTaskCtrl', [ '$scope', '$rootScope','managementTaskService','$state','$stateParams','alertService', function($scope, $rootScope, managementTaskService, $state, $stateParams, alertService) {

    var self = this;

    self.editTask = function(id, task) {
        managementTaskService.editTask(id, task)
            .success(function(){
                $rootScope.loadingInformation = false;
                alertService.alert('task successfully edited', 'success');
                $state.go('root.task', {id : id});
            })
            .error(managementTaskService.errorHandler);
    };

    self.addTask = function(task) {
        managementTaskService.addTask(task)
            .success(function() {
                alertService.alert('task successfully added', 'success');
                $state.go('root.tasks');
                $rootScope.loadingInformation = false;
            })
            .error(managementTaskService.errorHandler);
    };

    $scope.manageTask = function () {
        $rootScope.loadingInformation = true;
        var task = $scope.managementTask.model;
        $scope.errors = managementTaskService.validate(task);
        if(!$scope.errors) {
            switch ($state.current.role) {
                case 'add':
                    self.addTask(task);
                    break;
                case 'edit':
                    self.editTask($stateParams.id, task);
                    break;
                default:
                    break;
            }
        }else {
            $rootScope.loadingInformation = false;
            alertService.alert('validation error, fix please', 'error');
        }
    };

    $scope.stopDropdownPropagation = function($event) {
        if(managementTaskService.checkClosest($event, '.variables-ul')) {
            $event.stopPropagation();
        }
    };

    self.init = function() {
        $scope.managementTask = new managementTaskService.TaskData($state.current.role, $stateParams.id);
        $scope.managementTask.getInformation();
        $scope.isEmpty = managementTaskService.isEmpty;
        $scope.isEmptyResult = managementTaskService.isEmptyResult;
        $scope.tinymceOptions = managementTaskService.getTinymseOptions();
    };

    self.init();
}]);
