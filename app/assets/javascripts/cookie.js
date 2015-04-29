function setCookie(cname,cvalue,exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires=" + d.toGMTString();
    document.cookie = cname+"="+cvalue+"; "+expires;
    
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function checkCookie() {
    var user=getCookie("username");
    if (user == "") {
        var template = $('#intro-card').html();
        Mustache.parse(template);   // optional, speeds up future uses
        var rendered = Mustache.render(template);
        $('.search-results').prepend(rendered);
        $('#get-started span').on('click', function(){
            console.log('yolo');
            $('.right-swipe').click();
        });
        user = "olduser";
        setCookie("username", user, 365);
    } else {

    }
}