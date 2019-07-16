var rv = {
	"tag"   : "",
	"index" : 1,
	"flag"  : 0  //0:当前频道，1:切换频道
}

//nav
$("#videoNav li").click(function(){
	$(this).addClass("active").siblings().removeClass("active");
	rv.tag = $(this).children("span").text();
	rv.index = 1;
	rv.flag = 1;
	getVideoList(rv);
	layer.closeAll(); 
});

//more video
$(window).scroll(function() {
    if( $(window).scrollTop() == $(document).height() - $(window).height() ) {
    	rv.tag = $("#videoNav li.active span").text();
    	rv.index += 1;
    	rv.flag = 0;
    	getVideoList(rv);
    }
});

//get video
function getVideoList(rv){
	layer.load(0, {shade:[1, 'transparent']});
	$.ajax({
		url : "../article/ajax/getRehabilitationVideo",
		data : {ArticleTag:rv.tag,pageIndex:rv.index},
		dataType : "json",
		type : "post",
		success : function(result){
			layer.closeAll('loading'); 
			var vedioList = result.ListInfo;
			if(vedioList.length == 0){
				layer.msg('暂无更多内容');
				return;
			}
			var html = '';
			for(var i=0; i<vedioList.length; i++){
				html += '<dl>';
				html += '<a href="'+basePath+'getVideoDetail?ArticleID='+vedioList[i].ArticleID+'&thirdpartyAccount='+vedioList[i].thirdpartyAccount+'">';
				html += '<img src="'+vedioList[i].Cover+'">';
				html += '<dt>'+vedioList[i].ArticleTitle+'</dt>';
				html += '<dd>播放'+vedioList[i].ViewCount+'</dd>';
				html += '</a>';
				html += '</dl>';
			}
			if(rv.flag == 1){  //切换频道，清空videolist
				$(window).scrollTop(0);
				$("#videoCon").html("");
			}
			$("#videoCon").append(html);
		}
	});
}
