;(function($){

    jQuery.fn.toc = function(options) {
        var defaults = {
            startLevel: 'h3',
            endLevel: 'h6',
            listType: 'ul',
            target: 'toc'
        };
        var setting = jQuery.extend(defaults, options);

        var startLevel = setting.startLevel.substr(1, 1);
        var endLevel = setting.endLevel.substr(1, 1);
        var data = '';
        var currentLevel = 0;
        var counter = 1;

        var header = [ 'h1', 'h2', 'h3', 'h4', 'h5', 'h6' ];
        var tmpArray = new Array;
        for (i=startLevel-1; i<endLevel; i++) {
            tmpArray.push( header[i] );
        }
        var headers = tmpArray.join(',');

        $( headers, this ).each(function(){
            if (this.id === "") {
                return true;
            }
            this.id = "chapter" + counter;
            var level = this.nodeName.substr(1, 1) - ( startLevel - 1 );

            while(currentLevel < level) {
                data += '<' + setting.listType + '>';
                currentLevel++;
            }
            while(currentLevel > level) {
                data += '</' + setting.listType + '></li>';
                currentLevel--;
            }
            if ( currentLevel == level ) {
                data += '<li>';
            }
            data += '<a href="#' + this.id + '">' + $(this).html() + "</a>";
            counter++;
        });
        while (currentLevel > 0) {
            data += '</' + setting.listType + '>';
            currentLevel--;
        }
        $("#" + setting.target).html(data);
        return this;
    };
})($)
