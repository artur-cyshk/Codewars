// Karma configuration
// Generated on Mon Apr 11 2016 12:05:27 GMT+0300 (Иорданское время (зима))

module.exports = function(config) {
  config.set({
    basePath: '',
    frameworks: ['jasmine'],
    files: [
      '../client/bower_components/angular/angular.js',
      '../client/bower_components/angular-mocks/angular-mocks.js',
      '../client/bower_components/angular-resource/angular-resource.js',
      '../client/bower_components/angular-ui-router/release/angular-ui-router.js',
      '../client/bower_components/angular-bootstrap/ui-bootstrap-tpls.js',
      '../client/bower_components/socket.io-client/socket.io.js',
      '../client/bower_components/angular-socket-io/socket.js',
      '../client/bower_components/angular-animate/angular-animate.js',
      '../client/bower_components/angular-svg-round-progressbar/build/roundProgress.min.js',
      '../client/bower_components/lodash/lodash.js',
      '../client/bower_components/angular-spinner/angular-spinner.min.js',
      '../client/bower_components/angular-bootstrap-checkbox/angular-bootstrap-checkbox.js',
      '../client/bower_components/ng-file-upload/ng-file-upload.js',
      '../client/bower_components/ng-img-crop/compile/minified/ng-img-crop.js',
      '../client/bower_components/angular-bootstrap/ui-bootstrap-tpls.js',
      '../client/bower_components/nya-bootstrap-select/dist/js/nya-bs-select.js',
      '../client/bower_components/angular-ui-tinymce/dist/tinymce.min.js',
      '../client/bower_components/codemirror/lib/codemirror.js',
      '../client/bower_components/angular-ui-codemirror/ui-codemirror.js',
      '../client/configuration/**/*.js',
      '../client/content/**/*.js',
      '../client/services/**/*.js',
      '../client/tests/*.js'
    ],
    exclude: [
    ],
    preprocessors: {
    },
    reporters: ['progress'],
    port: 9876,
    colors: true,
    logLevel: config.LOG_INFO,
    autoWatch: true,
    browsers: ['Chrome'],
    singleRun: false,
    concurrency: Infinity
  })
};
