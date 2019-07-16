var Keyword   = $("#Keyword");
var PageIndex = 1;
//搜索
function searchArticle(){
	loading();
	PageIndex = 1;
	if($.trim(Keyword.val()) == ""){
		console.log($.trim(Keyword.val()));
		layer.msg("请输入搜索内容！");
		layer.closeAll('loading'); //关闭加载层
		return false;
	}else{
		fm.submit();
		layer.closeAll('loading'); //关闭加载层
		return true;
	}
}

//点击加载更多文章
$("#recommendMoreBtn").click(function(){
	loading();
	PageIndex = PageIndex + 1;
	$.post("../article/getSearchArticleListMore",{Keyword:Keyword.val(),PageIndex:PageIndex},function (data){
		layer.closeAll('loading'); //关闭加载层
		if(data.trim()==""){
			layer.msg("暂无更多！");
		} else {
			AList.innerHTML=AList.innerHTML + data;
		}
    });
});

//保存文章列表位置
/*$(document).on("click",".article-item",function(){
	var url = $(this).attr("href");
	if(url.indexOf("http") == -1){
		return false;
	}
	setItem("flag",1);
	setItem("PageIndex",PageIndex);
	setItem("offsetTop",$(document).scrollTop());
});*/

//获取跳转前的页数
/*if(getItem("flag")==1){
	loading();
	setItem("flag",0);
	$.post("../article/getSearchArticleListMore",{Keyword:Keyword.val(),PageIndex:getItem("PageIndex")},function (data){
		layer.closeAll('loading'); //关闭加载层
		if(data.trim()){
			AList.innerHTML=AList.innerHTML + data;
		}
		offsetTop = getItem("offsetTop");
		$(document).scrollTop(offsetTop);
    });
	PageIndex = getItem("PageIndex");
}*/

//设置、获取session值
/*function setItem(key,val){ //存状态
	sessionStorage.setItem(key, val);
}
function getItem(key){ //取状态
	return sessionStorage.getItem(key);
}*/

//加载层
function loading(){
	layer.load(0, {shade:[1, 'transparent']});
}