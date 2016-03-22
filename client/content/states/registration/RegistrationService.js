app.factory('registrationService', function (alertService, $http) {
    return {
        registrUser : function(user){
           return $http.post('/registration', user);
        },
        validate : function(user) {
            if(!user.name || user.name.length < 4) {
                alertService.alert('username minimal length - 4','error');
                return;
            }
            if(!user.password || !user.repeatedPassword || user.password.length < 8 || user.repeatedPassword.length < 8) {
                alertService.alert('password minimal length - 8','error');
                return;
            }
            if(user.password != user.repeatedPassword) {
                alertService.alert('passwords are not equals','error');
                return;
            }
            return true;
        }
    };
});