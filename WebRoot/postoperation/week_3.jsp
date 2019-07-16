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
		<div class="title">第3周</div>
		<div class="part">【别把药物掰碎服】</div>
		<div class="paragraph">自作主张地把药掰碎或用水溶解后再服用，这样不仅影响疗效还会加大药物的不良反应。以阿司匹林肠溶片为例，掰碎后没有肠溶衣的保护药物无法安全抵达肠道，在胃中就被溶解，不仅无法发挥疗效，还刺激了胃黏膜。将药物用水溶解后再服用也有同样的不良影响。有些缓释剂型药物是可掰开服的，如缓释倍他乐克、依姆多等，药物说明书上会标明。</div>
		<div class="part">【运动前准备不可少】</div>
		<div class="paragraph">每次运动前，充分活动各个关节、肌肉，使各个关节最大限度得到充分活动，增加关节的柔韧程度和灵活度。只有经充分准备活动才能使肌肉和关节达到最佳状态投入运动，减少运动伤害。一般运动前需准备5-10分钟，天气越冷，热身的时间要越长。</div>
		<div class="part">【食物烹调方法】</div>
		<div class="paragraph">食物烹调选用植物性油，多采用水煮、清蒸、凉拌、卤、炖等方式烹调。烹调蔬菜的正确方法是：</div>
		<div class="paragraph">先洗后切：正确的方法是流水冲洗，先洗后切，不要将蔬菜在水中浸泡时间过久，否则会使蔬菜中的水溶性维生素和无机盐流失过多。</div>
		<div class="paragraph">急火快炒：绿叶蔬菜急火快炒，可减少维生素的损失。</div>
		<div class="part">【避免不良情绪】</div>
		<div class="paragraph">术后的各种不良情绪，如害怕、紧张、担忧、疑虑等，会导致内分泌功能紊乱，血压上升，心跳加速，加重病情。如您心理负担较重，持续无法缓解，应去医院接受心理咨询。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_3.wav" type="audio/mpeg"/>
				</audio>
			</div>
		</div>
		<div class="u-btnBox">
				<div class="btns">
					<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
					<a href="<%=basePath%>postoperation/week_2.jsp">上一章</a>
					<a id ="next" href="<%=basePath%>postoperation/week_4.jsp">下一章</a>
				</div>
				<%@include file="../common/postoperation_download_user.jsp" %>
			</div>
		<input type="hidden" id="week" value="3" />
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
