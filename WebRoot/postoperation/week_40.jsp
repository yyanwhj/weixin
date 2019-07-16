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
		<div class="title">第40周</div>
		<div class="part">【9个月复查】</div>
		<div class="paragraph">支架术后9个月了，您该去医院复查了，复查的项目包括体重、血压、心率、生化（血脂、血糖、肝功能、肾功能）、凝血功能、心肌酶（肌酸激酶同工酶CK-MB、肌酸激酶CK）、尿常规、血常规、心电图、超声心动图。</div>
		<div class="part">【胶囊不要打开吃】</div>
		<div class="paragraph">一些患者喜欢将胶囊打开口服，认为这样起效快，或能避免胶囊壳对胃肠的损伤。这种服药方法是错误的，甚至有害。有的胶囊具有肠溶性质，能使药物免遭胃酸的破坏，保证药物在肠道顺利吸收而发挥治疗作用。如把胶囊打开服用，会导致药物被胃酸破坏而失效；有的胶囊是为了掩盖药物的特殊气味或苦味，增加患者服药的舒适度。因此，如没有特殊注明，胶囊不能打开服用。</div>
		<div class="part">【如何确定运动是否合适】</div>
		<div class="paragraph">进行锻炼健身活动时，要调节好速度，姿势、动作也要正确，如果有吃力感，就要缩短活动时间或停下来深呼吸，等到呼吸均匀后再继续。根据自己的感觉是轻松还是吃力来调节运动强度，以第二天自己不感觉疲劳为宜。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_40.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_39.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_41.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="40" />
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
