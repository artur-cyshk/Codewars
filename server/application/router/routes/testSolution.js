var connection = require('../../../configuration/database/connection');
var _ = require('lodash');
var async = require('async');
var assert = require('assert');
var _eval = require('eval');
var tripwire = require('tripwire');
module.exports = function (req, res, next) {

    if(!req.session.authorized) {
        return next({
            status : 409
        })
    }
    
    if(!req.body.taskId || !req.body.solution) {
        return next(true);
    }
    var finish = req.body.finish;
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
                var testsResults = {};
                testsResults.tests = [];
                testsResults.successTests = 0;
                testsResults.errorTests = 0;
                var REQUEST_TIMEOUT = 6000;
                tripwire.resetTripwire(REQUEST_TIMEOUT);
                var testsCountToTest = (finish) ? tests.length : tests.length/2;
                for(var i = 0; i < testsCountToTest; i++) {
                    var test = tests[i];
                    test.parameters = JSON.parse(test.parameters);
                    try {
                        var res = _eval(req.body.solution + ' ; module.exports = '+ test.entryPoint + '(' + test.parameters + ')');
                    }
                    catch(e) {

                        testsResults.executingError = {
                            message : e.message,
                            name : e.name
                        };
                        callback(null, testsResults);
                        break;
                    }
                    try {
                        assert.deepEqual(res, test.answer);
                        testsResults.tests.push({
                            params : test.parameters,
                            expected : test.answer,
                            result : test.answer,
                            pass : true
                        });
                        testsResults.successTests++;
                    }catch (e) {
                        testsResults.tests.push({
                            result : e.actual,
                            expected : e.expected,
                            pass : false
                        });
                        testsResults.hasErrorTest = true;
                        testsResults.errorTests++;

                        if(finish) {
                            if(testsResults.tests.length < 3){
                                testsResults.tests[testsResults.tests.length-1].params = test.parameters;
                            }
                            callback(null, testsResults);
                            break;
                        }else{
                            testsResults.tests[testsResults.tests.length-1].params = test.parameters;
                        }
                    }
                }
                //todo finish logic
                callback(null, testsResults);
            }else{
                callback(true);
            }

        }
    ], function (err, testsResults) {
        if(err) {
            return next(true);
        }
        res.status(200).send(testsResults);
    });

};