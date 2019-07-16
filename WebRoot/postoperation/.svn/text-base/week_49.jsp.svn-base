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
		<div class="title">第49周</div>
		<div class="part">【药品的遮光保存】</div>
		<div class="paragraph">有些药品在光照下会降低有效成分的含量而失效；有些药品光照后会发生理化性质的变化，甚至产生有毒物质，危害健康。遮光保存是指要用不透光的容器盛装药品，例如棕色容器或黑纸包裹的无色透明、半透明容器。对于药品说明书中要求遮光保存的药品，应尽量将其在原包装盒内保存；如原包装已损坏或分装的散片，可把它们放在不透明的无毒无味的瓶子或盒子中贮藏。</div>
		<div class="part">【吃蔬菜就不用吃水果了吗？】</div>
		<div class="paragraph">蔬菜品种远远多于水果，而且多数蔬菜（特别是深色蔬菜）的维生素、矿物质、膳食纤维和植物化学物质的含量高于水果，水果不能代替蔬菜。膳食中，水果可补充蔬菜摄入不足。水果中的碳水化合物、有机酸和芳香物质比新鲜蔬菜多，且水果食用前不用加热，其营养成分不受烹调因素影响，蔬菜也不能代替水果。</div>
		<div class="part">【体感不适别运动】</div>
		<div class="paragraph">如您身体状况不好或没有休息好，或运动中出现不适甚至心绞痛症状，应适当减少运动量，不要强行运动。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_49.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_48.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_50.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="49" />
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
