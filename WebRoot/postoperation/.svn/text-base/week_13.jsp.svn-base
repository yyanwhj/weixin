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
		<div class="title">第13周</div>
		<div class="part">【擅调药量不可取】</div>
		<div class="paragraph">有些患者病情稍有好转就嫌吃药麻烦，或由于担心药物反应和副作用等原因，出现减量、忘服、漏服或干脆停药等现象；有些患者治病心切，急于求成而随意增加剂量；还有些患者在短时间内频繁更换服药品种。这些随意增减药量，不按规定剂量和疗程服用的做法，很容易对身体造成伤害。</div>
		<div class="part">【早上不宜运动】</div>
		<div class="paragraph">１、早晨6点钟左右，人体的血压开始升高，心率逐渐加快，上午10点左右达到最高峰。支架术后患者不宜在此时间运动。</div>
		<div class="paragraph">２、清晨6点到8点，血小板的凝聚力明显增强，血液相对黏稠，这个时间段运动会使心脑血管事件的发生率增加。</div>
		<div class="paragraph">３、经过一夜睡眠，机体相对缺水，体内循环血量相对不足，血液黏稠度较高，支架术后患者，快速从静止状态进入运动状态，易诱发心肌梗死。</div>
		<div class="part">【适当摄入富含精氨酸的食物】</div>
		<div class="paragraph">精氨酸有调节血管张力，抑制血小板聚集，减少血管损伤的作用。富含精氨酸的食物有海参、泥鳅、鳝鱼、山药、芝麻、银杏、豆腐皮和葵花子等。由于精氨酸不是人体必需氨基酸，在人体内可以合成，所以只需要适量补充含量丰富的食物就可以了。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_13.wav" type="audio/mpeg"/>
				</audio>
			</div>
		</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_12.jsp">上一章</a>
			<a id ="next" href="<%=basePath%>postoperation/week_14.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="13" />
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
