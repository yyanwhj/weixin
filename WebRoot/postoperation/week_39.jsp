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
		<div class="title">第39周</div>
		<div class="part">【吃药不能跟着广告走】</div>
		<div class="paragraph">对药品的正确选择、合理使用是一个科学性、专业性很强的问题。简单的广告用语很难对药品做出全面的解释，您也很难通过广告对这些药品有深入了解和准确判断。如在对药品一知半解的情况下贸然使用，不但难以达到预想治疗目的，有时甚至还可能出现不良后果。吃药不能跟着广告走，尤其不能轻信非法药品广告，还是应到医院就诊，听从医生或药师的意见，才能真正把病治好。</div>
		<div class="part">【选择合适的锻炼次数】</div>
		<div class="paragraph">１、如果您刚开始锻炼，可每周锻炼至少3天，连续3周后，开始适度增加次数；</div>
		<div class="paragraph">２、如果您有长期运动基础、体质较强，可每周3-5天；</div>
		<div class="paragraph">３、如果您抽不出太多时间运动锻炼，一周保障3天锻炼，也是较好的选择。</div>
		<div class="part">【今天您喝水了吗？】</div>
		<div class="paragraph">一般情况下，建议您每日最少饮水1200ml（约6杯）。饮水应少量多次，切莫感到口渴时再喝水。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_39.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_38.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_40.jsp">下一章</a>
	</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="39" />
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
