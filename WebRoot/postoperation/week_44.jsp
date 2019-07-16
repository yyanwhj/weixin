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
		<div class="title">第44周</div>
		<div class="part">【正确使用滴鼻剂】</div>
		<div class="paragraph">１、使用滴鼻剂前，首先要将鼻腔内的分泌物去除干净。</div>
		<div class="paragraph">２、仰卧于床上，头部尽量向后仰，使鼻腔低于口咽部。滴鼻剂应距鼻孔1～2厘米，每次滴药3～4滴，滴完药后，用手指轻按几下鼻翼，使药液布满鼻腔，然后保持滴药姿势3～5分钟再坐起。</div>
		<div class="paragraph">３、向鼻内滴药时，滴管头不要碰到鼻部，以免污染药液。如需同时使用两种以上滴鼻剂，两药的滴药时间应间隔3分钟以上。</div>
		<div class="part">【运动后避免吸烟】</div>
		<div class="paragraph">运动后，如把吸烟作为运动后的一种休息，这十分有害。运动后心脏有一运动后易损期，吸烟易使血中游离脂肪酸上升和释放儿茶酚胺，加上尼古丁的作用而易诱发心脏意外。运动可适量饮水，但是不能吸烟。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_44.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_43.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_45.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="44" />
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
