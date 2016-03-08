app.factory('changeProfileService', function (alertService, $http) {
    return {
        changeProfile : function(data) {
            return $http.post('/changeProfile', data);
        },
        validate : function(state, user) {
            var error = false;
            switch(state){
                case 'name':
                    if(!user.name || user.name.length < 4){
                        alertService.alert('username minimal length - 4','error');
                        error = true;
                    }
                    break;
                case 'clan':
                    if(!user.clan){
                        alertService.alert('clan minimal length - 1','error');
                        error = true;
                    }
                    break;
                case 'password':
                    if(!user.password || !user.repeatedPassword || user.password.length < 8 || user.repeatedPassword.length < 8){
                        alertService.alert('password minimal length - 8','error');
                        error = true;
                    }
                    if(user.password != user.repeatedPassword){
                        alertService.alert('passwords are not equals','error');
                        error = true;
                    }
                    break;
                default:
                    break;
            }
            return error;
        }
    };
});