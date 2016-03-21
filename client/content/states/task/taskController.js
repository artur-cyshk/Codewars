app.controller('TaskCtrl', [ '$scope', '$rootScope','$stateParams','taskService','alertService','socket','levelsFactory', function($scope, $rootScope, $stateParams, taskService, alertService, socket, levelsFactory) {

    $scope.editorOptions = {
        lineWrapping : true,
        lineNumbers: true,
        mode: 'javascript',
        theme: 'material',
        focus : true,
        onLoad : function codemirrorLoaded(editor) {
            editor.setValue('LAL');
            editor.on("change", function(){
                console.log($scope.editorModel);
            });
        }
    };

    var self = this;

    socket.on('watch',function() {
        $scope.currentTask.watchingCount++;
    });
    socket.on('like',function(canLike) {
        if(canLike){
            $scope.currentTask.likesCount--;
        }else{
            $scope.currentTask.likesCount++;
        }
    });
    socket.on('comment',function(comment) {
        if($scope.currentTask.comments) {
            $scope.currentTask.comments.unshift(comment);
        }
    });

    self.getTaskInformation = function(id){
        $rootScope.loadingInformation = true;
        taskService.getTask(id)
            .success(function(task) {
                $scope.currentTask = task;
                if(task.watchCountUp) {
                    socket.emit('watch');
                }
                $rootScope.loadingInformation = false;
            })
            .error(function(err) {
                var text = err || 'server error, try later';
                alertService.alert(text, 'error');
                $rootScope.loadingInformation = false;
            })
    };

    $scope.setComment = function() {
        if(!$scope.comment || !$scope.comment.text) {
            alertService.alert('comment min length : 1', 'error');
            return;
        }
        taskService.blurCommitInput();
        taskService.addCommit(
                {
                    'comment' : $scope.comment.text,
                    'task' : $stateParams.id
                })
            .success(function(comment) {
                if($scope.currentTask.comments) {
                    $scope.currentTask.comments.unshift(comment);
                    alertService.alert('comment successfully added', 'success');
                    socket.emit('comment', comment);
                    $scope.comment.text = '';
                }
            })
            .error(function() {
                alertService.alert('server error, try later', 'error');
            })
    };

    $scope.removeCommit = function(id) {
        taskService.removeCommit(id)
            .success(function() {
                if($scope.currentTask.comments) {
                    $scope.currentTask.comments = taskService.filterCommentsById($scope.currentTask.comments, id);
                }
                alertService.alert('comment successfully removed', 'success');
            })
            .error(function(){
                alertService.alert('server error, try later', 'error');
            })
    };

    $scope.toDo = function(type){
        if(!type) {
            return;
        }
        var key = 'can' + type[0].toUpperCase() + type.substring(1, type.length);
        taskService.toDoWithTask(
            {
                task : $stateParams.id,
                stateName : type,
                currentState : $scope.currentTask[key]
            })
            .success(function() {
                $scope.currentTask[key] = !$scope.currentTask[key];
                if(type == 'like') {
                    if(($scope.currentTask[key])) {
                        $scope.currentTask.likesCount--;
                    }else{
                        $scope.currentTask.likesCount++;
                    }
                    socket.emit('like', $scope.currentTask[key]);
                }
                if(type == 'favorite' || type == 'later'){
                    if( $scope.currentTask[key] ){
                        var value = 'removed from ';
                    }
                    alertService.alert("task successfully " + (value || 'added to ' ) + type + " list", 'success');
                }
            })
            .error(function() {
                alertService.alert('server error, try later', 'error');
            })
    };
    self.init = function() {
        self.getTaskInformation($stateParams.id);
        $scope.comment = {text : ''};
        $scope.mapColor = levelsFactory.mapColors;
    };

    self.init();
}]);
