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
		<div class="title">第8周</div>
		<div class="part">【喘息现象】</div>
		<div class="parpgrahp">运动锻炼中，有一定的气短感是正常的。但如在运动中出现说话费力、严重喘息、浑身无力、头重脚轻的症状，要特别小心，可能出现了呼吸困难。</div>
		<div class="part">【饮食推荐食物：水果】</div>
		<div class="parpgrahp">水果不仅纤维充足，而且维生素及微量元素含量也很丰富。水果中的纤维降低冠心病死亡风险效果较明显。山楂、柑橘、石榴、葡萄、苹果等水果对血瘀、防治动脉粥样硬化等都有效果。</div>
	</article>
	<div class="btn">
		<div class="music">
			<audio controls="controls" id="bgsound" preload="auto" >
	   		 	<source src="<%=basePath%>postoperation/music/week_8.wav" type="audio/mpeg"/>
			</audio>
		</div>
	</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_7.jsp">上一章</a>
			<a id="next" href="<%=basePath%>postoperation/week_9.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
	<input type="hidden" id="week" value="8" />
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
