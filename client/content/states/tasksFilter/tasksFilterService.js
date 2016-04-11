app.factory('tasksFilterService', function($http , $q, alertService, $rootScope) {
    var selfService = this;
    selfService.getTypes = function() {
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
    };
    return {
        Filter : function() {
            var self = this;
            this.filterModel = {};
            this.getFilter = function() {
                return this.filterModel;
            };
            this.setDefaultFilter = function() {
                this.filterModel = {};
                this.filterModel.sortBy = 'date';
                this.filterModel.sortOrder = 'Z-A';
                this.filterModel.group = 'all';
                this.filterModel.levels = Array.apply(null, {length: 8}).map(function(item, i) {return i + 1 });
                return this;
            };
            this.setChooseProperties = function() {
                selfService.getTypes()
                    .then(
                        function success(types) {
                            var filterProperties = {};
                            filterProperties.groups =(!$rootScope.authorized) ? ['all'] : ['all','done', 'own', 'later', 'favorite'];
                            filterProperties.types = types;
                            filterProperties.levels = Array.apply(null, {length: 8}).map(function(item, i) {return i + 1 });
                            filterProperties.levels.unshift('without level');
                            filterProperties.sortBy = ['level', 'date', 'name'];
                            filterProperties.sortOrder = ['A-Z', 'Z-A'];
                            self.filterProperties = filterProperties;
                        },
                        function error(err) {
                            alertService.alert(err, 'error');
                        })
            };
        }
    }
});