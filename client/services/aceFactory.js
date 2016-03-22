angular.module('codewars').factory('aceFactory', function() {
    return {
        getConfiguration : function(insertText, readOnly, activeLine, cursor, showGutter){
            return {
                showGutter: showGutter,
                mode : 'javascript',
                showPrintMargin : false,
                highlightGutterLine : false,
                onLoad: function (_ace) {
                    // HACK to have the ace instance in the scope...
                    _ace.insert(insertText);
                    _ace.setTheme("ace/theme/monokai");
                    _ace.setHighlightActiveLine(activeLine);
                    _ace.setReadOnly(readOnly);
                    _ace.renderer.$cursorLayer.element.style.display = cursor;
                    _ace.getSession().setUseSoftTabs(true);
                    _ace.resize();
                    _ace.renderer.setPadding( 10 );
                    _ace.renderer.setScrollMargin(10, 10);

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