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
		<div class="title">第17周</div>
		<div class="part">【立即就医】</div>
		<div class="paragraph">服用阿司匹林时，若出现以下出血异常，请立即就医：</div>
		<div class="paragraph">皮肤出现血斑</div>
		<div class="paragraph">鼻血不止</div>
		<div class="paragraph">刷牙时牙龈出血</div>
		<div class="part">【太极拳锻炼时间】</div>
		<div class="paragraph">锻炼时间以早晚为宜，每天练两遍，利用工作之余、工间操时间也可，每天早晚练习不要间断。练习整套拳的时间，20至25分钟为宜，不要过快或过慢。每次至少练半套拳，坚持下去养成早晚练习习惯，长久锻炼既健身强体又能减缓疲劳。</div>
		<div class="part">【控制体重】</div>
		<div class="paragraph">每日三餐定时定量，避免暴饮暴食。肥胖者应减轻体重，将体重指数（BMI）控制在24以下。（BMI=体重Kg÷身高m2，正常范围18.5-23.9Kg/m2）</div>
		<div class="part">【音乐能安神】</div>
		<div class="paragraph">某些乐章或歌曲，旋律缓慢悠扬、柔绵婉转、低吟抒怀、清幽和谐，有安神宁心，消除紧张、焦躁情绪和镇静催眠的功效。如《幽兰》（又名《碣石调幽兰》）、《梅花三弄》、《空山鸟语》以及古筝独奏曲《春江花月夜》、《平沙落雁》等。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_17.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_16.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_18.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="17" />
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
