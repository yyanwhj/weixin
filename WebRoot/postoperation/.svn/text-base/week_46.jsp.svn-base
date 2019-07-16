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
		<div class="title">第46周</div>
		<div class="part">【药品的有效期】</div>
		<div class="paragraph">药品有效期指药品在规定贮藏条件下，能保证质量的期限。您在药品说明书上会看到有效期至X年X月或X年X月X日的字样。如有效期至2009年06月，表示该药品可以用到2009年6月底，到2009年7月1日即失效；如有效期至2009年08月12日，则表示该药品2009年8月13日起不得再使用。</div>
		<div class="part">【运动时避免穿得太厚】</div>
		<div class="paragraph">您要选择穿着舒服的衣服外出锻炼，但避免穿太厚。衣服穿太厚，影响散热，增加心率。心率增快会使心肌耗氧量增加，有可能引起心脏病发生。提醒您锻炼时不要穿得太厚。</div>
		<div class="part">【饮食误区】</div>
		<div class="paragraph">合并糖尿病者，采用过度节食方法治疗糖尿病并不可取。开始因热量摄入减少，使血糖、尿糖暂时下降，但随后由于营养摄入不足，人体活动的能量只能由身体的脂肪分解供给，其中的产物为酮体，会引起酮症酸中毒，严重者可危及生命。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_46.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_45.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_47.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="46" />
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
