app.controller('TaskSolutionCtrl', [ '$scope', '$rootScope','aceFactory', function($scope, $rootScope, aceFactory) {
    $scope.taskSolutionConfiguration = aceFactory.getConfiguration('aa',false,true,true,true);
}]);
