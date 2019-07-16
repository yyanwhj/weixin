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
		<div class="title">第29周</div>
		<div class="part">【华法林服用期间旅游须知】</div>
		<div class="paragraph">服用华法林期间，虽可旅游，但须做好以下几点：</div>
		<div class="paragraph">带上充足的药物；</div>
		<div class="paragraph">尽量每天同一时间服药；</div>
		<div class="paragraph">保持稳定的饮食；</div>
		<div class="paragraph">旅游前后，及时检查凝血酶原时间（PT）和国际标准化比值（INR）；</div>
		<div class="paragraph">避免长时间坐车。</div>
		<div class="part">【运动前不能吃大餐】</div>
		<div class="paragraph">运动前不能吃大餐，吃过饱或参加盛宴后，不能做剧烈运动，否则会因胃酸反流引起灼烧感，引发恶心、呕吐。此外，运动前不宜吃刺激性强的食物，如辛辣食物、咖啡、薄荷等。</div>
		<div class="part">【有益心脏之黄色食物】</div>
		<div class="paragraph">可适当吃些黄色食物，如胡萝卜、甘薯、浅色西红柿。这几类食物富含胡萝卜素，有助于减轻动脉硬化。用胡萝卜制作各式菜肴，都具有降压、强心、降血糖等作用。还要多吃黄豆、豆腐等豆类制品。</div>
		<div class="part">【海藻能缓解焦虑】</div>
		<div class="paragraph">您术后生活中，出现紧张、焦虑的情绪时，不妨在饮食上多摄入一些海藻类食物。这类食物营养丰富，含镁量高。一般情况下镁缺乏可能引起焦虑。您在饮食中可加入海藻类食物。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_29.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_28.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_30.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="29" />
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
