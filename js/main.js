$(function() {
    $("table").addClass("table");

    // toc
    $("body").toc({
        startLevel: 'h2',
        endLevel: 'h3',
        listType: 'ol'
    });

    // collapse
    $(".collapse").collapse()

    // lazyload of image
    $("img").lazyload();

    // external link must be opened in blank window
    $("a[href^='http']:not([href*='" + location.hostname + "'])").attr('target', '_blank');

    $(document).delegate('*[data-toggle="lightbox"]', 'click', function(event) {
        event.preventDefault();
        $(this).ekkoLightbox();
    });

    // page-top link
    var pageTop = $("#page-top");
    pageTop.click(function () {
        $('body, html').animate({ scrollTop: 0 }, 500);
        return false;
    });
    $(window).scroll(function () {
        if($(this).scrollTop() >= 200) {
            pageTop.css( "bottom", "10px" );
        } else {
            pageTop.css( "bottom", "-60px" );
        }
    });

    // environment message
    if ('localhost:4000' == location.host || '127.0.0.1:4000' == location.host) {
        $("body").prepend('<div class="alert alert-warning" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>ローカル環境で表示しています</strong></div>');
    } else if ('staging' == location.pathname.split('/')[1]) {
        $("body").prepend('<div class="alert alert-warning" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>検証環境で表示しています</strong></div>');
    }

});
