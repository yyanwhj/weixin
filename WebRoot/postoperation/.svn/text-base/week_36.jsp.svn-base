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
		<div class="title">第36周</div>
		<div class="part">【就诊时，您应告诉医生哪些用药信息？】</div>
		<div class="paragraph">您到医院就诊时，除应详细将自己这次发病经过告诉医生外，一定要讲明三点：</div>
		<div class="paragraph">１、您正在服用哪些药品。</div>
		<div class="paragraph">２、您曾对哪些药物、食物和其他物质(如花、草、动物皮毛等等)过敏。</div>
		<div class="paragraph">３、您以前是否患过其他疾病，如肝肾病。</div>
		<div class="part">【空腹运动不可取】</div>
		<div class="paragraph">空腹锻炼时，体内血糖会降低，引起头痛、四肢乏力，甚至会出现昏厥。同时，会有强烈的饥饿感，伴有腹痛、消化功能降低等。空腹锻炼不可取，尤其是糖尿病患者和心脏病患者更不应空腹锻炼。</div>
		<div class="part">【适量吃点粗粮】</div>
		<div class="paragraph">粗粮中含丰富的可溶膳食纤维，可减少肠道对胆固醇的吸收，促进胆汁的排泄，降低血胆固醇水平。同时富含植物化学物如木酚素、芦丁、类胡萝卜素等，具有抗氧化作用，可降低发生心血管疾病的危险性。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_36.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_35.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_37.jsp">下一章</a>
	</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="36" />
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
