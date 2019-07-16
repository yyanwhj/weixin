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
		<div class="title">第37周</div>
		<div class="part">【药品不是越贵越好】</div>
		<div class="paragraph">您可能觉得药品价格越贵，疗效就越好，这是不正确的。药品的价格主要是根据生产成本及是否进口等因素而定，价格的高低不能作为其疗效的衡量标准。药品的选择应根据不同个体和病情而定，有时很便宜的药就能达到很好疗效。因此，您应听从医生或药师的建议，选择最适合您病情的药品。</div>
		<div class="part">【饭后多久锻炼】</div>
		<div class="paragraph">饭后立即锻炼不可取。吃完饭以后，消化器官需要大量的血液供应，消化吃下去的食物。如这个时段运动锻炼，会使骨骼、肌肉组织“抢走”身体的血液供应，造成消化系统缺血，不仅胃肠的蠕动减弱，消化液分泌也显著减少，引起消化不良。一般说来，饭后休息1-2小时后，再运动锻炼，才是适宜的方法。</div>
		<div class="part">【如何选择燕麦】</div>
		<div class="paragraph">心血管医生建议支架术后多吃点麦片，如何挑选呢？</div>
		<div class="paragraph">１、看配料表，配料表上如有以下添加物的不好，如糖精、麦芽糊精、奶精、植物脂末。</div>
		<div class="paragraph">２、看蛋白质含量，可选择配料表上蛋白质含量大于7%的燕麦。</div>
		<div class="paragraph">３、看外观选择颗粒大、天然的燕麦。</div>
		<div class="paragraph">４、看食用方法，需要煮的好。</div>
	</article>
		<div class="btn">
			<div class="music">
				<audio controls="controls" id="bgsound" preload="auto" >
		   		 	<source src="<%=basePath%>postoperation/music/week_37.wav" type="audio/mpeg"/>
				</audio>
			</div>
			</div>
	<div class="u-btnBox">
		<div class="btns">
			<a href="<%=basePath %>postoperation/everyday_catalog.jsp">目录</a>
			<a href="<%=basePath%>postoperation/week_36.jsp">上一章</a>
			<a href="<%=basePath %>postoperation/week_38.jsp">下一章</a>
		</div>
		<%@include file="../common/postoperation_download_user.jsp" %>
	</div>
		<input type="hidden" id="week" value="37" />
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
