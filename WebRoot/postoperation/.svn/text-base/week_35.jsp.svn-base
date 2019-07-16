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
		<div class="title">第35周</div>
		<div class="part">【服用硝酸甘油后眩晕怎么办？】</div>
		<div class="paragraph">个别患者在服用硝酸甘油后，可能出现眩晕、摇晃等低血压症状。这并非中毒，您不必担心，只要平卧几分钟就可恢复正常。</div>
		<div class="part">【运动后放松不可少】</div>
		<div class="paragraph">锻炼后要注意放松活动，逐渐放慢节奏，伸展肢体和肌肉群，使体温、心率、呼吸、肌肉的应激反应恢复到锻炼前正常水平，能防止延迟性肌肉疼痛，解除精神压力。另外，注重锻炼环境安全，器械、器具、场地、设备在锻炼前都要严格检查，女性的装饰品暂不宜佩戴。</div>
		<div class="part">【水果该吃多少】</div>
		<div class="paragraph">水果一般作为加餐食用，也就是在两次正餐中间，如上午10点或下午3点，这可避免一次性摄入过多的碳水化合物而使胰腺负担过重。那吃多少合适呢？中国营养学会建议每天吃200-400克，如合并有糖尿病，血糖稳定时再吃水果。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_35.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_34.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_36.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="35" />
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
