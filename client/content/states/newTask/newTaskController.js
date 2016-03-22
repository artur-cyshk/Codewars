app.controller('NewTaskCtrl', [ '$scope', '$rootScope','newTaskService', function($scope, $rootScope, newTaskService) {

    var self = this;

    self.init = function() {
        console.log('task add ctrl');
        newTaskService.getTypes()
            .success(
                function(types){
                    console.log(data);
                }
            )
    };

    self.init();
}]);
