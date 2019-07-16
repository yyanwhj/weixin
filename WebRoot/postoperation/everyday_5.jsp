<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
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
		<div class="title">第5天</div>
		<img src="<%=basePath %>postoperation/images/5.png" alt="" style="width:100%;">
		<div class="part">【避免剧烈运动】</div>
		<div class="paragraph">为了更快康复，支架术后，您应适量运动，但不宜剧烈运动，如跑步、爬山、做体育器械等。可选择室外散步，散步时间及次数可根据自己实际情况逐渐增加。</div>
		<div class="part">【控制脂肪摄入】</div>
		<div class="paragraph">控制饮食中总脂肪及饱和脂肪酸的摄入。烹调菜肴时，不用猪油、黄油、骨髓油等动物油。最好用花生油、豆油、玉米油等植物油。减少肥肉和动物内脏摄入，增加不饱和脂肪酸含量较多的海鱼和豆类的摄入。</div>
		<div class="part">【服药别喝太多水】</div>
		<div class="paragraph">服药后喝水过多会稀释胃液，不利于对药物溶解吸收。一般来说，送服固体药物1小杯温水就足够。要记住，千万别用汽水、果汁、牛奶、可乐、酒等送服药物，它们都会在一定程度上影响某些药物的吸收，降低药效。</div>
		<div class="part">【伤口异常急就诊】</div>
		<div class="paragraph">一般术后5天伤口应完全愈合，不会出现明显疼痛，若有疼痛、伤口化脓或手臂下垂发紫等现象，及时至医院就诊。</div>
	</article>
	<div class="btn">
		<div class="music">
			<audio controls="controls" id="bgsound" preload="auto" >
				<source src="<%=basePath%>postoperation/music/day_5.wav" type="audio/mpeg"/>
			</audio>
		</div>
	</div>
	<div class="u-btnBox">
		<div class="btns">		
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath %>postoperation/everyday_4.jsp">上一章</a>
			<a id="next" href="<%=basePath %>postoperation/everyday_6.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
<input type="hidden" id="pageIndex" value="5" />
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
