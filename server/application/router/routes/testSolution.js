var connection = require('../../../configuration/database/connection');
var _ = require('lodash');
var async = require('async');
var assert = require('assert');
var _eval = require('eval');
var honorByLevel = require('../../services/honorByLevel');
var tripwire = require('tripwire');
module.exports = function (req, res, next) {

    if(!req.session.authorized) {
        return next({
            status : 409
        })
    }
    
    if(req.body.taskId == undefined || !req.body.solution) {
        return next(true);
    }
    var finish = req.body.finish;
    async.waterfall([
        function(callback) {
            var query = "SELECT parameters, answer,entry_point as entryPoint,level FROM tests join tasks using(task_id) where task_id = ?";
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
                    var parametersArray = _.map(test.parameters, function (param) {
                        return param.value;
                    });
                    try {
                        var res = _eval(req.body.solution + ' ; module.exports = '+ test.entryPoint + '(' + parametersArray + ')');
                    }
                    catch(e) {
                        testsResults.executingError = {
                            message : e.message,
                            name : e.name
                        };
                        return callback(null, testsResults);
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
                    }
                    catch (e) {
                        testsResults.tests.push({
                            result : e.actual,
                            expected : e.expected,
                            pass : false
                        });
                        testsResults.hasErrorTest = true;
                        testsResults.errorTests++;
                        if(finish) {
                            if(testsResults.tests.length < tests.length/2) {
                                testsResults.tests[testsResults.tests.length - 1].params = test.parameters;
                            }
                            return callback(null, testsResults);
                        }else {
                            testsResults.tests[testsResults.tests.length - 1].params = test.parameters;
                        }
                    }
                }

                if(finish) {
                    var query = 'INSERT into solutions set ?';
                    connection.query(query, {
                        'user_id' : req.session.userId,
                        'task_id' : req.body.taskId,
                        'solution_text' : req.body.solution,
                        'add_date' : new Date().toLocaleString()
                    },
                    function(err) {
                        if(err) {
                            return callback(err);
                        }
                        var addedHonor = honorByLevel.getHonor(req.body.level);
                        var query = 'UPDATE users set honor = honor + ' + addedHonor + ' WHERE user_id = ?';
                        connection.query(query,
                            req.session.userId
                        , function (err) {
                            if(err) {
                                return callback(err);
                            }
                            testsResults.allDone = true;
                            testsResults.addedHonor = addedHonor;
                            return callback(null, testsResults);
                        })
                    })
                }else{
                    callback(null, testsResults);
                }
            }else {
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