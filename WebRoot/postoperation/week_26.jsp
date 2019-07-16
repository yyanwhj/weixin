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
		<div class="title">第26周</div>
		<div class="part">【6个月复查】</div>
		<div class="paragraph">支架术后半年，您该去医院复查了。复查的项目有体重、血压、心率、生化（血脂、血糖、肝功能、肾功能）、凝血功能、心肌酶（肌酸激酶同工酶CK-MB、肌酸激酶CK）、尿常规、血常规、心电图、超声心动图。</div>
		<div class="part">【服用氯吡格雷可能会嗜睡】</div>
		<div class="paragraph">氯吡格雷可能引起嗜睡，服用氯吡格雷期间，最好不要从事需高度集中精力的工作，如驾驶或操作机械等。</div>
		<div class="part">【运动岔气】</div>
		<div class="paragraph">“岔气”，是运动锻炼中常见的运动性损伤之一，如果运动前没有认真做好准备活动。运动的过程中，由于心肺的惰性较大，不能很快适应急剧的肌肉工作，而造成局部疼痛。尤其是天气较冷时，更易引起岔气。</div>
		<div class="part">预防冠心病之黄色食物</div>
		<div class="paragraph">可适当吃些黄色食物，如胡萝卜、甘薯、浅色西红柿。这几类食物富含胡萝卜素，有助于减轻动脉硬化。用胡萝卜制作各式菜肴，都具有降压、强心、降血糖等作用。还要多吃黄豆、豆腐等豆类制品。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_26.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_25.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_27.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="26" />
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
