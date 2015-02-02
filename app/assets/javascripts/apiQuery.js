$(document).on('ready' function() {
	
	function getRecipeJson() {
        var apiKey = "dvxn3Sx834s9J8nO8CJSFZfPZ5KUmWFE";
        var titleKeyword = "lasagna";
        var url = "http://api.bigoven.com/recipes?pg=1&rpp=25&title_kw="
                  + titleKeyword 
                  + "&api_key="+apiKey;
        $.ajax({
            type: "GET",
            dataType: 'json',
            cache: false,
            url: url,
            success: function (data) {
                alert('success');
                console.log(data);
            }
        });
    }
});