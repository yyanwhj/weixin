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
		<div class="title">第28周</div>
		<div class="part">【华法林漏服了怎么办？】</div>
		<div class="paragraph">华法林，要按时按量遵医嘱服用。若偶尔一次漏服，不必惊慌失措。如漏服一次，4小时内请当时补上，超过4小时请勿补服，第2天继续正常用药即可。但您千万不能在第2天加倍用药。如连续两次没服药，及时与医生联系。</div>
		<div class="part">【如何应对运动岔气】</div>
		<div class="paragraph">如果您在运动过程中岔气后有三步动作来应对：</div>
		<div class="paragraph">１、憋气，深吸气后憋气，保持几秒钟，呼气；</div>
		<div class="paragraph">２、拉伸，把患侧的肢体举起来，向相反的一侧伸展，伸展的同时，深吸一口气，憋住气，保持几秒钟，呼气；</div>
		<div class="paragraph">３、拍打，用力叩打胸腔两侧或肋下疼痛处，然后做缓慢深长的呼吸，重复做几次，使呼吸肌逐渐放松，痉挛缓解。</div>
		<div class="part">【有益心脏之红色食物】</div>
		<div class="paragraph">可少量补充瘦猪肉、牛肉等，适量吃苹果和西瓜。苹果每天吃1个，可促进胆汁酸的排泄。西瓜含有大量氨基酸、葡萄糖等，每3天吃1次(1次不得多于80克)，可帮助控制血压。</div>
		<div class="part">【全谷类食物改善焦虑】</div>
		<div class="paragraph">支架术后，每日饮食中有意识多吃一些全谷类食物，可改善焦虑情绪，因为全谷类食物中含有丰富的麸类，有改善焦虑的作用。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_28.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_27.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_29.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="28" />
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
