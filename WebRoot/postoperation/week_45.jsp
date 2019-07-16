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
		<div class="title">第45周</div>
		<div class="part">【正确使用滴眼剂】</div>
		<div class="paragraph">１、使用滴眼剂前要先洗手。</div>
		<div class="paragraph">２、头部尽量后仰或平躺，用食指将下眼皮向下拉，或用食指和拇指捏住下眼皮向外拉。将滴眼剂瓶嘴对准眼睛，挤出1滴滴眼剂。滴入后，闭上眼睛，轻轻转动眼球，用手指轻压内眼角处(眼皮与鼻梁之间)的泪小管，保持2～3分钟。</div>
		<div class="paragraph">３、滴眼剂一经打开，要在一定的时间内用完。长时间不用后，不要再用。滴眼剂出现异常浑浊或变色时不要再用，也不要与他人共用一瓶滴眼剂。</div>
		<div class="part">【乳糖不耐受者怎样喝奶？】</div>
		<div class="paragraph">乳糖不耐受者可首选低乳糖奶及奶制品，如酸奶、奶酪、低乳糖奶等。乳糖不耐受者应避免空腹饮奶，建议在正餐饮奶，也可在餐后1～2小时内饮奶。其次要合理搭配食物，建议饮奶时注意和固体食物搭配食用。再次要少量多次饮奶，建议一天饮奶量分2～3次饮用。有乳糖不耐受且无饮奶习惯者从少量饮奶( 50ml)开始，逐渐增加。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_45.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_44.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_46.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="45" />
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
