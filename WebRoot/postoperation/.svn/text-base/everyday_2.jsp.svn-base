<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/postoperation/css/postoperation.css">
	<script type="text/javascript" src="<%=basePath%>activity/js/jquery-1.11.1.min.js"></script>
	<style>
		.catalog a{
			display:block;
		}
	</style>
</head>
<body>
	<article>
		<div class="title">第2天</div>
		<img src="<%=basePath %>postoperation/images/2.png" alt="" style="width:100%;">
		<div class="part">【运动】</div>
		<div class="paragraph">１、您若是手腕部穿刺，可床边走动，每次5-10分钟，逐渐增加时间和次数；</div>
		<div class="paragraph">２、您若是腿部穿刺，可选择床上活动，伸展四肢，深呼吸；术后24小时之后可间断下床活动；</div>
		<div class="paragraph">３、开始下床活动时，请在家人陪同下进行，防跌倒。</div>
		<div class="part">【饮食】</div>
		<div class="paragraph">今天您可以吃主食和炒菜了，但也应以养胃通便为主。建议早上吃莲子百合山药粥；中午可吃菊花粥或面片汤，素炒时令蔬菜；晚上不妨喝点红豆薏米粥，吃点炒绿豆芽。</div>
		<div class="part">【阿司匹林+氯吡格雷】</div>
		<div class="paragraph">阿司匹林和氯吡格雷是防止支架内长血栓的药物。如果您没有禁忌证,需终生服用阿司匹林，氯吡格雷至少服用一年。</div>
		<div class="part">【不适的调理】</div>
		<div class="paragraph">１、腹胀:原因是卧床后肠蠕动减慢，食入不易消化食物或您原有胃肠疾病。</div>
		<div class="paragraph">解决方法:腹部热敷，顺时针方向轻轻按摩，必要时请教医生。</div>
		<div class="paragraph">２、腰痛:原因是平卧位时腰部悬空，或您原有腰部疾病，如腰椎间盘突出或腰椎骨质增生。</div>
		<div class="paragraph">解决方法:平卧位时腰部垫软枕，在医护人员指导下定时侧卧位，按摩腰部及受压部位。</div>
	</article>
	<div class="btn">
		<div class="music">
			<audio controls="controls" id="bgsound" preload="auto" >
	   		 	<source src="<%=basePath%>postoperation/music/day_2.wav" content-type="audio/mpeg"/>
	   		 	<source src="<%=basePath%>postoperation/music/day_2.mp3" content-type="audio/mp3"/>
				你的浏览器不支持audio标签。
			</audio>
		</div>
	</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath %>postoperation/everyday_1.jsp">上一章</a>
			<a id="next" href="<%=basePath %>postoperation/everyday_3.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
	<input type="hidden" id="pageIndex" value="2" />
</body>
<script type="text/javascript">
	$(function(){
		
		document.all.bgsound.src= '<%=basePath%>postoperation/music/day_2.wav';
		
		var maxDay = <%=request.getSession().getAttribute("maxDay")%>;
		var pageIndex = $("#pageIndex").val();
		if(maxDay <= pageIndex){
			$("#next").hide();
			$(".u-btnBox .btns a").css("width","45%");
		}
	});
</script>
</html>
