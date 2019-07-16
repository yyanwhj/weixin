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
        <title>康复直播预告</title>
        <meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
        <meta content="yes" name="apple-mobile-web-app-capable">
        <meta content="black" name="apple-mobile-web-app-status-bar-style">
        <meta content="telephone=no" name="format-detection">
        <link rel="stylesheet" href="<%=basePath %>article/css/base.css" />
        <link rel="stylesheet" href="<%=basePath %>article/css/article_detail.css" />
        <script type="text/javascript" src="<%=basePath %>js/jquery-1.11.1.min.js"></script>
    	<script src="<%=basePath %>js/layer3.1/layer.js"></script>
        <style>
	        .nopreview-bg{
	        	width:100%;height:100%;position:fixed;left:0;top:0;
	        	text-align:center;color:#666
	        	background: -webkit-linear-gradient(#fff, #F5FFD1);
				background: -o-linear-gradient(#fff, #F5FFD1);
				background: -moz-linear-gradient(#fff, #F5FFD1);
				background: linear-gradient(#fff, #F5FFD1);
	        }
	        .nopreview-bg p{color:#717C88;font-size:16px;margin:120px 0 60px;}
        </style>
    </head>
    <body>
   	 	<c:if test="${fn:length(ArticleList) == 0}">
        	<div class="nopreview-bg">
	        	<p>暂无康复直播预告</p>
	        	<img src="images/no_preview.png" width="200px">
        	</div>
        </c:if>
        
        <c:forEach items="${ArticleList}" var="item">
	        <input type="hidden" value="${item.LinkTargetType}" id="LinkTargetType">
	        <input type="hidden" value="${item.LinkURL}" id="LinkURL">
	        <c:if test="${item.LinkTargetType == -1}">
	        	<div class="container" style="padding-top:15px;">
			        <div class="cont">${item.ArticleContent }</div>
		        </div>
	        </c:if>
        </c:forEach>
        
    	<script type="text/javascript">
    	$(function(){
    		var type = $("#LinkTargetType").val();
    		if(type == 5){
    			window.location.href=$("#LinkURL").val();
    		}
    	});
    	</script>
    </body>
</html>