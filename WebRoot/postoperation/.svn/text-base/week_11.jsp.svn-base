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
		<div class="title">第11周</div>
		<div class="part">【硝酸甘油坐着服】</div>
		<div class="paragraph">心绞痛发作时，不要直立含服硝酸甘油，应坐靠在宽大的椅子或凳子上，以免突然血压降低诱发晕厥而摔倒。</div>
		<div class="part">【着装要轻便】</div>
		<div class="paragraph">运动时穿轻便、舒适的运动鞋和运动服，避免关节因运动受限引起机体损伤。运动中，如摔倒，立即屈肘低头，团身滚动，不可直臂或肘部撑地。</div>
		<div class="part">【多吃烟酸类食物】</div>
		<div class="paragraph">烟酸，又名尼克酸，有扩张末梢血管、防止血栓形成、降低血三酰甘油的作用。富含烟酸的食物有动物肝脏、全麦制品、糙米、芝麻、花生、绿豆、紫菜、香菇等。牛奶和鸡蛋含有丰富的色氨酸，在体内也可转化为烟酸。每天男性的推荐摄入量为14毫克，女性为13毫克。</div>
	</article>
	<div class="btn">
		<div class="music">
			<audio controls="controls" id="bgsound" preload="auto" >
	   		 	<source src="<%=basePath%>postoperation/music/week_11.wav" type="audio/mpeg"/>
			</audio>
		</div>
	</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_10.jsp">上一章</a>
			<a id ="next" href="<%=basePath%>postoperation/week_12.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
	<input type="hidden" id="week" value="11" />
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
