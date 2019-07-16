var PageIndex = 1;
$.ajaxSetup({ 
	cache:false,
    async : true 
});

//获取banner
$(function(){
	$.post("../article/getArticleBannerList",function (data){
    	bannerList.innerHTML=data;
    });
	//获取当前主导航
	if(getItem("flag")==1){
		$(".r-nav li").eq(getItem("index1")).click();
	}
});

/*function isPageReturn(){
	flag = getItem("flag");
	if(flag == 0){
		setItem("index2",0);
	}
	if(getItem("index2") && flag==1){
		$(".rsub-nav li").eq(getItem("index2")).click();
	}
	if(getItem("PageIndex") && flag==1){  //获取加载更多的页数
		var currId = $(".rsub-nav li.active").attr("data-id");
		$.post("../article/getArticleACList",{ACID:currId,PageIndex:getItem("PageIndex")},function (data){
			if(data.trim()){
				ACList.innerHTML=ACList.innerHTML + data;
			}
			offsetTop = getItem("offsetTop");  //获取偏移高度
			$(document).scrollTop(offsetTop);
	    });
		PageIndex = getItem("PageIndex");
	}
}*/

//点击一级菜单
$(".r-nav li").click(function(e){
	if($(this).hasClass("active") && getItem("flag")==0){
		return false;
	}
	var navRole = $(this).attr("data-role");
	var index = $(this).index();
	$(this).addClass("active").siblings().removeClass("active");
	
	loading();
	$.post("../article/getArticleCategoryList",{CategoryID:navRole},function (data){
		categoryList.innerHTML=data;
		layer.closeAll('loading'); //关闭加载层
		if(getItem("flag")==1 && getItem("index2")){
			$(".rsub-nav li").eq(getItem("index2")).click();
		}
    });
});


//点击二级菜单
$(document).on("click",".rsub-nav li",function(){
	if($(this).hasClass("active")){
		return false;
	}
	if(getItem("flag") == 0){
		loading();
	}
	$(this).addClass("active").siblings().removeClass("active");
	var index = $(this).index();
	var currId = $(this).attr("data-id");
	$.post("../article/getArticleACList",{ACID:currId},function (data){
		ACList.innerHTML=data;
		PageIndex = 1;
		layer.closeAll('loading'); //关闭加载层
    });
	setItem("flag",0);
});

//点击加载更多文章
$("#recommendMoreBtn").click(function(){
	var currId = $(".rsub-nav li.active").attr("data-id");
	PageIndex = PageIndex + 1;
	loading();
	$.post("../article/getArticleACList",{ACID:currId,PageIndex:PageIndex},function (data){
		layer.closeAll('loading'); //关闭加载层
		if(data.trim()==""){
			layer.msg("暂无更多！");
		} else {
			ACList.innerHTML=ACList.innerHTML + data;
		}
    });
});

//保存文章列表位置
$(document).on("click",".article-item,.rimg-item",function(){
	setItem("flag",1);
//	setItem("offsetTop",$(document).scrollTop());
	setItem("index1",$(".r-nav li.active").index());
	setItem("index2",$(".rsub-nav li.active").index());
});

//设置、获取session值
function setItem(key,val){ //存状态
	sessionStorage.setItem(key, val);
}
function getItem(key){ //取状态
	return sessionStorage.getItem(key);
}

//加载层
function loading(){
	layer.load(0, {shade:[1, 'transparent']});
}