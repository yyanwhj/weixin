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
		<div class="title">第14周</div>
		<div class="part">【硝酸甘油失效了吗？】</div>
		<div class="paragraph">含服硝酸甘油片时，口腔有烧灼麻刺感。这是该药的正常反应，说明药物有效。如果含服时口腔无刺感，说明药已失效，应更换新药片。</div>
		<div class="part">【叶酸有益心脏健康】</div>
		<div class="paragraph">叶酸有预防血管内皮细胞损伤，减少粥样硬化斑块形成的作用。富含叶酸的食物有动物肝脏、豆类、坚果、酵母发酵食物及绿叶蔬菜和水果等。每天的推荐摄入量为60微克。</div>
		<div class="part">【雾天户外运动的危害】</div>
		<div class="paragraph">如长期在雾天进行户外活动，对人体的健康有较大危害，容易引发或加重某些疾病。如：上呼吸道感染、哮喘、心脑血管等疾病，而且还会引起心理抑郁的症状。如运动时呼吸加快，对身体的影响就更大。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_14.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_13.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_15.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="14" />
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
