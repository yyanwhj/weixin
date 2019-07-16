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
		<div class="title">第6周</div>
		<div class="part">【血脂正常也要服他汀】</div>
		<div class="paragraph">支架术后，血脂正常，并不等于血脂水平理想。对支架术后患者，他汀类药物的作用不仅在降脂，而在于稳定斑块、延缓动脉粥样化进展或逆转斑块，您千万不要看到化验单上血脂下降了就停服他汀。况且，现在临床上很多患者，停用他汀类药物后，血脂还可能会反弹。他汀治疗是一个长期过程。他汀是一类安全药物。</div>
		<div class="part">【带上急救药】</div>
		<div class="paragraph">外出运动时随身携带硝酸甘油，如出现胸闷、胸痛时，应立即停止运动，就地休息并含服硝酸甘油，如症状10分钟无缓解，立即至医院就诊或呼叫120或999。</div>
		<div class="part">【适当摄入天然抗凝食物】</div>
		<div class="paragraph">富含吡嗪类的天然抗凝食物有抑制血小板聚集，防止血栓形成，减少心肌梗死与卒中发生的作用。此类食物有黑木耳、大蒜、香菇、洋葱、茼蒿、龙须菜、草莓、菠萝等，每天可适当进食。</div>
		<div class="part">【笑是最好的体操】</div>
		<div class="paragraph">笑是最好的体操，微微一笑牵动面部13块肌肉；哈哈大笑，面部、胸部、腹部的肌肉都参加运动。笑能使人吸进更多氧气，排出更多废气，保持呼吸通畅，促进新陈代谢。笑能加速血液循环，增强心血管功能，使局部和整个身体供血充足。笑是与生俱来、用之不竭的良药。保持心情愉快，笑口常开非常有利于恢复健康。这里讲个小故事：清朝有一位八府巡按，患了精神忧郁症，长期医治无效。有一天，他经过某地，地方官推荐当地一位最有名的老医生为他治病。这位老医生按脉后，十分认真地对巡按说：“大人患了月经不调症。”并开出处方，吩咐按时服药。巡按大人一听，当场哈哈大笑，心想这个老医生徒有虚名，是个老糊涂。回家路上，每当想起此事，就要笑上一阵。然而在笑声中，他的精神忧郁症逐渐减轻了。待回到家里，又将此事说与夫人听，二人又笑了一阵，他的精神忧郁症竟然全好了。</div>
	</article>
	<div class="btn">
		<div class="music">
			<audio controls="controls" id="bgsound" preload="auto" >
	   		 	<source src="<%=basePath%>postoperation/music/week_6.wav" type="audio/mpeg"/>
			</audio>
		</div>
	</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_5.jsp">上一章</a>
			<a id ="next" href="<%=basePath%>postoperation/week_7.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="6" />
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
