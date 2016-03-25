app.factory('profileService', function ($http, $uibModal, $templateCache, Upload) {
    return {
        getUser : function() {
            return $http.get('/user');
        },
        logout : function() {
            return $http.get('/logout');
        },
        openSelectAvatarModal : function () {
            return $uibModal.open({
                animation: true,
                templateUrl: 'content/states/selectAvatarModal/selectAvatarTemplate.html',
                controller: 'SelectAvatarCtrl',
                size: 'sm'
            });
        },
        uploadAvatar : function(dataUrl, name) {
            return Upload.upload({
                url: '/uploadAvatar',
                data: {
                    file: Upload.dataUrltoBlob(dataUrl, name)
                }
            })
        }
    };
});