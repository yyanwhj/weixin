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
		<div class="title">第47周</div>
		<div class="part">【药品有效期不等于保质期】</div>
		<div class="paragraph">药品有效期并不等于保质期，如贮藏条件不当，药品也有可能在有效期内发生变质或被污染而不能使用。如生活中常用的滴眼剂，原是无菌溶液，但打开并反复使用后，溶液极易被细菌污染。一般要求开启3～4周后就不宜再用了。</div>
		<div class="part">【别做退步走运动】</div>
		<div class="paragraph">退步走可刺激不经常活动的肌肉，改善人体平衡力，很多人喜欢退步走。但对支架术后的您来说，倒退走会使心血管不堪重负；还会使颈部转向，导致颈动脉受压迫、管腔变窄、血流减少、造成脑部供血减少、大脑缺氧，甚至可能在转颈时突然晕倒。您不可做退步走运动。</div>
		<div class="part">【康复油】</div>
		<div class="paragraph">动物油含有较高的饱和脂肪酸和胆固醇，会使人体器官加速衰老和促使血管硬化，进而引起冠心病、卒中等。而植物油如豆油、菜籽油、花生油、玉米油等，含有大量不饱和脂肪酸，是高血压、动脉硬化和冠心病患者的“康复油”。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_47.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_46.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_48.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="47" />
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
