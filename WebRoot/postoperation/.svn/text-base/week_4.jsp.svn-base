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
		<div class="title">第4周</div>
		<div class="part">【术后一个月复查】</div>
		<div class="paragraph">术后一个月，需到医院复查，复查的项目有：血常规、生化（血脂、血糖、肝功能、肾功能、肌酶）、便潜血、血压、心率、心电图、超声心动图。</div>
		<div class="part">【阿司匹林的作用】</div>
		<div class="paragraph">支架术后，血管被支架损伤，血小板在支架部位聚集，形成血栓，导致血管内血流显著减少甚至完全闭塞，发生心肌梗死。阿司匹林能够有效防止血小板聚集，阻止血栓形成的起始步骤，从而有效降低心血管事件发生。</div>
		<div class="part">【运动禁忌】</div>
		<div class="paragraph">１、各种动作活动要轻，行走要缓，避免动作过大。</div>
		<div class="paragraph">２、经腿部穿刺者要避免频繁下蹲、久蹲、抬腿等挤压伤口的动作。</div>
		<div class="paragraph">３、经手臂穿刺者要避免上肢过度弯曲、提重物等动作。如无不适，逐渐开始轻度运动。</div>
		<div class="part">【控制胆固醇摄入】</div>
		<div class="paragraph">每天胆固醇摄入量控制在300毫克以下（一个鸡蛋黄约含300毫克胆固醇）。尽量少吃或不吃高胆固醇食物，如猪腰子、猪肝、牛肝、猪肚、猪脑、肥猪肉、骨髓、鱼子、鱿鱼、黄鳝、牡蛎、蚌肉、蛋黄、蟹黄等。</div>
		<div class="part">【小心心理疾病】</div>
		<div class="paragraph">有些患者，支架术后经常觉胸闷、头晕、手发麻，胸口偶尔有一过性抽痛，心率有时会突然加快，尤其在劳累、紧张或出差时发生。这可能是并发了抑郁或焦虑状态，在医生排除心脏方面的问题后，建议去心理科就诊，最好去心内科与心理医生联合开展的“双心医学”门诊获取帮助。</div>
	</article>
	<div class="btn">
		<div class="music">
			<audio controls="controls" id="bgsound" preload="auto" >
	   		 	<source src="<%=basePath%>postoperation/music/week_4.wav" type="audio/mpeg"/>
			</audio>
		</div>
	</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_3.jsp">上一章</a>
			<a id ="next" href="<%=basePath%>postoperation/week_5.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
	<input type="hidden" id="week" value="4" />
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
