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
		<div class="title">第19周</div>
		<div class="part">【阿司匹林偶尔漏服不要紧】</div>
		<div class="paragraph">阿司匹林，最好是按时按量遵医嘱服用。但若偶尔漏服一次，不必惊慌失措，第二天按原剂量继续服用即可。需提醒，千万不要在第二天加倍服用，因为擅自超量服用药物，可能产生副作用，如胃肠道不适、消化道出血、颅内出血、尿血等现象。服药期间，建议家属也能督促您服药，帮您详细做好服药记录，尽量减少漏服。</div>
		<div class="part">【练太极拳该注意什么】</div>
		<div class="paragraph">若选择太极拳作为锻炼项目，您需注意以下方面：太极拳锻炼前不可过饱，不能饮酒；运动时衣着宽松，以民族传统风格的音乐伴奏，能使运动更加舒适、传神；运动后不能脱衣、饮水，也不能停下来不动，而要慢步走一走，不能就地坐下或挥扇纳凉。</div>
		<div class="part">【如何分配三餐？】</div>
		<div class="paragraph">一日三餐应将食物合理分配，通常以能量作为分配一日三餐进食量标准。一般情况下，早餐提供的能量应占全天总能量的25%～30%，午餐占30%～40%、晚餐占30%～40%为宜。按食量分配，早、中、晚三餐的比例为3∶4∶3。</div>
		<div class="part">【音乐能康复身心】</div>
		<div class="paragraph">某些乐曲，旋律悠扬、节奏多变，给人以轻松、欣快、喜乐之感，从而消除诸如焦虑、紧张、愁烦、苦闷、恐惧、忧伤、消沉、绝望、忧思、郁怒等病态情绪，起到康复身心的作用。乐曲如《百鸟朝凤》、《莺吟》，笛子独奏《百鸟行》、《荫中鸟》、《鸟投林》、《鹧鸪飞》，笙独奏《孔雀开屏》、《柳底莺》、《穿帘燕》，古筝独奏《平沙落雁》，打击乐合奏《八哥洗澡》等。这些皆是反映自然界禽鸟的传统音乐，可使人沉浸于自然美景，将一切消沉懊恼、悲观失望置之度外。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_19.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_18.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_20.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="19" />
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
