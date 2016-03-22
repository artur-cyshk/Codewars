angular.module('codewars').factory('taskService', function($http, aceFactory) {
    return {
        getTask : function(id) {
            return $http.get('/task/' + id);
        },
        mapSolutions : function(solutions) {
            return solutions.map(function(item) {
                item.configuration = aceFactory.getConfiguration(item.solution_text, true, false, "none", false);
                return item;
            })
        },
        addCommit : function(commit) {
            return $http.post('/commit', commit);
        },
        removeCommit : function(id) {
            return $http.delete('/deleteCommit/' + id);
        },
        filterCommentsById : function(comments , id){
            return _.filter(comments, function(comment) {
                return comment.commentId != id;
            })
        },
        toDoWithTask : function(taskInfo) {
            switch(taskInfo.stateName) {
                case 'like':
                    taskInfo.stateName = 'likes';
                    break;
                case 'favorite':
                    taskInfo.stateName = 'favorites_tasks';
                    break;
                case 'later':
                    taskInfo.stateName = 'later_tasks';
                    break;
                default:
                    break;
            }
            console.log(taskInfo);
            return $http.post('/toDoWithTask', taskInfo);
        },
        blurCommitInput : function(){
            angular.element('.comment-input').blur();
        }
    }
});