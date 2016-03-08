var connection = require('../../../configuration/database/connection');
var encrypt = require('../../encrypt');
var _ = require('lodash');
module.exports = function (req, res, next) {
    console.log(req.body);
    var validate = function(user, flag) {
        var noError = true;
        if(!user.value) {
            return true;
        }
        switch(flag) {
            case 'name':
                if(user.value.length < 4) {
                    noError = false;
                }
                break;
            case 'password':
                if(!user.value.password || !user.value.repeatedPassword){
                    return true;
                }
                if(user.value.password.length < 8 || user.value.repeatedPassword.length < 8) {
                    noError = false;
                }
                if(user.value.password != user.value.repeatedPassword) {
                    noError = false;
                }
                break;
            case 'clan' :
                if(!user.value) {
                    noError = false;
                }
                break;
            default :
                noError = false;
                break;
        }
        return noError;
    };

    var quering = function(user) {
        if(user.state == 'password') {
            user.value = encrypt(user.value.password);
        }

        var query = 'update users set ' + user.state + '="' + user.value + '" where user_id = "' +
            req.session.userId + '"';
        connection.query(query, function(err) {
            if(err) {
                console.log(err);
                if(err.code == "ER_DUP_ENTRY") {
                    next({
                        data: "username already exists"
                    });
                }else {
                    next(true);
                }
                return;
            }
            res.status(200).end();
        })
    };

    if(!_.isEmpty(req.body) && validate(req.body, req.body.state) ) {
        quering(req.body);
    }else {
        return next({
            data : "not correct data"
        });
    }

};