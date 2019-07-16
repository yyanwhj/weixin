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
		<div class="title">第15周</div>
		<div class="part">【正确服用口服药物】</div>
		<div class="paragraph">目前，80%以上的药物通过口服途径摄入，包括片剂、胶囊剂、颗粒剂、糖浆剂、丸剂、口服液等。正确服用口服药物的方法是：</div>
		<div class="paragraph">１、洗净双手，倒一杯温开水；</div>
		<div class="paragraph">２、先喝一口水，润润喉咙和食管；</div>
		<div class="paragraph">３、把药含入口中，再抿一口水，像平时咽东西一样把药咽下，紧接着多喝几口水；</div>
		<div class="paragraph">４、服药后不要马上躺下，最好站立或走动1分钟，以便药物完全进入胃里。</div>
		<div class="part">【雾天怎么动】</div>
		<div class="paragraph">雾天最好减少户外活动，如必须到户外运动，做好防护措施，佩戴口罩、围巾、帽子。在雾天，最好选择室内锻炼，可避免空气中有害物质对身体造成伤害。</div>
		<div class="part">【降脂食物有哪些】</div>
		<div class="paragraph">水产类：鱼、海带、紫菜、海藻、海蜇等； </div>
		<div class="paragraph">主食：玉米、红薯、燕麦、黄豆及其制品、绿豆等；</div>
		<div class="paragraph">蔬菜：大蒜、洋葱、芹菜、生姜、胡萝卜、木耳、各种蘑菇等；</div>
		<div class="paragraph">水果：山楂、苹果、蜜橘等；</div>
		<div class="part">【陪伴老年人走过哀伤路】</div>
		<div class="paragraph">老年人情感上并非都很脆弱，当老年人能开放表达自己的哀伤，他们也会逐渐走出哀伤。需要家庭成员支持：</div>
		<div class="paragraph">１、老年人哀伤时，需有人陪伴；</div>
		<div class="paragraph">２、陪伴老年人闲谈、表达、静默及回忆；</div>
		<div class="paragraph">３、让哀伤者详述每一项失落的细节，接受悲伤的事实。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_15.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_14.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_16.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="15" />
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
