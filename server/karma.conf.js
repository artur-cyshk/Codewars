// Karma configuration
// Generated on Mon Apr 11 2016 12:05:27 GMT+0300 (Иорданское время (зима))

module.exports = function(config) {
  config.set({

    // base path that will be used to resolve all patterns (eg. files, exclude)
    basePath: '',

    frameworks: ['jasmine'],

    // list of files / patterns to load in the browser
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


    // list of files to exclude
    exclude: [
    ],


    // preprocess matching files before serving them to the browser
    // available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors: {
    },


    // test results reporter to use
    // possible values: 'dots', 'progress'
    // available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: ['progress'],


    // web server port
    port: 9876,


    // enable / disable colors in the output (reporters and logs)
    colors: true,


    // level of logging
    // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_INFO,


    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: true,


    // start these browsers
    // available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: ['Chrome'],


    // Continuous Integration mode
    // if true, Karma captures browsers, runs the tests and exits
    singleRun: false,

    // Concurrency level
    // how many browser should be started simultaneous
    concurrency: Infinity
  })
}
