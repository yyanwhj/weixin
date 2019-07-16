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
		<div class="title">第10周</div>
		<div class="part">【硝酸甘油足量服】</div>
		<div class="paragraph">心绞痛发作时含服1片，如心绞痛5分钟未能缓解，应再含1片。一般来说，10分钟内服用2片还不见效或很快复发，要考虑是心肌梗死先兆，应毫不犹豫去医院急救。</div>
		<div class="part">【胸痛要停止运动】</div>
		<div class="paragraph">坚持每天散步，并且把每天的散步距离逐渐增加，只要能耐受，可慢慢地上楼梯。运动和锻炼中，如出现胸疼，应立即停止；出现气短、气喘和疲劳，也应立刻停止运动。如这些症状消失，可以较慢的速度继续活动，逐日增加。</div>
		<div class="part">【每天摄入30克坚果】</div>
		<div class="paragraph">坚果蕴含多种对健康有益的维生素E、B族和矿物质，维生素E是知名的抗氧化物，能预防细胞老化，减少心脏病患病风险。 每天吃多少合适呢？30克左右，相当于一小把杏仁，2-3个核桃，坚果不宜吃过多，吃多了，热量大。</div>
	</article>
	<div class="btn">
		<div class="music">
			<audio controls="controls" id="bgsound" preload="auto" >
	   		 	<source src="<%=basePath%>postoperation/music/week_10.wav" type="audio/mpeg"/>
			</audio>
		</div>
	</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_9.jsp">上一章</a>
			<a id = "next" href="<%=basePath%>postoperation/week_11.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
	<input type="hidden" id="week" value="10" />
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
