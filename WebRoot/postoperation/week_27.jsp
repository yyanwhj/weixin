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
		<div class="title">第27周</div>
		<div class="part">【华法林怎么服？】</div>
		<div class="paragraph">如果您在服用华法林，记得要在每天的同一时间点服药。一般情况下，最好在晚上的同一时间点服用。和其他药物一样，不能随便停药。如更换其他规格或厂家的药品，可能需调整剂量，请咨询医生。</div>
		<div class="part">【如何预防运动岔气】</div>
		<div class="paragraph">１、运动前热身，让身体和肌肉、内脏器官适应较快频率的运动需要，呼吸肌逐渐适应较快频率的收缩，就不会发生痉挛。</div>
		<div class="paragraph">２、加深呼吸，运动锻炼过程中，要改善浅表呼吸的不良习惯，提倡深呼吸、腹式呼吸，这样可吸进大量空气，满足运动时机体对氧的需求，放松呼吸肌。</div>
		<div class="paragraph">３、调整呼吸节奏，让呼吸频率和运动节奏配合协调起来，机体达到整体协调。</div>
		<div class="paragraph">用鼻子呼吸，冬天户外锻炼，尽量用鼻子呼吸。如张口呼吸，要半张口，让冷空气从牙缝中挤入口腔，防止冷空气过度刺激。</div>
		<div class="part">【将压力写出来】</div>
		<div class="paragraph">术后生活中，遇到各种压力不能很好排解，也不愿意跟亲朋好友提及时，久而久之这些压力对您的健康带来一定影响。您可将这些压力按大小顺序一项一项写出来。此时您就会发现，只要各个击破，其实压力很容易缓解。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_27.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_26.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_28.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="27" />
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
