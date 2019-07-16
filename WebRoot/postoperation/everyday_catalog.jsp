<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>postoperation/css/postoperation.css">
	<script type="text/javascript" src="<%=basePath%>activity/js/jquery-1.11.1.min.js"></script>

</head>
<body>
	<article>
		<div class="catalog">
			<a href="<%=basePath %>postoperation/everyday_0.jsp">序言</a>
		</div>
	</article>
</body>
<script type="text/javascript">
	$(function(){
		var maxDay = <%=request.getSession().getAttribute("maxDay")%>;
		var indexDay = maxDay;
		var indexWeek = 0;
		if(maxDay > 7){
			indexDay = 7;
			indexWeek = <%=request.getSession().getAttribute("maxWeek")%>;
		}
		var appendHTML = "";
		for (var i = 1; i <= indexDay; i++) {
			appendHTML += "<a href='<%=basePath %>postoperation/everyday_"+i+".jsp'>术后第"+i+"天</a>";
		}
		if(indexWeek > 0){
			for (var i = 2; i <= indexWeek; i++) {
				appendHTML += "<a href='<%=basePath %>postoperation/week_"+i+".jsp'>术后第"+i+"周</a>";
			}
		}
		$(".catalog").append(appendHTML);
	});
</script>
</html>
