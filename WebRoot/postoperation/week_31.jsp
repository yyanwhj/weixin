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
		<div class="title">第31周</div>
		<div class="part">【立即就医】</div>
		<div class="paragraph">如在服用华法林期间，出现齿龈不明原因大量出血、无诱因鼻出血不止，无外伤情况下皮下淤血、淤斑，黑便，呕血（或呕咖啡色液体）等情况时，请立即就医。</div>
		<div class="part">【热身须知】</div>
		<div class="paragraph">在运动前，需做热身活动。通常以5-15分钟为宜，保持一定心跳频率，使身体发热甚至微汗后，再投身到较大运动锻炼中。</div>
		<div class="part">【有益心脏之白色食物】</div>
		<div class="paragraph">燕麦粉、燕麦片，能有效降低甘油三酯、胆固醇。还要多喝牛奶，牛奶中含有大量蛋白质、钙、铁等多种人体需要的物质，能抑制胆固醇的含量，有助于防止冠心病进一步发展。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_31.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_30.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_32.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="31" />
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
