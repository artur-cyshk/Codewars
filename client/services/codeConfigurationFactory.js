app.factory('codeConfigurationFactory', function($timeout) {
    return {
        getConfiguration : function(readOnly){
            return {
                lineWrapping : !readOnly,
                lineNumbers: !readOnly,
                matchBrackets : !readOnly,
                autoCloseBrackets : !readOnly,
                autoRefresh : true,
                readOnly: (readOnly) ? 'nocursor' : false,
                onLoad : function (editor) {
                    if(!readOnly){
                        editor.focus();
                        $timeout(function () {
                            editor.getDoc().setCursor(1, 1);
                        }, 0);
                    }
                },
                mode: 'javascript',
                theme : 'material'
            }
        }
    }
});