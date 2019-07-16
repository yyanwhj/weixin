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
		<div class="title">第33周</div>
		<div class="part">【服用华法林期间慎用其他药物】</div>
		<div class="paragraph">华法林与多种药物之间存在相互作用，为保证抗凝效果稳定和您的安全，不要自行使用其他药物，如生病了，及时去医院看医生。</div>
		<div class="part">【支架术后如何散步】</div>
		<div class="paragraph">步速不宜过快，以免诱发心绞痛。最好饭后1小时再缓慢散步，每天2-3次。长期坚持，可促进冠状动脉侧支循环形成，有效改善心肌代谢，减轻血管硬化。</div>
		<div class="part">【蔬菜吃多少合适】</div>
		<div class="paragraph">中国营养学会建议每天蔬菜的摄入量是300-500克，这个量指的是菜没炒熟之前的生重，您每天吃到这个量了吗？</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_33.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_32.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_34.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="33" />
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
