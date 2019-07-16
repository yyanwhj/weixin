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
        <title>精彩推荐</title>
        <meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
        <meta content="yes" name="apple-mobile-web-app-capable">
        <meta content="black" name="apple-mobile-web-app-status-bar-style">
        <meta content="telephone=no" name="format-detection">
        <link rel="stylesheet" href="<%=basePath %>article/css/base.css" />
        <link rel="stylesheet" href="<%=basePath %>article/css/article_recommend.css" />
    </head>
    <!-- js -->
    <script type="text/javascript" src="<%=basePath %>js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath %>js/layer3.1/layer.js"></script>
    <body>
    	<div class="rimg-wrap" id="bannerList"></div>
        <ul class="r-nav">
        	<li class="active" data-role="219">冠心病<i></i></li>
        	<li data-role="220">支架<i></i></li>
        	<li data-role="221">三高</li>
        </ul>
        <div id="categoryList">
	        <ul class="rsub-nav clearfix">
	        	<c:forEach items="${CategoryList}" var="item" varStatus="indexStatus">
	        		<c:if test="${indexStatus.index ==0 }"><li class="active" data-id="${item.ACID}">${item.ACTitle }</li></c:if>
	        		<c:if test="${indexStatus.index > 0 }"><li data-id="${item.ACID}">${item.ACTitle }</li></c:if>
	        	</c:forEach>
	        </ul>
	        <div id="ACList">
		        <c:forEach items="${ArticleList }" var="item">
		        	<c:if test="${not empty item.LinkURL }">
				        <a class="article-item" href="${item.LinkURL }">
				        	<img src="${item.Cover}">
				        	<dl class="article-info">
				        		<dt>${item.ArticleTitle }</dt>
				        		<dd><span>${item.PublishDate }</span></dd>
				        	</dl>
				        </a>
			        </c:if>
			        <c:if test="${empty item.LinkURL }">
				        <a class="article-item" href="javascript:void(0)">
				        	<img src="${item.Cover}">
				        	<dl class="article-info">
				        		<dt>${item.ArticleTitle }</dt>
				        		<dd><span>${item.PublishDate }</span></dd>
				        	</dl>
				        </a>
			        </c:if>
		        </c:forEach>
	        </div>
        </div>
        <p class="more-btn" id="recommendMoreBtn">点击加载更多 ></p>
    	<script type="text/javascript" src="<%=basePath %>article/js/article_recommend.js"></script>
    </body>
</html>