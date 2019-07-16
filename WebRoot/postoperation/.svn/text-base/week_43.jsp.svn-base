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
		<div class="title">第43周</div>
		<div class="part">【口含片怎么服？】</div>
		<div class="paragraph">口含片是指在口腔或颊黏膜内缓缓溶解而不吞下的片剂。多用于口腔和咽喉部疾患。服用时应含在口腔或颊黏膜内，使其缓缓溶解，而不是吞咽下。紧急时可嚼碎，但不要随唾液咽下，更不可整片吞下。</div>
		<div class="part">【忌头部过分变换】</div>
		<div class="paragraph">锻炼时，切忌低头、弯腰、仰头后侧、左右侧弯，更不要做头向下的倒置动作，这些动作会使血液流向头部。由于血管壁变硬，弹性差，易发生血管破裂，引起脑溢血。而当您恢复正常体位，血液快速流向躯干和下肢，脑部发生缺血，易出现两眼发黑，站立不稳，甚至摔倒。锻炼时头部不宜过分变换。</div>
		<div class="part">【乳糖不耐受】</div>
		<div class="paragraph">乳糖不耐受是指有些人喝牛奶后出现腹胀、腹痛、腹泻、排气增多等不适症状。这主要是由于他们消化道内缺乏乳糖酶，不能将牛奶中的乳糖完全分解被小肠吸收，残留过多的乳糖进入结肠又不能在结肠发酵利用。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_43.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_42.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_44.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="43" />
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
