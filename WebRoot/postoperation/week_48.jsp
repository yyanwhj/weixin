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
		<div class="title">第48周</div>
		<div class="part">【药品的冷处保存】</div>
		<div class="paragraph">冷处指2℃～10℃的温度。如有些药品除要求冷处保存外，还注明特定温度，如2℃～8℃或2℃～5℃，保存时应严格遵守说明书中标示的温度限制。如在炎热夏季，随身携带药品时间较长，应采取一些措施，如可以使用保温桶、保温袋、冰袋等装置维持药品低温状态，保证药品质量。</div>
		<div class="part">【胡萝卜赛人参】</div>
		<div class="paragraph">胡萝卜是一种营养非常好的食物，可明目、防癌、增强免疫力。胡萝卜的吃法有讲究，首先胡萝卜可搭配肉吃，可弥补自身蛋白质的缺乏，比如胡萝卜炖牛肉；其次β胡萝卜素吸收需一种载体，即脂肪，所以吃胡萝卜最好炒着吃。</div>
		<div class="part">【老年人别快跑】</div>
		<div class="paragraph">老年人心肺功能较差，动脉硬化，呼吸浅弱，忌快速跑。如突然起动快跑，必然引起心率剧增，供氧不足，血压突升，超过老年人承受能力，极易发生意外。老年人也不要进行激烈的直接接触竞赛，尤其是足球、篮球、摔跤、拳击、对练等项目。老年人神经反射迟缓，骨质催化，平衡力也差，若碰撞稍重，容易摔倒，发生骨折或其他损伤。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_48.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_47.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_49.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="48" />
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
