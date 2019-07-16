<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>抽奖活动</title>
        <meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
        <meta content="yes" name="apple-mobile-web-app-capable">
        <meta content="black" name="apple-mobile-web-app-status-bar-style">
        <meta content="telephone=no" name="format-detection">
        <link rel="stylesheet" href="<%=basePath %>activity/css/base.css" />
        <style>
        	.container{padding-bottom:40px;}
            a.fixedHref{background:#ff7070; text-align:center;display:block;font-size:14px;line-height:3em;position:fixed;bottom:0;width:90%;margin:0px 5%;border-radius:10px;}
            @media screen and (min-width:1000px ){
                a{width:800px;margin:1em 100px 10px  100px;}
            }
        </style>
    </head>
    <body>
    	
        <div class="container">
            ${raffle.RaffleContent}
            <a href="<%=basePath%>activity/download_user.jsp" style="color:#fff;" class="fixedHref">下载app参与活动</a>
        </div>
    </body>
</html>
