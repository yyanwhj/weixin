<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>微信服务号介绍</title>
	<meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">

    <link rel="stylesheet" href="<%=basePath%>activity/css/base.css">
	<link rel="stylesheet" href="<%=basePath%>activity/css/postoperation_introduce.css">
</head>
<body>
	<div class="title">如何了解 “术后天天知” 内容？</div>
	<img src="<%=basePath%>activity/images/everyday_banner.png" class="banner" alt="">
	<article>
		<div class="title indent">您好！“术后天天知”是关于支架手术患者的术后康复注意事项，包括饮食、运动、用药、心理等方面。您需注册、完善个人相关信息并绑定后方可阅。</div>
		<div class="part">【绑定方式】</div>
		<ul>
			<li class="clearfix">
				<img src="<%=basePath%>activity/images/option_01.png" alt="">
			<!--  	<div class="word">“同心管家”注册用户：  <a href="<%=basePath %>/bindUserUrl?thirdpartyAccount=${thirdpartyAccount }&link=${link}" class="bind">立即绑定</a></div> -->
			<div class="word">“同心管家”注册用户：  <a href="<%=basePath %>user/toBindAccountDirc?OpenID=${thirdpartyAccount}&ActionType=1&link=${link}" class="bind">立即绑定</a></div>
			
			</li>
			<li class="clearfix">
				<img src="<%=basePath%>activity/images/option_02.png" alt="">
				<div class="word">电话客服注册：直接拨打<a href="tel:4000898898"><span class="phone">010-53767509</span></a>由客服人员为您服务。<br>（周一至周日8:30—17:30）</div>
			</li>
			<li class="clearfix">
				<img src="<%=basePath%>activity/images/option_03.png" alt="">
				<div class="word">下载“同心管家”APP客户端，注册了解详细内容。</div>
			</li>
		</ul>
		<div class="prompt clearfix">
			<span class="cap">注：</span>
			<span class="cont">相关内容请注册后在本页面绑定，绑定后方可阅读。</span></div>
	</article>
	<div class="btn clearfix">
		<a href="http://a.app.qq.com/o/simple.jsp?pkgname=com.lepu.pasm&g_f=991653">下载"同心管家"APP</a>
	</div>
</body>
</html>
