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
		<div class="title">第18周</div>
		<div class="part">【即刻拨打120或999】</div>
		<div class="paragraph">您在服用阿司匹林时，若出现以下情况，请拨打120或999：</div>
		<div class="paragraph">呼吸困难</div>
		<div class="paragraph">脸、嘴唇、舌头或咽喉肿胀</div>
		<div class="paragraph">咳血、吐血或出现黑便、柏油便或便血</div>
		<div class="part">【太极拳锻炼环境】</div>
		<div class="paragraph">练习太极拳时，应选择空气流通场地，不要在灰尘过多或地面过于潮湿处。如遇风雨天气，可在家中或走廊练习。</div>
		<div class="part">【如何控盐？】</div>
		<div class="paragraph">自觉纠正口味过咸而过量添加食盐和酱油的不良习惯，每天食盐摄入采取总量控制，用量具量出，每餐按量放入菜肴。还要警惕隐型盐，一般20ml酱油中含盐3g，10g黄酱含盐1.5g。如菜肴需用酱油和酱类，应按比例减少其中的食盐用量。</div>
		<div class="part">【音乐能开郁】</div>
		<div class="paragraph">某些乐曲节奏鲜明、节板爽快，或具有螺旋式的旋律快感、优美动听，能够开畅胸怀，舒解郁闷。如《流水》、《阳关三叠》、《金水河》、《桃叶歌》、《喜洋洋》、《假日的海滩》等。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_18.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_17.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_19.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="18" />
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
