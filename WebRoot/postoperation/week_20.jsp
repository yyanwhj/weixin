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
		<div class="title">第20周</div>
		<div class="part">【阿司匹林服用期间禁饮酒】</div>
		<div class="paragraph">服用阿司匹林期间，应戒酒。酒精能加强阿司匹林的作用，可导致出血时间延长，增加胃出血发生率。</div>
		<div class="part">【如何选购运动服】</div>
		<div class="paragraph">购买运动服装，不能只顾外观漂亮，服装的材质很重要。运动中体温会升高，会出汗，很多人为了透汗喜欢选择棉质服装。棉质服装虽吸汗性好，但透气性差，不能很好散发汗液。汗湿的衣服会黏附在皮肤上，降低皮肤温度，特别在温差较大情况下，穿棉质服装易受凉、感冒。运动服装宜选择舒适透气性较好的混纺材料制作的服装。</div>
		<div class="part">【早餐该如何搭配？】</div>
		<div class="paragraph">如您的早餐中包括谷类、动物性食物（肉类、蛋）、奶及奶制品、蔬菜和水果等4类食物，就算营养充足了。其中，谷类为100g左右，可选择馒头、面包、麦片、面条、豆包、粥等；适量的含优质蛋白质食物，如牛奶、鸡蛋或大豆制品；再有l00g的新鲜蔬菜和l00g的新鲜水果。早晨起床半小时后吃早餐较适宜。</div>
		<div class="part">【冥想】</div>
		<div class="paragraph">您是否有这样的体验，大脑的思维像水流一样不停转动，不管你怎样喊停都无济于事。冥想，就像大坝一样，可截断思维的流动，让大脑沉静下来。有人说，冥想是对抗科技对我们生活不断干扰的一贴完美解毒剂。近期研究表明，一天两次约20分钟的冥想能减少血管堵塞的几率，有效降低因心力衰竭和心绞痛引起的猝死风险。</div>
	</article>
	<div class="btn">
		<div class="music">
			<audio controls="controls" id="bgsound" preload="auto" >
	   		 	<source src="<%=basePath%>postoperation/music/week_20.wav" type="audio/mpeg"/>
			</audio>
		</div>
	</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_19.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_21.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
	<input type="hidden" id="week" value="20" />
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
