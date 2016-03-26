app.factory('managementTaskService', function ($http, alertService, $rootScope, $state) {
    var selfService = this;
    selfService.getTypes = function() {
        return $http.get('/types');
    };

    selfService.getLanguages = function() {
        return $http.get('/languages');
    };

    return {
        checkClosest : function (className) {
            return (angular.element(event.target).closest(className));
        },
        TaskData : function (managment , taskIdToEdit) {
            var self = this;

            this.MIN_TEST_COUNT = 5;


            this.formatData = function (types, languages) {
                var defaultData = {};
                defaultData.management = managment;
                defaultData.types = types;
                defaultData.languages = languages;
                defaultData.tests = [];
                self.defaultData = defaultData;
                if(taskIdToEdit) {
                    self.getTaskModelInEditMode(self.defaultData.tests);
                }else{
                    self.setModel(self.defaultData.tests);
                }
            };

            this.getTaskModelInEditMode = function(tests){
                $http.get('/taskWithTests/' + taskIdToEdit)
                    .success(function(task){
                        self.setModel(tests, task);
                    })
                    .error(function(err, status){
                        if(status != 401){
                            alertService.alert( err || 'server error, try later', 'error');
                            $state.go('root.tasks');
                        }
                        $rootScope.loadingInformation = false;
                    })
            };

            this.setModel = function(tests , task){
                self.model = {};
                self.model.tests = tests;
                if (task && _.isObject(task)) {
                    self.model = task;
                    self.defaultData.tests = self.model.tests;
                }else{
                    self.addMinimalTests( self.MIN_TEST_COUNT );
                }

                $rootScope.loadingInformation = false;
            };

            this.addMinimalTests = function (count) {
                for( var i = 0 ; i < count ; i++){
                    self.addTest(i);
                }
            };

            this.getTestsLength = function () {
                return self.defaultData.tests.length;
            };

            this.addTest = function (newTestIndex) {
                self.defaultData.tests[ newTestIndex ] =  {};
                self.defaultData.tests[ newTestIndex ].variables = [];
                self.defaultData.tests[ newTestIndex ].variables[0] = null;
            };

            this.removeTest = function (index) {
                if(self.getTestsLength() <= self.MIN_TEST_COUNT) {
                    return alertService.alert('Warning! At least five tests', 'error');
                }
                self.defaultData.tests.splice(index, 1);
            };

            this.removeVariable = function (testIndex, variableIndex) {
                self.defaultData.tests[testIndex].variables.splice(variableIndex, 1);
            };

            this.addVariable = function (testIndex, newVariableIndex) {
                self.defaultData.tests[testIndex].variables.length = newVariableIndex + 1;
            };

            this.getLanguages = function(types) {
                selfService.getLanguages()
                    .success(
                        function(languages){
                            self.formatData(types, languages)
                        })
                    .error(
                        function () {
                            alertService.alert('server error, try later', 'error');
                        })
            };

            this.getInformation = function () {
                $rootScope.loadingInformation = true;
                selfService.getTypes()
                    .success(
                        function(types){
                            self.getLanguages(types);
                        })
                    .error(
                        function () {
                            alertService.alert('server error, try later', 'error');
                        })
            }
        }
    };
});