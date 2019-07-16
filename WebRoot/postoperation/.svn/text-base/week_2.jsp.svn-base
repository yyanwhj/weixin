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
		<div class="title">第2周</div>
		<div class="part">【饭前服，饭后服】</div>
		<div class="paragraph">饭前服：指此药需餐前1小时或餐后2小时服用以利吸收。</div>
		<div class="paragraph">饭后服，指餐后半小时服药，利用食物减少药物对胃肠的刺激或促进胃肠对药物的吸收。</div>
		<div class="part">【伤口护理】</div>
		<div class="paragraph">穿刺肢体3个月内避免提30斤以上重物。</div>
		<div class="part">【早期运动选步行】</div>
		<div class="paragraph">支架术后患者，早期以缓慢步行或缓慢上下肢活动或转动肢体为主，每次不超过5～10分钟，每天3～4次，以后可慢慢加大运动量。</div>
		<div class="part">【每天吃多少油】</div>
		<div class="paragraph">除了要控制脂肪含量高的食物外，还要控制烹调油用量，建议每天控制在20克左右。烹调油宜选用植物油，如大豆油、菜籽油等。</div>
		<div class="part">【保持情绪稳定】</div>
		<div class="paragraph">支架术后患者均有不同程度的心理压力，会加快动脉粥样硬化病变进展，增加心脏突发事件发生。术后生活要规律，避免过度紧张和情绪波动，保持大便通畅。</div>
	</article>
	<div class="btn">
		<div class="music">
			<audio controls="controls" id="bgsound" preload="auto" >
	   		 	<source src="<%=basePath%>postoperation/music/week_2.wav" type="audio/mpeg"/>
			</audio>
		</div>
	</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/everyday_7.jsp">上一章</a>
			<a id ="next" href="<%=basePath%>postoperation/week_3.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
	<input type="hidden" id="week" value="2" />
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
