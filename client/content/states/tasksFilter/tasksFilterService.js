angular.module('codewars').factory('tasksFilterService', function($http , $q) {
    return {
        getTypes : function() {
            return $q(function(resolve, reject) {
                $http.get('/types')
                    .success(function(types) {
                        if(types) {
                            types = types.map(function(type){
                                return type.name;
                            })
                        }
                        resolve(types);
                    })
                    .error(function() {
                        reject('server error, try later');
                    })
            })
        }
    }
});