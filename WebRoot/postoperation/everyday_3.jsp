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
		<div class="title">第3天</div>
		<img src="<%=basePath %>postoperation/images/3.png" alt="" style="width:100%;">
		<div class="part">【运动】</div>
		<div class="paragraph">１、您若是手腕部穿刺，可选择散步，行走的速度和步伐以感觉舒适为标准，每次5-10分钟，每天二次。</div>
		<div class="paragraph">２、您若是腿部穿刺，下床活动前，请缓慢坐起，在床边休息几分钟，方可离床。沿床边走动，每次5-10分钟。</div>
		<div class="part">【少吃盐】</div>
		<div class="paragraph">食盐摄入过多，会使水钠潴留，加重心脏负担。平时食盐摄入应控制在5克以下，家里可准备一个2克的盐勺，不但应控制食盐、酱油、味精等各种含钠调味料的摄入量，还要尽可能少吃咸菜、咸蛋、皮蛋、火腿等含钠高的腌制品。</div>
		<div class="part">【早上服，晚上服】</div>
		<div class="paragraph">阿司匹林：早晚服用都可，关键是坚持长期服用，不漏服。</div>
		<div class="paragraph">氯吡格雷：早上服用，餐前餐后服用都行。</div>
		<div class="paragraph">他汀药物：晚上睡前服用（一般为晚上8点左右）。</div>
		<div class="part">【伤口护理】</div>
		<div class="paragraph">日常保持伤口干燥清洁。</div>
		<div class="paragraph">不要在伤口上涂抹保湿霜、乳液，如有局部肿胀，可以涂抹药膏，避开穿刺口位置。</div>
		<div class="paragraph">术后一周内，穿刺部位避免剧烈活动，不要游泳。</div>
		<div class="part">【难得糊涂】</div>
		<div class="paragraph">情绪、精神状态和冠心病有千丝万缕的联系。很多人一生气，和别人吵架，就激发心绞痛甚至心肌梗死。因此，保持良好心态，对支架术后患者，尤为重要。冠心病患者，尤其是心肌梗死患者，经历了生死边缘徘徊，还有什么放不下的呢。出院回家，凡事看开些，有说有笑，难得糊涂。</div>
	</article>
	<div class="btn">
		<div class="music">
			<audio controls="controls" id="bgsound" preload="auto" >
	   		 	<source src="<%=basePath%>postoperation/music/day_3.wav" type="audio/mpeg"/>
			</audio>
		</div>
	</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath %>postoperation/everyday_2.jsp">上一章</a>
			<a id="next" href="<%=basePath %>postoperation/everyday_4.jsp">下一章</a>
			</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
	
<input type="hidden" id="pageIndex" value="3" />
</body>
<script type="text/javascript">
	$(function(){
		var maxDay = <%=request.getSession().getAttribute("maxDay")%>;
		var pageIndex = $("#pageIndex").val();
		if(maxDay <= pageIndex){
			$("#next").hide();
			$(".u-btnBox .btns a").css("width","45%");
		}
	});
</script>
</html>
