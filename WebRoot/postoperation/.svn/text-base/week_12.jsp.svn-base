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
		<div class="title">第12周</div>
		<div class="part">【术后3个月复查】</div>
		<div class="paragraph">术后三个月，应去医院复查，复查的项目包括血压、心率、生化（血脂、血糖、肝功能、肾功能）、心肌酶（肌酸激酶同工酶CK-MB、肌酸激酶CK）、尿常规、便常规（潜血）、血常规、心电图。必要时复查胸片、超声心动图等。</div>
		<div class="part">【用药不能从众】</div>
		<div class="paragraph">常会有一些人，对自己的症状并没有明确判断，而是询问身边的人，问他们有类似情况时用什么药，然后自己就去买来服用。这种做法十分危险。即便是同一类疾病，治疗时应根据其病因、症状性质、急缓程度等具体情况，选择合适的药物。另外，人与人之间存在个体差异，同一药物对于不同患者，效果也不一样。用药不能从众，要根据疾病和个人实际情况，合理用药。</div>
		<div class="part">【运动后不可立即洗澡】</div>
		<div class="paragraph">锻炼中身体和组织器官活动量增加，产热需要排放出去，为散热而皮肤毛孔开放，血液循环加快，如果洗冷水浴，血管受刺激收缩，散热困难、体温升高，循环阻力加大，代谢废物排不出，还易感冒。同样情况下，洗热水浴，增加皮肤中血流量，不利于向心脑器官供血，导致供血不足，甚至虚脱。运动锻炼后，不宜立刻洗澡。不论冷水浴还是热水浴，水温不宜过低或过高，时间不宜长，以10-15分钟为宜。</div>
		<div class="part">【哀伤的调适：给自己点时间】</div>
		<div class="paragraph">１、哀伤痛苦需一段时间调适，允许自己在适当时候感受、发泄情绪。</div>
		<div class="paragraph">２、维持日常生活的规律，饮食、睡眠正常。</div>
		<div class="paragraph">３、不要孤立自己，多与亲戚、朋友、邻居、同事保持联系，谈论自己的感受。</div>
	</article>
	<div class="btn">
		<div class="music">
			<audio controls="controls" id="bgsound" preload="auto" >
	   		 	<source src="<%=basePath%>postoperation/music/week_12.wav" type="audio/mpeg"/>
			</audio>
		</div>
	</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_11.jsp">上一章</a>
			<a id ="next" href="<%=basePath%>postoperation/week_13.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
	<input type="hidden" id="week" value="12" />
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
