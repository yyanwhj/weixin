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
		<div class="title">第51周</div>
		<div class="part">【术后1年复查】</div>
		<div class="paragraph">支架术后1年，您该去医院复查了，复查的项目包括体重、血压、心率、生化（血脂、血糖、肝功能、肾功能）、凝血功能、心肌酶（肌酸激酶同工酶CK-MB、肌酸激酶CK）、尿常规、血常规、心电图、超声心动图、运动负荷心电图。</div>
		<div class="part">【冰箱存放药品四注意】</div>
		<div class="paragraph">１、先将药品，尤其是开封后的药品放入密封的塑料盒或瓶中，再放入冰箱，以防药品受潮；</div>
		<div class="paragraph">２、药品与冰箱壁之间至少留1～2厘米的空隙；</div>
		<div class="paragraph">３、最好在放置药品的位置放一个温度计，以监测冷藏室内的温度；</div>
		<div class="paragraph">４、发现药品与原有的性状不同，即使在有效期内，也应停止使用；如在冷藏室保存的药品发生冻结，即使化冻后外观没有发生变化，该药品也不能再使用。</div>
		<div class="part">【缓解便秘的饮食方法】</div>
		<div class="paragraph">增加膳食纤维摄入。膳食纤维多含于粗粮和一些菜果中，它本身不被吸收，却能使粪便膨胀，刺激结肠动力。应每日食用1～2顿粗粮，可选用玉米面、糙米、燕麦等；同时，多吃纤维含量高的蔬菜水果，如芹菜、韭菜、白菜、油菜、菠菜、笋类、苹果等。海藻类食品中膳食纤维含量亦较高，不妨一试。魔芋，是一种可溶性膳食纤维，热量很低，吸水性强，有良好的通便作用。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_51.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_50.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_52.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="51" />
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
