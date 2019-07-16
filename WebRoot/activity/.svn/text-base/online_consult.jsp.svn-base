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
		<title>在线咨询</title>
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
				<img src="<%=basePath %>activity/images/userDownload.png" width="100%" />
			</div>
			<div class="download">
				<a href="http://a.app.qq.com/o/simple.jsp?pkgname=com.lepu.pasm" class="btn">
					<span class="icon"></span>
					<span>下载Iphone版</span>
				</a>
				<a href="http://dl.ixinzang.com/pasm/d.html" class="btn">
					<span class="icon android"></span>
					<span>下载Android版</span>
				</a>
			</div>
		</header>
		<div class="content">
			<div class="part">
				<span></span>
				<p class="text">如需咨询专业医学问题，您可下载“同心管家APP”，在“快速咨询-在线咨询”版块点击医生头像进行咨询，专业医师为您解疑答惑。</p>
			</div>
			
		</div>
	</body>

</html>
