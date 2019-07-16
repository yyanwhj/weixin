<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../common/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>医生详情页</title>
	<meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">

   	<link rel="stylesheet" href="<%=basePath%>activity/css/base.css">
	<link rel="stylesheet" href="<%=basePath%>activity/css/details_activity.css">
	<script type="text/javascript" src="<%=basePath%>activity/js/jquery-1.11.1.min.js"></script>
</head>
<body>
	<section>
		<div class="clearfix">
			<div class="doc_img"><img src="${doctor.Avatar }"></div>
			<div class="info">
				<div class="doc_name">
					<span>${doctor.DoctorName }</span>
					<span>${doctor.MedicalJobTitle }</span>
				</div>
				<div class="doc_hosp">${doctor.JobTitle }</div>
				<div class="doc_hosp">${doctor.HospitalName }</div>
				<div class="doc_adept">
					<span>擅长：</span>
					<span class="cont">${doctor.Skill }</span>
				</div>
			</div>
		</div>
	</section>

	<article>
		<div class="art_cont">${doctor.Resume }</div>
	</article>
</body>
</html>
