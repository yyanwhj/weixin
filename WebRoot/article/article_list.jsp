<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../common/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
    <head>
   
        <meta charset="utf-8">
         <title>同心百科</title>
        <meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
        <meta content="yes" name="apple-mobile-web-app-capable">
        <meta content="black" name="apple-mobile-web-app-status-bar-style">
        <meta content="telephone=no" name="format-detection">
        <script type="text/javascript" src="<%=basePath %>activity/js/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="<%=basePath %>article/css/base.css" />
        <link rel="stylesheet" href="<%=basePath %>article/css/article_list.css" />
        <style>
        	#htmlCode{
        		padding-bottom:40px;
        	}
        	.more a{
        		position:fixed;
        		width:100%;
        		left:0;
        		bottom:0;
        		background:#04be02;
        		color:#fff;
        	}
        </style>
    </head>
    <body>
	    <div id="htmlCode">
		    <c:forEach items="${articleList }" var="art">
		        <section>
			        <a href="<%=basePath %>getArticleDetail?articleID=${art.ArticleID}"  class="clearfix">
			            <div class="img"><img src="${art.Cover }" alt="" /></div>
			            <div class="desc">
			                <div class="title">${art.ArticleTitle }</div>
			                <div class="cont">${art.ArticleDescription }</div>
			            </div>
			        </a>
		        </section>
		    </c:forEach>
		   </div>
	    	<div class="more clearfix" id="loadMore"><a href="javascript:void(0);" onclick="getMoreArticle();">点击加载更多</a></div>
	    	<div id="noMore" class="more clearfix"><span>没有更多数据</span></div>
	    <input type="hidden" id="pageIndex" value="${pageIndex }">
	    <input type="hidden" id="pageCount" value="${pageCount }">
    </body>
    <script type="text/javascript">
    $(function(){
    	var pageIndex = parseInt($("#pageIndex").val());
    	var pageCount = parseInt($("#pageCount").val());
    	
    	if(!pageIndex || pageIndex>1){
  		  $("#pageIndex").val(1);
  		  $("#pageCount").val(1);
  	  	}
    	
    	$(".desc .title").each(function(){
            var str = $(this).text();
            var strlen = str.length;
            if(strlen > 20){
                $(this).text($(this).text().trim().substring(0, 20)+"...");
            }else{
                $(this).text($(this).text());
            }
        });
        $(".desc .cont").each(function(){
            var str = $(this).text();
            var strlen = str.length;
            if(strlen > 20){
                $(this).text($(this).text().trim().substring(0, 20)+"...");
            }else{
                $(this).text($(this).text());
            }
        });
    	
    });
    
    	function getMoreArticle(){
    		var pageIndex = parseInt($("#pageIndex").val()) + 1;
    		$.ajax({
    			type : "post",//无此配置，提交中文乱码
    			cache : false,
    			url : "${pageContext.request.contextPath}/getMoreArticleList",
    			data:{pageIndex: pageIndex},
    			dataType : "json",
    			success : function(data) {
    				if(data.Result.Status == 200){
    					var pageCount = $("#pageCount").val(); 
    					
    					if(data.Result.Message==""){
    						$("#loadMore").hide();
    						$("#noMore").show();
    					}else{
    						$("#htmlCode").append(data.Result.Message);
    					}
    					
    					$("#pageIndex").val(data.Result.pageIndex);
    				}else{
    					alert(data.Result.Message);
    				}
    			}
    		});
    	}
    </script>
</html>