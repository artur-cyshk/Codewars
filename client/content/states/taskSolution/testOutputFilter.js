app.filter('testOutputFilter', function() {
    return function(output){
        if(typeof output == 'string'){
            output = '"' + output + '"';
        }
        if(output === undefined) {
            output = 'undefined'
        }
        if(output === null) {
            output = 'null'
        }
        return output;
    }
});