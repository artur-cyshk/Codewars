angular.module('codewars').factory('aceFactory', function() {
    return {
        getConfiguration : function(insertText, readOnly, activeLine, cursor){
            return {
                showGutter: true,
                mode : 'javascript',
                showPrintMargin : false,
                onLoad: function (_ace) {
                    // HACK to have the ace instance in the scope...
                    _ace.insert(insertText);
                    _ace.setTheme("ace/theme/clouds_midnight");
                    _ace.setHighlightActiveLine(activeLine);
                    _ace.setReadOnly(readOnly);
                    _ace.renderer.$cursorLayer.element.style.display = cursor;
                    _ace.getSession().setUseSoftTabs(true);
                    _ace.resize();
                },
                require: ['ace/ext/language_tools'],
                advanced: {
                    enableSnippets: true,
                    enableLiveAutocompletion: true
                }
            }
        }
    }
});