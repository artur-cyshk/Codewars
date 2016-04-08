var _ = require('lodash');
module.exports = {
    validate : function(model) {
            var errors = {};
            if( !_.isObject(model) ){
                return true;
            }
            errors.name = !model.name;
            errors.language = !model.language || !model.language.name;
            errors.entryPoint = !model.entryPoint;
            errors.types = !model.types || !model.types.length;
            errors.tests = {};
            errors.tests.length = (!model.tests || model.tests.length < 5);
            errors.tests.results = [];
            if(_.isObject(model.tests)) {
                errors.tests.results = _.map(model.tests, function(item, index) {
                    if(!item.result){
                        return index;
                    }
                });
                errors.tests.results = _.filter(errors.tests.results, function(item) {
                    return item != undefined;
                });
            }else{
                return true;
            }
            errors.description = !model.description;
           
            return (!errors.name && !errors.entryPoint && !errors.language && !errors.tests.length && _.isEmpty(errors.tests.results) && !errors.types && !errors.description);
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