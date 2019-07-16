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
		<div class="title">第23周</div>
		<div class="part">【氯吡格雷漏服了怎么办？】</div>
		<div class="paragraph">氯吡格雷，最好是按时按量遵医嘱服用。若偶尔一次漏服了，可在记起时立即补用；但如果此时已接近下一次用药时间，不要再补服。您重新按照平常的规律用药即可，千万不要一次使用双倍剂量。</div>
		<div class="part">【电磁波干扰严重区域不能锻炼】</div>
		<div class="paragraph">如果您在电磁波干扰严重区域，如高压线、变电站、广播电视发射塔、卫星通信或导航系统及基站附近进行锻炼，您的身体将会不同程度遭受较强电磁波辐射，并形成无形的干扰，对您的健康影响很大。比如电磁波会使人的免疫机能下降、人体中钙质减少、引起视觉障碍等。为了您的健康，远离这些区域进行锻炼。</div>
		<div class="part">【抗癌明星】</div>
		<div class="paragraph">十字花科植物含有的异硫氰酸盐，可抑制由多种致癌物诱发的癌症。流行病学调查也发现，经常食用十字花科植物的居民，胃癌、食管癌及肺癌的发病率低。常见的十字花科蔬菜有萝卜、西兰花、芥蓝、卷心菜、甘蓝、菜花。可在预防心血管疾病和癌症等慢性病中发挥有益作用。</div>
		<div class="part">【赠人玫瑰，手有余香】</div>
		<div class="paragraph">帮助别人并不是在浪费时间，而是在做一件对自己有意义的事情。有意义的事情可很简单，比如回答别人的问路，回答朋友们的咨询，给乞讨的人一块钱，这些都是有意义的事。帮助别人可带来长久快乐，这种快乐会超越娱乐带给的快乐。当然，我们并不是要有求必应，该拒绝别人的时候，也要毫不犹豫拒绝。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_23.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_22.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_24.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="23" />
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
