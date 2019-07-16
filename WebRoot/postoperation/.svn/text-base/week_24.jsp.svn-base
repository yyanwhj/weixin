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
		<div class="title">第24周</div>
		<div class="part">【立即就医】</div>
		<div class="paragraph">您在服用氯吡格雷期间，应注意观察出血反应。如果发现紫癜、淤血、血尿、鼻出血、眼出血、胃肠道出血等，应暂停用药并立即就医。</div>
		<div class="part">【运动性高血压】</div>
		<div class="paragraph">运动性高血压，是在一定运动负荷下，在运动过程中或刚刚结束时，血压值超出正常人的反应性增高生理范围的一种现象。运动导致血压异常升高，是比较常见的现象。肥胖者的运动性高血压发生率通常较高。如出现运动性高血压，请咨询医生。</div>
		<div class="part">【优质蛋白哪里来】</div>
		<div class="paragraph">您在日常生活中要注意优质蛋白质的摄入，中国营养学会推荐蛋白质的摄入量为每日每公斤体重不少于lg，您可从瘦肉、鱼类、鸡蛋、牛奶和豆类食品中获取。</div>
		<div class="part">【保持充足睡眠】</div>
		<div class="paragraph">睡眠对身体和精神状态的重要性不言而喻，好的睡眠是第二天良好精神状态的保障。我们往往特别忙，没有留足够时间睡眠。您应时刻提醒自己要把睡眠定为优先项，挤出足够睡眠时间。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_24.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_23.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_25.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="24" />
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
