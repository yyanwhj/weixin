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
		<title>同心管家APP下载</title>
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
				<p class="text">同心管家APP是目前国内唯一一款针对支架术后患者康复的应用软件，结合现代化的移动互联技术和传统的服务模式，用最便捷的方式为患者提供专业、个性化的支架术后康复解决方案。</p>
			</div>
			<div class="part">
				<span></span>
				<p class="text">同心管家公众版APP功能包括：术后天天知、医学讲座、在线咨询、电话咨询、视频集粹、同心百科、用药提醒、健康档案、寻医问药、健康商城、陪诊服务、转诊服务、论坛、积分换礼等功能。</p>
			</div>
		</div>
	</body>

</html>
