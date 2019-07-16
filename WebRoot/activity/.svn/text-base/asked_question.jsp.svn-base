<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../common/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>常见问题</title>
	<meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">

    <link rel="stylesheet" href="<%=basePath %>activity/css/base.css">
    <link rel="stylesheet" href="<%=basePath %>activity/css/question.css">

    <script type="text/javascript" src="<%=basePath %>activity/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript">
    $(function(){
		$(".caption").attr("flag","hide");
		$(".caption").click(function(){
			if($(this).attr("flag")=="hide"){
				$(this).siblings(".content").css("display","block");
				$(this).attr("flag","show");
				$(this).children("img").attr("src","<%=basePath %>activity/images/ico2.png");

				$(this).parents("section").siblings().find(".content").css("display","none");
				$(this).parents("section").siblings().find(".caption").attr("flag","hide");
				$(this).parents("section").siblings().find("img").attr("src","<%=basePath %>activity/images/ico1.png");
			}
			else{
				$(this).siblings(".content").css("display","none");
				$(this).attr("flag","hide");
				$(this).children("img").attr("src","<%=basePath %>activity/images/ico1.png");
			}
		});


		$(".caption").focus(function(){
			$(this).blur();
		});
	})
    </script>
</head>
<body>
	<c:forEach items="${askedQuestions }" var="ask">
		<section>
			<div class="caption"><span>${ask.ARQuestion }</span><img src="<%=basePath %>activity/images/ico1.png" alt=""></div>
			<div class="content">答：${ask.ARAnswer }</div>
		</section>
	</c:forEach>
</body>
</html>
