var app = angular.module('codewars',
    [
        'ui.router',
        'ui.bootstrap',
        'btford.socket-io',
        'ngAnimate',
        'angular-svg-round-progress',
        'angularSpinner',
        'nya.bootstrap.select',
        'ui.checkbox',
        'ngFileUpload',
        'ngImgCrop',
        'ui.tinymce',
        'ui.codemirror'
    ]);

app.run(['checkAccessFactory','$rootScope','alertService', function(checkAccessFactory, $rootScope, alertService) {
    checkAccessFactory.checkAccess();
    $rootScope.$on('$stateChangeStart', function() {
        $rootScope.loadingInformation = true;
    });
    $rootScope.$on('$stateChangeSuccess', function(event, toState, toParams, fromState, fromParams) {
        checkAccessFactory.checkAccess(event, toState, toParams, fromState, fromParams);
    });

    $rootScope.$on('stateChangeError', function() {
        $rootScope.loadingInformation = false;
        alertService.alert('something failed, reload please', 'error');
    });
}]);