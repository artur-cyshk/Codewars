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
                var testsResults = [],
                    REQUEST_TIMEOUT = 6000;
                tripwire.resetTripwire(REQUEST_TIMEOUT);
                for(var i = 0; i < tests.length; i++) {
                    var test = tests[i];
                    test.parameters = JSON.parse(test.parameters);
                    try {
                        var res = _eval(req.body.solution + ' ; module.exports = '+ test.entryPoint + '(' + test.parameters + ')');
                    }
                    catch(e) {
                        testsResults.push({
                            message : e.message,
                            name : e.name,
                            executingError: true
                        });
                        callback(null, testsResults);
                        break;
                    }
                    try {
                        assert.deepEqual(res, test.answer);
                        testsResults.push({
                            params : test.parameters,
                            expected : test.answer,
                            pass : true,
                            test : true
                        });
                    }catch (e) {
                        testsResults.push({
                            result : e.actual,
                            params : test.parameters,
                            expected : e.expected,
                            pass : false,
                            test : true
                        });
                    }
                }
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