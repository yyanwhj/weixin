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
		<div class="title">第7周</div>
		<div class="part">【他汀药物伤不伤肝？】</div>
		<div class="paragraph">长期服用他汀类药物安全性好、副作用小。很多患者连续服药10年，经检查，也没有不良反应。部分患者担心服用他汀类药物会损害肝脏，其实完全没必要，只有0.5%-2.0%的极少数患者才会在服药时出现肝功能化验异常，而且这与用药剂量有关，降低剂量就可使肝脏功能化验指标恢复正常。他汀极小可能引起器质性不可逆的肝损害，他汀不是肝毒药。</div>
		<div class="part">【准备活动益处多】</div>
		<div class="paragraph">每次运动时，要有几分钟准备活动，能有效预防和避免一些运动损伤发生，如肌肉拉伤、撕裂伤。准备活动充分能增加关节的灵活性，加强肌肉协调能力，使肌肉收缩自如；还能改善血液循环，减少血管阻力，加速血液为肌肉供氧，减少运动中代谢物质的积累；同时也能避免运动出现腹痛、岔气等现象。</div>
		<div class="part">【饮食推荐食物：绿色蔬菜】</div>
		<div class="paragraph">绿色蔬菜中含有较多的胡萝卜素和维生素C，它们有抗氧化作用，能够影响心肌代谢，增加血管韧性，使血管弹性增加，大量维生素C可使胆固醇氧化为胆酸而排出体外。</div>
	</article>
	<div class="btn">
		<div class="music">
			<audio controls="controls" id="bgsound" preload="auto" >
	   		 	<source src="<%=basePath%>postoperation/music/week_7.wav" type="audio/mpeg"/>
			</audio>
		</div>
	</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_6.jsp">上一章</a>
			<a id="next" href="<%=basePath%>postoperation/week_8.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
	<input type="hidden" id="week" value="7" />
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
