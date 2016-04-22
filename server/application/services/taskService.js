var _ = require('lodash');

module.exports = {
    isEmptyResults : function(obj) {
        return _.isEmpty(
            _.filter(obj, function(item) {
                return item.result || !_.isEmpty(item.variables);
            })
        )
    },
    jsonErrorParse : function(value) {
        try{
            if(value !== 'undefined') {
                JSON.parse(value);
            }
            return false;
        }catch(e){
            return true;
        }
    },
    validate : function(model) {
            var errors = {},
                self = this;
            errors.name = !model.name;
            errors.language = !model.language || !model.language.name;
            errors.entryPoint = !model.entryPoint;
            errors.types = !model.types || !model.types.length;
            errors.tests = {};
            errors.tests.length = (!model.tests || model.tests.length < 5);
            errors.tests.results = [];
            if(model.tests && !errors.tests.length) {
                errors.tests.results = _.map(model.tests, function(item) {
                    var testIndex = {};
                    testIndex.result = (item.result == undefined);

                    testIndex.variables = _.filter(
                        _.map(item.variables, function (variable, index) {
                            return (self.jsonErrorParse(variable.value)) ? index : undefined;
                        }),
                        function(item) {
                            return item != undefined;
                        }
                    );
                    testIndex.result = self.jsonErrorParse(item.result);
                    return testIndex;
                });
            }
            errors.description = !model.description;
            return (!errors.name && !errors.entryPoint && !errors.language && !errors.tests.length && self.isEmptyResults(errors.tests.results) && !errors.types && !errors.description);
        },
    getTaskObject : function (task, userId) {
        var taskObject = {
            name : task.name,
            description : task.description,
            language_id : task.language.languageId,
            add_date : new Date().toLocaleString(),
            entry_point : task.entryPoint
        };
        if(userId) {
            taskObject['user_id'] = userId;
        }
        return taskObject;
    },
    
    mapTypes : function(types, taskId){
        return _.map(types, function(type){
            return  [type.typeId, taskId];
        });
    },
    mapTests : function(tests, taskId){
        return _.map(tests, function(test){
            test.variables = _.filter(test.variables, function (variable) {
                return variable.value;
            });
            return  [taskId, JSON.stringify(test.variables), test.result];
        });
    }
};