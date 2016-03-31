app.factory('adminService', function ($q, $http) {
    
    return {
        getUsersInfo : function (from) {
            return this.getInfoWithPagination(function () {
                return $http.get('/users/' + from)
            });
        },
        getTypes : function (from) {
            return this.getInfoWithPagination(function () {
                return $http.get('/typesWithLimit/' + from);
            });
        },
        getNullLevelTasks : function (from) {
            return this.getInfoWithPagination(function () {
                return $http.get('/nullTasks/' + from)
            });
        },
        concat : function(before, to) {
            return before.concat(to);
        },
        getInfoWithPagination : function (tabFunction) {
            return $q(function (resolve, reject) {
                var ITEM_OFFSET = 10;
                tabFunction()
                    .success(function (items) {
                        var noMoreItems = (_.isEmpty(items) || items.length <= ITEM_OFFSET);
                        if (!noMoreItems) {
                            items = items.splice(0, items.length - 1);
                        }
                        resolve({
                            items: items,
                            offset: ITEM_OFFSET,
                            noMoreItems: noMoreItems
                        });
                    })
                    .error(function () {
                        reject('server error, try later', 'error');
                    });
            })
        }
    }

});