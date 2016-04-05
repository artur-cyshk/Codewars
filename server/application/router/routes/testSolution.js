var connection = require('../../../configuration/database/connection');
var _ = require('lodash');
var async = require('async');
var assert = require('assert');
var _eval = require('eval');
module.exports = function (req, res, next) {

    if(!req.session.authorized || !req.body.taskId || !req.body.solution) {
        return next(true);
    }

    async.waterfall([
        function(callback) {
            var query = "SELECT parameters, answer,entry_point as entryPoint FROM tests join tasks using(task_id) where task_id = ?";
            connection.query(query,
                [req.body.taskId],
                function(err, tests) {
                    callback(err, tests);
                });
        },
        function(tests, callback) {
            if(_.isObject(tests)) {
                var testsResults = [];
                for(var i = 0; i < tests.length; i++){
                    var test = tests[i];
                    try{

                        var res = _eval(req.body.solution + ' ; module.exports = '+ test.entryPoint + '(' + JSON.parse(test.parameters) + ')');
                    }
                    catch(e) {
                        testsResults.push({
                            message : e.message,
                            name : e.name
                        });
                        callback(null, testsResults);
                        break;
                    }

                    try{
                        assert.deepEqual(res, test.answer);
                    }catch (e) {
                        testsResults.push({
                            result : e.actual,
                            expected : e.expected
                        });
                    }
                }
            }
            callback(null, testsResults);
        }
    ], function (err, testsResults) {
        if(err) {
            return next(true);
        }
        res.status(200).send(testsResults);
    });

};