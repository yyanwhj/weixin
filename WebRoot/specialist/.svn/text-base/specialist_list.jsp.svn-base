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
        <title>专家视频咨询</title>
        <meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
        <meta content="yes" name="apple-mobile-web-app-capable">
        <meta content="black" name="apple-mobile-web-app-status-bar-style">
        <meta content="telephone=no" name="format-detection">
        <link rel="stylesheet" href="<%=basePath %>specialist/css/base.css" />
        <link rel="stylesheet" href="<%=basePath %>specialist/css/specialist.css" />
    </head>
    
    <body>
        <img src="images/s_banner.png" class="banner" />
        <c:forEach items="${specialist}" var="item">
	        <c:if test="${empty UserID}"><a href="<%=basePath %>user/toBindAccount?link=specialist/getSpecialist" class="sl-item"></c:if>
	        <c:if test="${not empty UserID}"><a href="getSpecialistTime?doctor_id=${item.DoctorID}" class="sl-item"></c:if>
	        	<img src="${item.Avatar}">
	        	<dl>
	        		<dt>${item.DoctorName}</dt>
	        		<dd>${item.HospitalName}${item.DepartmentName}</dd>
	        		<dd>擅长：${item.Skill}</dd>
	        		<dd class="original-price">原价：<span>￥${item.MarketPrice}/${item.MarketServiceMinutes}分钟</span></dd>
	        		<dd class="price">优惠价：￥${item.Price}/${item.ServiceMinutes}分钟</dd>
	        	</dl>
	        </a>
        </c:forEach>
    </body>
</html>