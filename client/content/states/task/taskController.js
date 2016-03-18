app.controller('TaskCtrl', [ '$scope', '$rootScope','$stateParams','$http','alertService','socket','levelsFactory', function($scope, $rootScope, $stateParams, $http, alertService, socket, levelsFactory) {
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
        $http.get('/task/' + id)
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
        $http.post('/commit',
                {
                'comment' : $scope.comment.text,
                'task' : $stateParams.id
                })
            .success(function() {
                if($scope.currentTask.comments) {
                    var currentDate = new Date;
                    var newComment = {
                        comment : $scope.comment.text,
                        commentAddDate : currentDate.toLocaleString(),
                        commentAuthor : $scope.currentUser.name
                    };
                    $scope.currentTask.comments.unshift(newComment);
                    alertService.alert('comment successfully added', 'success');
                    socket.emit('comment', newComment);
                }
            })
            .error(function() {
                alertService.alert('server error, try later', 'error');
            })
    };

    $scope.toDo = function(type){

        if(!type) {
            return;
        }

        var key = 'can' + type[0].toUpperCase() + type.substring(1, type.length);
        switch(type) {
            case 'like':
                type = 'likes';
                break;
            case 'favorite':
                type = 'favorites_tasks';
                break;
            case 'later':
                type = 'later_tasks';
                break;
            default:
                break;
        }

        $http.post('/toDoWithTask',
            {
                task : $stateParams.id,
                stateName : type,
                currentState : $scope.currentTask[key]
            })
            .success(function() {
                $scope.currentTask[key] = !$scope.currentTask[key];
                if(type == 'likes') {
                    if(($scope.currentTask[key])) {
                        $scope.currentTask.likesCount--;
                    }else{
                        $scope.currentTask.likesCount++;
                    }
                    socket.emit('like', $scope.currentTask[key]);
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
