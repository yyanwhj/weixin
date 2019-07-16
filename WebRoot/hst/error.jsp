<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>出错啦！</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body style="text-align: center;">
  <style>
	body{
	background:#fff;
	}
	img.empty{
	margin:10px auto;
	width:120px;
	}
	.HasNoCnt{
		position:absolute;
		left:50%;
		top:50%;
		width:300px;
		height:200px;
		margin-left:-150px;
		margin-top:-100px;
		font-size:16px;
		text-align:center;
		color:#d2d2d2;
	}
	</style>
 <div class="HasNoCnt">
				<img src="images/error.png" class="empty">	
  				<br><br> &nbsp;hi 真不巧 网页走丢了。
	</div>
  </body>
</html>
