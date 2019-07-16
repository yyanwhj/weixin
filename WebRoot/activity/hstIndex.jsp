<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'hstIndex.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="<%=basePath%>activity/js/jquery-1.11.1.min.js"></script>
  </head>
  <script type="text/javascript">
  $(function(){
		var IsBind = "${IsBind }";
		var UserID = "${UserID }";
		var TAAccessToken = "${TAAccessToken }";
		var OpenID = "${OpenID }";
		
		//如果已经绑定，跳转到护生堂礼品中心
		if(IsBind==1){
			window.location.href="http://wwwtest.ixinzang.com/hst/goodsList?ApplicationID=4&UserID="+UserID+"&AccessToken="+TAAccessToken+"&DeviceID=1";
			//window.location.href="http://wwwtest.ixinzang.com/hst/goodsList?ApplicationID=4&UserID=151&AccessToken=0000000000017efe008275827882d7c2b650a61114b20027de&DeviceID=1";
		}else{
			//跳转到绑定页面，或者在后台自动绑定
			alert("没有绑定,跳转到绑定界面或者后台自动绑定");
		}
	});
  </script>
  <body>
   护生堂积分换礼
  </body>
</html>
