<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>微信服务号介绍</title>
		<meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
		<meta content="yes" name="apple-mobile-web-app-capable">
		<meta content="black" name="apple-mobile-web-app-status-bar-style">
		<meta content="telephone=no" name="format-detection">
	
	    <link rel="stylesheet" href="<%=basePath%>activity/css/base.css"> 
		<link rel="stylesheet" href="<%=basePath%>activity/css/introduce.css">
		<link rel="stylesheet" href="<%=basePath%>activity/css/app.css">
	</head>
	<body>
		<section class="logo"><img class="logo" src="images/logo.png" alt=""></section>
		<div class="btn">	
			<a href="http://itunes.apple.com/cn/app/tong-xin-guan-jia/id955855964?mt=8">下载iphone版</a>
			<a href="http://a.app.qq.com/o/simple.jsp?pkgname=com.lepu.pasm">下载Android版</a>
		</div>
	</body>
</html>
