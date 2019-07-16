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
        <title>号内搜索</title>
        <meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
        <meta content="yes" name="apple-mobile-web-app-capable">
        <meta content="black" name="apple-mobile-web-app-status-bar-style">
        <meta content="telephone=no" name="format-detection">
        <link rel="stylesheet" href="<%=basePath %>article/css/base.css" />
        <link rel="stylesheet" href="<%=basePath %>article/css/article_search.css" />
    </head>
    <body>
    	<form id="fm" action="<%=basePath %>article/getSearchArticleList" method="post" onsubmit="return searchArticle();">
	    	<div class="search-wrap clearfix">
	    		<a href="/article/getArticleList?CategoryID=219&response_type=code&scope=snsapi_base&state=1#wechat_redirect"><img src="<%=basePath %>article/images/logo.png"></a>
	    		<input id="Keyword" name="Keyword" value="${Keyword }" type="text" placeholder="请输入搜索内容">
	    		<button type="submit">搜索</button>
	    	</div>
    	</form>
    	<div id="AList">
	    	<c:if test="${not empty IsShowData }">
		    	<c:forEach items="${ArticleList }" var="item">
		   			<c:if test="${not empty item.LinkURL }">
				        <a class="article-item" href="${item.LinkURL }">
				        	<img src="${item.Cover}">
				        	<dl class="article-info">
				        		<dt>${item.ArticleTitle }</dt>
				        		<dd><span class="green">同心管家</span><span>${item.PublishDate }</span></dd>
				        	</dl>
				        </a>
			        </c:if>
			        <c:if test="${empty item.LinkURL }">
				        <a class="article-item" href="<%=basePath %>getArticleDetail?articleID=${item.ArticleID }">
			        	<img src="${item.Cover}">
			        	<dl class="article-info">
			        		<dt>${item.ArticleTitle }</dt>
			        		<dd><span class="green">同心管家</span><span>${item.PublishDate }</span></dd>
			        	</dl>
			        </a>
		        	</c:if>
		    	</c:forEach>
	    	</c:if>
    	</div>
    	<c:if test="${ DataCount>0 }">
    		<p id="recommendMoreBtn" class="more-btn">点击加载更多 ></p>
    	</c:if>
    	<c:if test="${ DataCount==0 && not empty IsShowData}">
    		<p class="search-none">没有相关搜索内容</p>
    	</c:if>
        <script type="text/javascript" src="<%=basePath %>activity/js/jquery-1.11.1.min.js"></script>
        <script src="<%=basePath %>js/layer3.1/layer.js"></script>
        <script src="<%=basePath %>/article/js/article_search.js"></script>
    </body>
</html>