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
		<div class="title">第25周</div>
		<div class="part">【服用氯吡格雷期间禁饮酒】</div>
		<div class="paragraph">服用氯吡格雷期间，避免饮酒，饮酒可加重氯吡格雷的某些不良反应，特别是胃出血。</div>
		<div class="part">【肌肉酸痛】</div>
		<div class="paragraph">运动后肌肉酸痛，可能因为肌肉组织过劳，造成肌纤维的结缔组织损伤，也可能因为活动中肌肉组织的缺血、缺氧、能量供给不足、代谢产物堆积形成，尤其是乳酸堆积和氧自由基的存在。锻炼不可猛然间增加强度，操之过急。出现酸痛后，不能用过高温度热水洗澡。</div>
		<div class="part">【预防冠心病之红色食物】</div>
		<div class="paragraph">您可适当补充瘦猪肉、牛肉等，适量吃苹果和西瓜。每天吃1个苹果，可促进胆汁酸排泄。西瓜含大量氨基酸、葡萄糖等，每3天吃1次(1次不得多于80克)，可帮助控制血压。</div>
		<div class="part">【减压】</div>
		<div class="paragraph">如您觉得生活或工作中有压力，要寻求帮助。比如，看看家人或朋友能否帮您解决生活中的困扰；想办法找人分担你的工作，减轻压力。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_25.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_24.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_26.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="25" />
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
