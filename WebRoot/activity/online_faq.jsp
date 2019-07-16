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
		<title>常见问题</title>
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
				<p class="text">如需检索查询支架术后相关问题及答案，您可下载“同心管家APP”，在“首页-常见问题-全部问题”版块，通过关键词搜索快速获得相关问题解答。</p>
			</div>
			
		</div>
	</body>

</html>
