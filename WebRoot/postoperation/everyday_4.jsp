<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta charset="UTF-8">
	<title></title>
	<meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>postoperation/css/postoperation.css">
	<script type="text/javascript" src="<%=basePath%>activity/js/jquery-1.11.1.min.js"></script>
	<style>
		.catalog a{
			display:block;
		}
	</style>
</head>
<body>
	<article>
		<div class="title">第4天</div>
		<img src="<%=basePath %>postoperation/images/4.png" alt="" style="width:100%;">
		<div class="part">【调整运动量】</div>
		<div class="paragraph">您在运动过程中，如有不适感，出现疲惫、胸闷、盗汗、眩晕、恶心、呼吸困难或脸色苍白等症状时，表明心脏不能承受正在进行的运动量和运动强度，应立即停止，充分休息。下次再做此项运动要减轻运动量和强度。</div>
		<div class="part">【控制糖类摄入】</div>
		<div class="paragraph">您也要控制糖的摄入，因为摄入含糖的食物（如蛋糕、点心、含糖饮料）过多，会热量过剩，在体内转化为脂肪，引起肥胖，使血脂升高。</div>
		<div class="part">【服药后，歇息30分】</div>
		<div class="paragraph">吃饭后不要马上运动，服药后也不宜马上运动，服药后一般需要30～60分钟药物才能被胃肠溶解吸收，发挥作用，这期间需足够的血液参与循环。服药后马上运动会导致胃肠等脏器血液供应不足，药物的吸收效果自然就大打折扣。</div>
	</article>
	<div class="btn">
		<div class="music">
			<audio controls="controls" id="bgsound" preload="auto" >
	   		 	<source src="<%=basePath%>postoperation/music/day_4.wav" type="audio/mpeg"/>
			</audio>
		</div>
	</div>
	<div class="u-btnBox">
		<div class="btns">	
		<a href="<%=basePath %>/postoperation/everyday_catalog.jsp">目录</a>
		<a href="<%=basePath %>/postoperation/everyday_3.jsp">上一章</a>
		<a id="next" href="<%=basePath %>/postoperation/everyday_5.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
<input type="hidden" id="pageIndex" value="4" />
</body>
<script type="text/javascript">
	$(function(){
		var maxDay = <%=request.getSession().getAttribute("maxDay")%>;
		var pageIndex = $("#pageIndex").val();
		if(maxDay <= pageIndex){
			$("#next").hide();
			$(".u-btnBox .btns a").css("width","45%");
		}
	});
</script>
</html>
