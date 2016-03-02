app.factory('alertService', function ($rootScope) {
    return {
        alert: function (message, type) {
            $rootScope.$broadcast('alert',
                {
                    message : message,
                    type : type
                }
            )
        }
    };
});