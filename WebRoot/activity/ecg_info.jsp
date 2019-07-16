<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
    	<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width user-scalable=no" />
		<title>心电监护</title>
	</head>
	<body>
	<a href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=${AppID }&redirect_uri=${WeiXinServerURL }/pasmPay/dynamicECGPay?response_type=code&scope=snsapi_base&state=1#wechat_redirect">
		<img src="activity/images/ecg_s.png" width="98%" style="margin:1% 0 0 1%;" />
	</a>
	</body>
</html>
