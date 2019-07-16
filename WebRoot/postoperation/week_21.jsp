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
		<div class="title">第21周</div>
		<div class="part">【阿司匹林服用期间应避免高嘌呤饮食】</div>
		<div class="paragraph">服用阿司匹林虽可轻度增高尿酸，但很少引起高尿酸血症，而高嘌呤饮食是高尿酸血症发生的重要诱因，在服用阿司匹林期间，应避免或减少高嘌呤饮食。高嘌呤饮食有动物内脏、沙丁鱼、凤尾鱼、带鱼、蚶、蛤、鸡汤、肉汤等。</div>
		<div class="part">【高楼大厦周围锻炼不可取】</div>
		<div class="paragraph">最好不要在高楼大厦周围锻炼。高楼林立，楼群间易形成忽强忽弱的阵风，人称高楼风，这种风最容易使人感冒受凉。楼群间也不安全，高楼坠物会威胁到您的安全。</div>
		<div class="part">【晚餐为什么要适量？】</div>
		<div class="paragraph">晚餐提供的能量应占全天所需总能量的30%～40%，晚餐谷类食物应在125g左右，可在米面食品中多选择富含膳食纤维的食物如糙米、全麦食物。这类食物既能增加饱腹感，又能促进肠胃蠕动。相反，经常在晚餐进食大量高脂肪、高蛋白质食物，会增加患冠心病、高血压等疾病的危险性。</div>
		<div class="part">【深呼吸】</div>
		<div class="paragraph">在所有的放松方式中，深呼吸最常用，您可随时随地想用就用。腹式深呼吸能使大脑保持冷静，经常规律练习，显著减少焦虑。生活中您感到愤怒、挫折及不耐烦，甚至疲劳或者情绪失控时，可用深呼吸让自己冷静下来，从而摆脱自己情绪的影响，打破情绪、思维及行动恶性循环的怪圈。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_21.wav" type="audio/mpeg"/>
				</audio>
			</div>
		</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_20.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_22.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="21" />
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
