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
		<div class="title">第5周</div>
		<div class="part">【阿司匹林不能随意停】</div>
		<div class="paragraph">支架术后，随意停用阿司匹林显著增加患者心血管事件危险。一定不要随意停阿司匹林。如因外科手术需停用阿司匹林，必须和医生沟通，在医生指导下停用，并及早恢复使用。</div>
		<div class="part">【运动强度的判断】</div>
		<div class="paragraph">判断运动强度是否合适，最简单的方式是：运动中微出汗，轻度心率和呼吸加快，但不影响与同行者对话，运动后无持续疲劳感，运动后6～8分钟心率能恢复到安静水平。</div>
		<div class="part">【少吃反式脂肪酸】</div>
		<div class="paragraph">反式脂肪酸可使血清低密度脂蛋白胆固醇（“坏”胆固醇）升高，而使高密度脂蛋白胆固醇（“好”胆固醇）降低，有增加心血管疾病的危险性。因此，要尽量少吃或不吃含反式脂肪酸较多的食物，如人造黄油、蛋糕、饼干、蛋黄酱、炸薯条、炸鸡、炸鱼等食品。</div>
		<div class="part">【喜大伤心】</div>
		<div class="paragraph">喜大伤心，不是说一般的嬉笑就会伤及心脏的健康安全，而是指狂喜、大喜可能引起大脑、心脏缺血。尤其是在情绪持续极度紧张情况下，突然大喜容易引起心脏缺血。</div>
	</article>
	<div class="btn">
		<div class="music">
			<audio controls="controls" id="bgsound" preload="auto" >
	   		 	<source src="<%=basePath%>postoperation/music/week_5.wav" type="audio/mpeg"/>
			</audio>
		</div>
	</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_4.jsp">上一章</a>
			<a id ="next" href="<%=basePath%>postoperation/week_6.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
	<input type="hidden" id="week" value="5" />
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
