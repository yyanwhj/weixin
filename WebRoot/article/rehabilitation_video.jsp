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
        <title>康复讲座视频</title>
        <meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
        <meta content="yes" name="apple-mobile-web-app-capable">
        <meta content="black" name="apple-mobile-web-app-status-bar-style">
        <meta content="telephone=no" name="format-detection">
        <link rel="stylesheet" href="<%=basePath %>article/css/base.css" />
        <link rel="stylesheet" href="<%=basePath %>article/css/rehabilitation_video.css" />
        <script type="text/javascript" src="<%=basePath %>js/jquery-1.11.1.min.js"></script>
    	<script src="<%=basePath %>js/layer3.1/layer.js"></script>
    </head>
    <body>
        <ul class="v-nav" id="videoNav">
        	<li class="active">
        		<span>百科讲座</span>
        	</li>
        	<li>
        		<span class="vb">用药管理</span>
        	</li>
        	<li>
        		<span class="vc">动漫系列</span>
        	</li>
        </ul>
        <h3 class="v-title">全部视频</h3>
        <div class="v-list clearfix" id="videoCon">
        	<c:forEach items="${videoList}" var="video">
		        <dl>
	        		<a href="<%=basePath%>getVideoDetail?ArticleID=${video.ArticleID}&thirdpartyAccount=${thirdpartyAccount}">
		        		<img src="${video.Cover}">
		        		<dt>${video.ArticleTitle}</dt>
		        		<dd>播放${video.ViewCount}</dd>
	        		</a>
		        </dl>
        	</c:forEach>
        </div>
    	<script type="text/javascript">
    		var basePath = "<%=basePath%>";
    	</script>
    	<script type="text/javascript" src="<%=basePath %>article/js/rehabilitation_video.js"></script>
    </body>
</html>