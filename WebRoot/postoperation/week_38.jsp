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
		<div class="title">第38周</div>
		<div class="part">【新药不一定比老药好】</div>
		<div class="paragraph">首先，您要知道新药、老药只是按药品上市的早晚而言，并没有好次之分。其次，新药虽有优点，也有不可避免的先天缺陷。新药因上市时间短，应用的病例有限，其可能产生的副作用往往还没有被发现，需要一个在使用中认识的过程。另外，在疗效方面，也并不是所有的新药都优于老药。有了病选什么药治疗应由医生根据病情来决定，不要盲目崇拜和使用新药。</div>
		<div class="part">【如何设定运动目标】</div>
		<div class="paragraph">如您平常活动很少，开始锻炼时，设定一个较低水平的目标，如每天15分钟～20分钟；可选择感觉轻松或有点用力的强度，以及您习惯的内容，如步行。您要先给自己足够的时间适应活动量的变化，再逐渐增加活动强度和时间。</div>
		<div class="part">【常吃黑木耳】</div>
		<div class="paragraph">黑木耳中含有丰富的纤维素和植物胶质，能促进胃肠蠕动；黑木耳中还含有一种叫做类核酸的物质，可降低血中胆固醇和甘油三酯水平；黑木耳中的多糖，还具有一定的抗癌作用。木耳还有润肠通便的功效，木耳中的膳食纤维、黏性蛋白对降低血脂起到一定作用。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_38.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_37.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_39.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="38" />
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
