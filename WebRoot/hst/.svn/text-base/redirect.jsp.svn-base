<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>"> 
    <meta charset="UTF-8">
    <title>请求中.....</title>
    <meta content="initial-scale=1.0,maximum-scale=1.0,width=device-width" name="viewport">
    <meta name="apple-touch-fullscreen" content="YES">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta http-equiv="Expires" content="-1">
    <meta http-equiv="pragram" content="no-cache">
    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
</head>
<script type="text/javascript">

$(function(){
	 purchase.submit(); 
	 
	
	 
});
</script>
<body>
<div class="containers">
   <form action="${hstPageURL }special_channel/auth/whole_check" id='purchase' method="post">
	   <input id="method" name="method" type="hidden" value="special_channel.auth.whole_check">
        <input id="app_key" name="app_key" type="hidden" value="${resultJson.app_key }">
        <input id="access_token" name="access_token" type="hidden" value="${resultJson.access_token }">
        <input id="session_key" name="session_key" type="hidden" value="">
        <input id="timestamp" name="timestamp" type="hidden" value="${resultJson.timestamp }">
        <input id="format" name="format" type="hidden" value="html">
        <input id="v" name="v" type="hidden" value="v1">
        <input id="json_body" name="json_body" type="hidden" value='${json_body}'>
        <input id="sign" name="sign" type="hidden" value="${resultJson.sign }">	
		<!--如果需要进入指定页面，传special_url参数
         <input id="special_url" name="special_url" type="hidden" value="/goods_4567.html">
 		-->	
 	</form>
   
</body>
</html>