<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>完成绑定</title>
   	<meta content="" name="description">
	<meta content="" name="keywords">
	<meta charset="UTF-8">	
	<meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">
	<link rel="stylesheet" type="text/css" href="css/weui.min.css">		
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/zepto.min.js"></script>	
  </head>  
  <body>
  <div class="weui_msg">
	        <div class="weui_icon_area"><i class="weui_icon_success weui_icon_msg"></i></div>
	        <div class="weui_text_area">
	            <h2 class="weui_msg_title">已绑定账号</h2>
	            <p class="weui_msg_desc">微信已与 ${MobilePhone }绑定</p>
	        </div>
	        <div class="weui_opr_area">
	            <p class="weui_btn_area">
	                <a href="javascript:;" class="weui_btn weui_btn_primary getinfo">查看我的资料</a>	                
	            </p>
	        </div>	
	        
	        <div class="weui_opr_area">
	            <p class="weui_btn_area">
	                <a href="javascript:;" class="weui_btn weui_btn_primary">更换手机号</a>	                
	            </p>
	        </div>	
	                
	    </div>  
<script>
$(function(){
	$(".weui_msg .weui_btn_primary").on("tap",function(){
		window.location.href="user/toModifiedBindAccount?OpenID=${OpenID}";
	});
	
	$(".getinfo").on("tap",function(){
		window.location.href="user/modifieduserinfoinit?OpenID=${OpenID}";
	});
	
});
</script>    
</body>  
</html>
