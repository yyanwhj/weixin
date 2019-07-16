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
		<div class="title">第52周</div>
		<div class="part">【安全管理家庭小药箱】</div>
		<div class="paragraph">１、买回家的药，要保留好原包装和说明书。如是没有包装的散药，应放入洗净的药瓶中，并在瓶上注明药品名称、用法用量、注意事项和有效期等。 </div>
		<div class="paragraph">２、家里的备用药，最好选专用的小药箱存放。内服药与外用药、成人药与儿童药应分开存放。</div>
		<div class="paragraph">３、不要将药品放在温度过高和阳光直射的地方。</div>
		<div class="paragraph">４、家庭小药箱要放在儿童不能触及的地方。</div>
		<div class="paragraph">５、家里的小药箱一般每3～6个月就应检查一次，如有过期或变质的药品，应及时处理掉。</div>
		<div class="part">【用茶“秘笈”】</div>
		<div class="paragraph">绿茶的降脂和抗癌作用更明显，也可根据喜好选用红茶或花茶，还可根据病情和体质，配制药茶。如常气短出汗的气虚者，可加入人参片；常口干舌燥的阴虚者，可加麦冬；血脂过高者，可加三七叶；夏日暑盛时，可加苦丁茶。</div>
		<div class="part">【持之以恒】</div>
		<div class="paragraph">锻炼只有坚持不懈才能奏效，如三天打鱼，两天晒网，各器官系统得不到连续刺激，效果不好。您要有持之以恒的精神，养成锻炼习惯，并产生兴趣，从兴趣中获得发自内心的欢乐。</div>
	</article>
		<div class="btn half">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_52.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_51.jsp">上一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="51" />
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
