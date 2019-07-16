<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>绑定用户</title>
	<meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">

    <link rel="stylesheet" href="<%=basePath%>activity/css/base.css">
	<link rel="stylesheet" href="<%=basePath%>activity/css/register.css">
	<script type="text/javascript" src="<%=basePath%>activity/js/jquery-1.11.1.min.js"></script>
</head>
<body>
	<section class="logo"><img class="logo" src="<%=basePath%>activity/images/logo.png" alt=""></section>
	<form action="" id="form" method="post">	
		<section class="form">
			<span id="message" style="text-align: center;margin-left:35%; color: red;"></span> 
			<input type="hidden" name="thirdpartyAccount" value="${thirdpartyAccount }"/>
			<div class="user">
				<img src="<%=basePath%>activity/images/user_name.png" alt="">
				<div class="text"><input type="text" id="loginId" name="loginId" placeholder="请输入注册手机号"></div>
			</div>
			<div class="password">
				<img src="<%=basePath%>activity/images/password.png" alt="">
				<div class="text"><input type="password" id="password" name="password" placeholder="请输入登录密码"></div>
			</div>
			<div class="submit"><a href="javascript:void(0);" onclick="bindUser();">绑定</a></div>
			<div class="link"><a href="http://a.app.qq.com/o/simple.jsp?pkgname=com.lepu.pasm&g_f=991653">免费注册</a></div>
		</section>
	</form>
	<input id="url" type="hidden" value="${link }">
</body>
<script type="text/javascript">
	function bindUser(){
		var loadurl = $("#url").val();
		$("#message").hide();
		var mobile = /^(((1[0-9]{1}[0-9]{1}))+\d{8})$/;   
		var loginId = $("#loginId").val();
		var password = $("#password").val();
		if(loginId == ''){
			$("#message").html("请输入注册手机号");
			$("#message").show();
			return;
		}else if(password == ''){
			$("#message").html("请输入登陆密码");
			$("#message").show();
			return;
		}else if(!(length = 11 && mobile.test(loginId))){
			$("#message").html("手机号码格式不对");
			$("#message").show();
			return;
		}
		$.ajax( {
			type : "post",//无此配置，提交中文乱码
			cache : false,
			url : "${pageContext.request.contextPath}/bindUser",
			dataType : "json",
			data : ($("#form").serializeArray()),
			success : function(data) {
				if(data.Result.Status == 200){
					window.location.href = loadurl;
				}else{
					$("#message").html(data.Result.Message);
					$("#message").show();
				}
			}
		});
	}
</script>
</html>
