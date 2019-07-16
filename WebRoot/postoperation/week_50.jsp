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
		<div class="title">第50周</div>
		<div class="part">【药品的密封保存】</div>
		<div class="paragraph">密封保存是指药品应在密封的容器内贮藏，以防止药品风化、吸潮、挥发或进入异物。空气湿度过大，可使药品吸收水蒸气后潮解、液化、变质或霉变；湿度太小，又可使某些药品风化变质。几乎所有的片剂(包括糖衣片、肠溶衣片、薄膜衣片、泡腾片、控释片、缓释片)、颗粒剂、散剂、胶囊剂及大部分中成药均需密封保存。</div>
		<div class="part">【什么是营养强化食品？】</div>
		<div class="paragraph">食物营养强化就是在食物加工过程中人为加入一些人体所必需的，但在日常膳食中又易缺乏的营养素，以保证人体的营养需要。在食品加工过程中经过这种人为添加了营养素的食品就称为营养强化食品，例如加碘盐、在酱油中强化铁等。</div>
		<div class="part">【骨质疏松者怎么动？】</div>
		<div class="paragraph">患有骨质疏松的人群最易发生跌倒意外，负重或过于激烈的运动也会造成损伤，这部分人群最适宜的锻炼项目应是改善肌肉力量，获得平衡性、稳定性和协调性，这些运动可有效防止跌倒。较为适合这些人的运动项目包括水中运动项目、太极拳、太极剑等舒缓、柔和的运动。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_50.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_49.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_51.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="50" />
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
