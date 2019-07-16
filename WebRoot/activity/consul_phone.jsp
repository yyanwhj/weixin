<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../common/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>电话咨询</title>
        <meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
        <meta content="yes" name="apple-mobile-web-app-capable">
        <meta content="black" name="apple-mobile-web-app-status-bar-style">
        <meta content="telephone=no" name="format-detection">
        <link rel="stylesheet" href="<%=basePath %>activity/css/base.css" />
        <link rel="stylesheet" href="<%=basePath %>activity/css/calling.css" />
    </head>
       <body>
        <div class="list">
            <img src="<%=basePath %>activity/images/call_1.png"alt="" />
            <div class="desc">
                <div class="title">团队</div>
                <div class="cont">这里有专业的医师团队，为您提供专业的支架术后康复咨询。</div>
            </div>
        </div>

        <div class="list">
            <img src="<%=basePath %>activity/images/call_2.png"alt="" />
            <div class="desc">
                <div class="title">时间</div>
                <div class="cont">咨询时间为周一至周日8：30 - 17：30</div>
            </div>
        </div>

        <div class="list">
            <img src="<%=basePath %>activity/images/call_3.png"alt="" />
            <div class="desc">
                <div class="title">资费</div>
                <div class="cont">拨打010-53767509，您只需支付普通市话费，不产生其它任何附加费用。</div>
            </div>
        </div>

        <div class="calling">
            <p><a href="tel:4000898898">010-53767509</a></p>
            <a href="tel:4000898898"><img src="<%=basePath %>activity/images/call_4.png" alt="" /></a>
        </div>

    </body>
</html>