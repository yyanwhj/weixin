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
		<div class="title">第16周</div>
		<div class="part">【药物副作用】</div>
		<div class="paragraph">所有药物都有副作用。您需知道：</div>
		<div class="paragraph">药物的作用往往比其副作用更重要；</div>
		<div class="paragraph">如果因药物副作用，发生咳血等重大事件，请及时就医；</div>
		<div class="paragraph">如果一直受药物副作用困扰，最好问问您的主治医生。医生会结合您的病情，适当降低剂量或更换药物。千万不能擅自停药。</div>
		<div class="part">【太极拳】</div>
		<div class="paragraph">每次练太极拳的时间长短、趟数多少、架子高低、速度快慢，决定运动量大小。运动量因人而异。如您练拳后病情稳定，精神、食欲、睡眠等都较好，练拳后第二天，身体疲劳和酸痛感已基本消除，表示运动量大致合适，否则表明运动过量。</div>
		<div class="part">【每天吃多少肉合适？】</div>
		<div class="paragraph">如您的血脂、体重、腰围正常，一天可吃2两瘦猪、牛或羊肉（生肉），做成熟肉约为70克。如您的超重或肥胖，瘦肉应控制在每天1两。</div>
		<div class="part">【音乐好处多】</div>
		<div class="paragraph">音乐能直接影响人的情绪和行为，节奏鲜明的音乐能振奋人的精神，使人兴奋、激动；而旋律优美的乐曲，能使人情绪安静，轻松愉快。乐曲的节奏、旋律、速度、谐调不同，可体现出降压、镇静、镇痛和情绪调节等不同效果。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_16.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_15.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_17.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="16" />
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
