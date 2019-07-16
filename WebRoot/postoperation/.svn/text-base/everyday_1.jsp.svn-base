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
	<link rel="stylesheet" type="text/css" href="<%=basePath %>postoperation/css/postoperation.css">
	<script type="text/javascript" src="<%=basePath%>activity/js/jquery-1.11.1.min.js"></script>
	<style>
		.catalog a{
			display:block;
		}
		
	</style>
</head>
<body>
	<article>
		<div class="title">第1天</div>
		<img src="<%=basePath %>postoperation/images/1.png" alt="" style="width:100%;">
		<div class="part">【运动】</div>

		<div class="paragraph">１、您若是手腕部穿刺，可在室内走动，穿刺一侧的部位尽量减少活动；</div>
		<div class="paragraph">２、您若是腿部穿刺，如使用动脉压迫止血器，卧床6小时后可间断下床活动，卧床时该侧腿伸直，需家属辅助间断按摩该侧下肢，避免静脉血栓形成；</div>
		<div class="part">【清淡饮食】</div>
		<div class="paragraph">１、术后您返回病房后可进食清淡、易消化的流食，如米汤等。</div>
		<div class="paragraph">２、不要强迫进食油腻、不易消化的食物，注意禁食牛奶，豆制品及产气的饮料，防止出现腹胀，以免增加腹压，对创口恢复不利。</div>
		<div class="paragraph">３、术中使用的造影剂可能增加肾脏负担，应尽快排出体外。术后建议您适当饮水、绿豆汤、西瓜汁、番茄汁、冬瓜汤等。</div>
		<div class="part">【预防出血】</div>
		<div class="paragraph">由于在术中及术后进行抗栓抗凝治疗，易发生出血，您需做好自我预防和观察，如有无穿刺部位出血刺激（穿刺局部周围皮肤如有肿胀可以冷敷，忌用热敷），有无牙龈出血、便血、尿血、皮下出血点及有无视物模糊、头痛等，若出现这些情况，及时告知医生。</div>
		<div class="part">【长期用药：按时、按量、遵医嘱】</div>
		<div class="paragraph">支架只能解决病变部位的血管问题，对未放支架的血管没有治疗作用。支架术后，您还需长期服药，一是防止支架内长血栓，二是防止没放支架的血管动脉粥硬化继续恶化。不管您在服用哪种药物，一定要按时、按量、遵医嘱服药。千万不要自以为是或听信非正规医生的劝诱而自行停药，抑或改吃保健药物。</div>
		<div class="part">【放宽心】</div>
		<div class="paragraph">支架被成功植入您的体内，它不会脱落，即使参加活动、或行心外按压、电击除颤也不会导致其脱落。请放宽心态，转移注意力，更有益于您康复。</div>
	</article>
	<div class="btn">
		<div class="music">
			<audio controls="controls" id="bgsound" preload="auto" >
				<source src="<%=basePath%>postoperation/music/day_1.wav" type="audio/mpeg" />
			</audio>
		</div>
	</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath %>postoperation/everyday_0.jsp">上一章</a>
			<a id="next" href="<%=basePath %>postoperation/everyday_2.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
	<input type="hidden" id="pageIndex" value="1" />
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
