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
        <title>${article.ArticleTitle }</title>
        <meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
        <meta content="yes" name="apple-mobile-web-app-capable">
        <meta content="black" name="apple-mobile-web-app-status-bar-style">
        <meta content="telephone=no" name="format-detection">
        <link rel="stylesheet" href="<%=basePath %>article/css/base.css" />
        <link rel="stylesheet" href="<%=basePath %>article/css/article_detail.css" />
    </head>
    <body>
    	<div class="container">
	        <div class="title">${article.ArticleTitle }</div>
	        <div class="date">${article.PublishDate }</div>
	        <div class="cont">${article.ArticleContent }</div>
	        <%@include file="../common/download_user.jsp" %>
        </div>
    </body>
</html>