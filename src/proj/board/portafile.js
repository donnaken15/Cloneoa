document.body.onload = function() {
	var pflinks = document.querySelectorAll(".message a");
    var tempvar0;
    for (var i = 0; i < pflinks.length; i += 1)
    {
        if (pflinks[i].href.startsWith("https://klo.boards.net/page/lvdl?")) {
        	tempvar0 = new URL(pflinks[i].href)
            pflinks[i].download = tempvar0.searchParams.get("name")
            pflinks[i].href = "data:klo/lvl;base64,"+tempvar0.searchParams.get("data")
        }
    }
}
