<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:forEach items="${BannerList }" var="item">
	<c:choose>
		<c:when test="${item.LinkTargetType eq -1 }">
			<a href="<%=basePath %>/getArticleDetail?articleID=${item.ArticleID }" class="rimg-item">
			   	<img src="${imgHost }${item.Cover}">
				<div class="rgrey-bg"></div>
				<p>${item.ArticleTitle }</p>
			</a>
		</c:when>
		<c:otherwise>
			<c:if test="${not empty item.LinkURL }">
			<a href="${item.LinkURL }" class="rimg-item" >
			   	<img src="${imgHost }${item.Cover}">
				<div class="rgrey-bg"></div>
				<p>${item.ArticleTitle }</p>
			</a>
		</c:if>
		<c:if test="${empty item.LinkURL }">
			<a href="javascript:void(0)" class="rimg-item">
			   	<img src="${imgHost }${item.Cover}">
				<div class="rgrey-bg"></div>
				<p>${item.ArticleTitle }</p>
			</a>
		</c:if>
		</c:otherwise>
	</c:choose>
</c:forEach>