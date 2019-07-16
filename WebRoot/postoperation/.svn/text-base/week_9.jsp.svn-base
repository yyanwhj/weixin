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
		<div class="title">第9周</div>
		<div class="part">【常备硝酸甘油】</div>
		<div class="paragraph">日常生活中，特别是外出时，要携带冠心病急救药物——硝酸甘油片剂或气雾剂。既可在心绞痛发作时服用，缓解症状；也可在精神遭受意外强烈刺激时服用，预防心绞痛发作。另外，硝酸甘油片剂见光易分解，故应放在棕色瓶中，最好6个月更换一次。</div>
		<div class="part">【呼吸困难】</div>
		<div class="paragraph">如锻炼中出现呼吸困难，最好寻找一处依靠物，慢慢降低重心蹲下或坐下，这时一定要避免摔倒。随着体位改变，通常呼吸困难的情况能解除。如仍然不能缓解，要当机立断，主动寻求帮助，及时就医。</div>
		<div class="part">【饮食推荐食物：坚果】</div>
		<div class="paragraph">坚果的营养价值很高，是预防心脏病的好食物。坚果中含有丰富的单不饱和脂肪酸和植物甾醇，有助于降低人体血液中的“坏胆固醇”(低密度脂蛋白胆固醇)。而且有不少坚果，例如胡桃、核桃、杏仁、花生等含有鞣花酸，能抑制癌细胞生长。</div>
		<div class="part">【怒伤身】</div>
		<div class="paragraph">同病毒一样，愤怒是人体中的一种心理病毒，会使人重病缠身，一蹶不振。研究显示，愤怒会导致高血压、溃疡、失眠等。据统计，情绪低落、容易生气的人患癌症和神经衰弱的可能性要比正常人大。</div>
	</article>
	<div class="btn">
		<div class="music">
			<audio controls="controls" id="bgsound" preload="auto" >
	   		 	<source src="<%=basePath%>postoperation/music/week_9.wav" type="audio/mpeg"/>
			</audio>
		</div>
	</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_8.jsp">上一章</a>
			<a id="next" href="<%=basePath%>postoperation/week_10.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
	<input type="hidden" id="week" value="9" />
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
