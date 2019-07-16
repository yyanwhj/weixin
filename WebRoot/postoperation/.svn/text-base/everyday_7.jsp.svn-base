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
		<div class="title">第7天</div>
		<img src="<%=basePath %>postoperation/images/7.png" alt="" style="width:100%;">
		<div class="part">【安全运动】</div>
		<div class="paragraph">可适当运动，注意循序渐进。通常可采取相对安全的散步（每次10～15分钟），散步时如有累的感觉或脉搏超过110～120次/分，立即停止，如出现胸闷，立即含服硝酸甘油，停止运动一段时间。</div>
		<div class="part">【首推海鱼】</div>
		<div class="paragraph">对您来说，食用肉中海鱼最为合适。鱼肉含丰富镁元素，对心血管系统有很好的保护作用，利于预防高血压和心肌梗死等。</div>
		<div class="part">【降压、降糖药】</div>
		<div class="paragraph">如果您患有高血压、糖尿病，医生会嘱咐您继续服用降压、降血糖药物。高血压和高血糖会损伤血管内壁，是冠心病的高危因素。服用降糖药时，注意监测血糖，及时就餐，防止低血糖。服用降压药时，注意监测血压，保持血压平稳。</div>
		<div class="part">【伤口结痂】</div>
		<div class="paragraph">由于穿刺部位的组织反应，局部可能出现硬结，不必担心，2个月内硬结可逐渐消失。</div>
		<div class="paragraph">穿刺伤口处结痂应让其自然脱落，不要人为剥脱。</div>
		<div class="part">【松弛情绪】</div>
		<div class="paragraph">情绪有时挺难琢磨，不是想控制就能控制。如实在控制不住自己的情绪，不妨离开现场，到户外散散步或到安静的地方去抒发放松。具体做法：在舒适位置静坐，闭目，放松周身肌肉，从脚上肌肉开始向上逐渐达到面部肌肉。</div>
	</article>
	<div class="btn">
		<div class="music">
			<audio controls="controls" id="bgsound" preload="auto" >
	   		 	<source src="<%=basePath%>postoperation/music/day_7.wav" type="audio/mpeg"/>
			</audio>
		</div>
	</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath %>postoperation/everyday_6.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_2.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
<input type="hidden" id="pageIndex" value="7" />
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
