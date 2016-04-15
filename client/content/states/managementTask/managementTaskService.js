app.factory('managementTaskService', function ($http, alertService, $rootScope, $state) {
    var selfService = this;
    selfService.getTypes = function() {
        return $http.get('/types');
    };

    selfService.getLanguages = function() {
        return $http.get('/languages');
    };

    selfService.desciptionContent = "";

    return {
        isEmpty : function(obj) {
            return _.isEmpty(obj);
        },
        addHonor : function (honor, creator) {
            return $http.put('/userHonor', {
                honor : honor,
                creatorId : creator
            });
        },
        getTinymseOptions : function () {
            return {
                inline: false,
                setup: function(editor) {
                    var self = this;
                    editor.on('change', function () {
                        self.setDescriptionContent(editor.getContent({'format' : 'text'}).trim() );
                    });
                },
                setDescriptionContent : function (content) {
                    selfService.desciptionContent = content;
                },
                plugins: [
                    "advlist link image lists charmap print preview hr anchor pagebreak",
                    "visualblocks visualchars code fullscreen insertdatetime media",
                    "table contextmenu directionality emoticons paste textcolor colorpicker"
                ],

                toolbar1: "preview| styleselect fontselect ",
                toolbar2: "cut copy paste | bullist numlist | outdent indent | undo redo | link unlink anchor image media | code insertdatetime",
                toolbar3: "table fullscreen| hr removeformat | charmap emoticons | print  | spellchecker | visualchars visualblocks",
                toolbar4: "bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | forecolor backcolor",


                menubar: false,
                toolbar_items_size: 'small'
            }
        },
        isEmptyResult : function(arr, index) {
            return _.includes(arr , index);
        },
        validate : function(model) {
            var errors = {};
            errors.name = !model.name;
            errors.language = !model.language || !model.language.name;
            errors.entryPoint = !model.entryPoint;
            errors.types = !model.types || !model.types.length;
            errors.tests = {};
            errors.tests.length = (!model.tests || model.tests.length < 5);
            if(errors.tests.length){
                alertService.alert('Warning! At least five tests', 'error');
            }
            errors.tests.results = [];
            if(model.tests) {
                errors.tests.results = _.map(model.tests, function(item, index) {
                        if(!item.result){
                            return index;
                        }
                });
                errors.tests.results = _.filter(errors.tests.results, function(item) {
                    return item != undefined;
                });
            }
            errors.description = !selfService.desciptionContent;
            errors.no = (!errors.name && !errors.entryPoint && !errors.language && !errors.tests.length && _.isEmpty(errors.tests.results) && !errors.types && !errors.description);
            return (errors.no) ? false : errors;
        },
        errorHandler : function(err, status) {
            if(status != 401) {
                alertService.alert(err || 'server error, try later', 'error');
            }
            $rootScope.loadingInformation = false;
        },
        checkClosest : function ($event, className) {
            return (angular.element($event.target).closest(className));
        },
        addTask : function (task){
            return $http.post('/task', task);
        },
        editTask : function(id, task){
            return $http.put('/task/' + id, task);
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
                self.defaultData.tests[ newTestIndex ].variables[0] = {};
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
                self.defaultData.tests[testIndex].variables[newVariableIndex] = {};
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