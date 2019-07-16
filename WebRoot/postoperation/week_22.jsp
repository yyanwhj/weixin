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
		<div class="title">第22周</div>
		<div class="part">【阿司匹林服用期间应戒烟】</div>
		<div class="paragraph">吸烟会降低阿司匹林的疗效，您在服用阿司匹林期间，应避免吸烟。另外，吸烟也是冠心病的危险因素之一，美国心脏协会及《冠心病康复/二级预防中国专家共识》都明确要求，支架术后患者应戒烟。</div>
		<div class="part">【空气污染区域锻炼的危害】</div>
		<div class="paragraph">您锻炼时应远离工业区化学气味较浓的场所，烟囱附近，餐馆附近，有害气体和浮尘污染严重的地区以及交通要道及岔路口附近。这些区域的空气中含有大量微尘，混杂很多有害物质，吸入肺部易诱发哮喘等呼吸系统疾病。在这些区域锻炼不仅对身体无益，反而会影响健康。</div>
		<div class="part">【不良烹调方式】</div>
		<div class="paragraph">煎、炸、烤等烹调方法使食物接触的温度达到摄氏几百度以上，不仅会破坏较多的维生素，而且容易引起蛋白质和脂肪高温变性，可能生成苯并芘、杂环胺等致癌物质。例如，当烹调温度从200℃升至300℃时，食物中杂环胺的生成量可增加5倍，烹调食物时应尽量避免将鱼、肉等食物煎糊或烤焦。</div>
		<div class="part">【感恩】</div>
		<div class="paragraph">生活中我们被太多的“不顺利”掩盖，以至于忘记了别人对我们的帮助，感恩练习就是提醒我们，生活中还有很多美好的事情值得感激。可睡前进行感恩练习，让心中充满感激和温暖，带着良好的情绪入睡，提高幸福感。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_22.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_21.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_23.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="22" />
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
