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
		<div class="title">第34周</div>
		<div class="part">【硝酸甘油要舌下含服】</div>
		<div class="paragraph">心绞痛发作时，硝酸甘油舌下含服是最佳给药途径。这是因为舌头下面有许多血管，含于舌下，硝酸甘油极易溶化，溶化了的药物直接入血，不仅吸收快、起效快，而且也不会降低药效。如果吞服，硝酸甘油在吸收过程中须通过肝脏，在肝脏中绝大部分硝酸甘油被灭活，大大降低药效。</div>
		<div class="part">【运动中防损伤】</div>
		<div class="paragraph">运动中，要适当放松肌肉和韧带及关节组织，即做好间隔放松，使肢体和组织得到休息和调整。</div>
		<div class="part">【谷薯类应该吃多少】</div>
		<div class="paragraph">每天餐桌上的米饭、馒头、面条、大饼、土豆、红薯等主食都包含在谷薯类里，它们是一天热量的大部分来源，吃多少合适呢？中国营养学会建议每天吃250-400克。如您今天吃了薯类，那么谷类就要相应减少。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_34.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_33.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_35.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="34" />
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
