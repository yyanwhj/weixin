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
        <title>付款成功</title>
        <meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
        <meta content="yes" name="apple-mobile-web-app-capable">
        <meta content="black" name="apple-mobile-web-app-status-bar-style">
        <meta content="telephone=no" name="format-detection">
        <link rel="stylesheet" href="<%=basePath %>specialist/css/base.css" />
        <link rel="stylesheet" href="<%=basePath %>specialist/css/specialist.css" />
    </head>
    
    <body>
        <div class="os-wrap">
	        <img src="images/icon_success.png" width="50px">
	        <p>恭喜您，您已预约成功！</p>
	    </div> 
	    <p class="os-downapp-tip">   
			<a href="http://dl.ixinzang.com/pasm/d.html">请下载同心管家app 并用绑定账号登录体验服务</a><br>
			您当前绑定的账号是：<span>${MobilePhone}</span>
		</p>
    </body>
</html>