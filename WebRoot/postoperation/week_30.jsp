<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>postoperation/css/postoperation.css">
	<script type="text/javascript" src="<%=basePath%>activity/js/jquery-1.11.1.min.js"></script>
</head>
<body>
	<article>
		<div class="title">第30周</div>
		<div class="part">【服用华法林期间能拔牙吗？】</div>
		<div class="paragraph">如您想拔牙、做胃镜、纤支镜等检查，一定要跟医生说明您正在服用华法林，由医生来判断您能否接受这些治疗或检查，否则，可能造成严重出血。</div>
		<div class="part">【运动后饮食原则】</div>
		<div class="paragraph">运动锻炼后虽很饿，但不能立即进食，可在1小时后再吃。</div>
		<div class="part">【有益心脏之黑色食物】</div>
		<div class="paragraph">黑色食物含有大量维生素，对降低血黏度、血胆固醇有良好效果。您可适当吃些香菇，每天不超过50克，具有降低胆固醇作用。</div>
		<div class="part">【蓝莓可缓解压力】</div>
		<div class="paragraph">如术后生活中总是感觉乏力、压力大，不妨在选择水果时考虑一下蓝莓。它不仅可口，同时富含维生素、植物营养素和各种抗氧化剂，对缓解压力很有帮助。它还具有防止脑神经老化、强心、抗癌软化血管、增强人机体免疫等功能。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_30.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_29.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_31.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="30" />
</body>
<script type="text/javascript">
$(function(){
	var maxWeek = <%=request.getSession().getAttribute("maxWeek")%>;
	var weeks = $("#week").val();
	if(maxWeek <= weeks){
		$("#next").hide();
		$(".u-btnBox .btns a").css("width","45%");
	}
});
</script>
</html>
