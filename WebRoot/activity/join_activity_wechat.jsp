<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width user-scalable=no" />
		<title></title>
		<link rel="stylesheet" href="<%=basePath%>css/downloadQR.css">
		<script>
			var html = document.getElementsByTagName("html")[0];
			var width = html.getBoundingClientRect().width;
			html.style.fontSize = width / 16 + "px";
		</script>
	</head>

	<body>
		<header>
			<div class="img">
				<img src="<%=basePath %>activity/images/2d.jpg" width="100%" />
			</div>
			
		</header>
		<div class="content">
			<div class="part">
				<span></span>
				<p class="text">微信讲座由同心管家主办，采取微信群在线语音直播的形式，定期邀请医学专家，在群内为支架术后及冠心病患友进行免费科普讲座。讲座中由授课专家通过同心管家专用直播号，为大家进行课程的讲授。您可以通过语音、文字、视频、图片等所有微信支持的形式在【微信群】内与专家互动。</p>
			</div>
			<div class="part">
				<span></span>
				<p class="text">如参加，可添加微信客服号：txgj_1 ，客服人员会邀请您进入微信群。</p>
			</div>
			<div class="part">
				<span></span>
				<p class="text">【问题征集】为了更有针对性地为大家解决问题，现公开征集讲座主题，您可将关心的主题直接发送给同心客服txgj_1。</p>
			</div>
		</div>
	</body>

</html>
