<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<div class="title">第6天</div>
		<img src="<%=basePath %>postoperation/images/6.png" alt="" style="width:100%;">
		<div class="part">【早上别运动】</div>
		<div class="paragraph">上午6至9时是冠心病和脑出血危险时刻，发病率比上午11时高出3倍多；人体在上午时段交感神经活性较高，易致心律失常，可能出现心室颤动，引起猝死；另外，动脉压在上午时较高，易导致急性冠状动脉综合征发作。您选择散步的运动时间段尽量避免这些危险时期。</div>
		<div class="part">【增加纤维素摄入】</div>
		<div class="paragraph">可多吃富含纤维的食物，如各种蔬菜、水果、糙米、全谷类及豆类，有助排便，预防便秘，稳定血糖及降低血胆固醇。</div>
		<div class="part">【降脂药物】</div>
		<div class="paragraph">一定要服用他汀类药物稳定斑块，防其他冠状动脉血管病变进展。要遵医嘱长期规律、足量服用，并且要定期化验血脂的各项指标，使坏胆固醇-低密度脂蛋白胆固醇降至&lt;1.8mmol/L,防止动脉粥样硬化，定期复查肌酶和肝功能。</div>
	</article>
	<div class="btn">
		<div class="music">
			<audio controls="controls" id="bgsound" preload="auto" >
				<source src="<%=basePath%>postoperation/music/day_6.wav" type="audio/mpeg" />
			</audio>
		</div>
	</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath %>postoperation/everyday_5.jsp">上一章</a>
			<a id="next" href="<%=basePath %>postoperation/everyday_7.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
<input type="hidden" id="pageIndex" value="6" />
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
