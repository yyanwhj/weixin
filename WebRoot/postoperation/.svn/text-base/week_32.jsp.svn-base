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
		<div class="title">第32周</div>
		<div class="part">【服用华法林者需保持饮食结构平衡】</div>
		<div class="paragraph">大量进食富含维生素K的食物能降低华法林的抗凝效果，大多数患者可正常饮食。另外，开始服用任何保健品或中药之前，请咨询医生，某些中药和保健品中可能含有维生素K。</div>
		<div class="part">【中老年人该如何动】</div>
		<div class="paragraph">对中老年人最安全、最有效的就是有氧运动，如慢步行走、打太极拳，骑自行车等。但每次不要超过40分钟，这样能避免由于时间过长，对身体造成的伤害。想运动时间长点儿的人，可采用分段运动，如下午和晚上各散步30分钟，同样能达到健身效果。</div>
		<div class="part">【富含维生素K的食物】</div>
		<div class="paragraph">富含维生素K的食物有：</div>
		<div class="paragraph">蔬菜：菠菜、油菜、紫花苜蓿、生菜、包心菜、海藻类、西兰花、青椒、生姜、花菜、胡萝卜、西红柿等；</div>
		<div class="paragraph">水果：梨、苹果、桃、桔子等。</div>
		<div class="paragraph">其他：酸奶酪、猪肝、蛋黄、豆类、鱼肝油等；</div>
		<div class="part"></div>
		<div class="paragraph"></div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_32.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_31.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_33.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="32" />
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
