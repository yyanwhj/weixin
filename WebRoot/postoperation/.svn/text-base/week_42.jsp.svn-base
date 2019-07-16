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
		<div class="title">第42周</div>
		<div class="part">【咀嚼片怎么服？】</div>
		<div class="paragraph">咀嚼片是指应在口中嚼碎后咽下的片剂。目的是加速药物溶出，提高药效。正确服用方法是在口中嚼碎后咽下。</div>
		<div class="part">【忌负重憋气】</div>
		<div class="paragraph">憋气会加重心脏负担，引起胸闷，心悸；同时憋气时因胸腔的压力增高，易发生头晕目眩，甚至昏厥。因此像举重、拔河、引体向上等这些需憋气的运动项目，支架术后的您不宜参加。</div>
		<div class="part">【每日喝多少奶合适？】</div>
		<div class="paragraph">建议您每天饮奶300g，也可食用其他相当量的奶制品，可获得约300mg钙，加上其他食物中的钙，基本能满足人体钙的需要。同时奶及奶制品还可提供蛋白质、其他矿物质和维生素等营养物质，维持机体良好的健康状态。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_42.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_41.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_43.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="42" />
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
