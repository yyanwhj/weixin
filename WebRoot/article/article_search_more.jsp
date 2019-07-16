<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:forEach items="${ArticleList }" var="item">
	<c:if test="${not empty item.LinkURL }">
		<a class="article-item" href="${item.LinkURL }">
		<img src="${item.Cover}">
		<dl class="article-info">
			<dt>${item.ArticleTitle }</dt>
				<dd><span class="green">同心管家</span><span>${item.PublishDate }</span></dd>
			</dl>
		</a>
	</c:if>
	<c:if test="${empty item.LinkURL }">
		<a class="article-item" href="<%=basePath %>getArticleDetail?articleID=${item.ArticleID }">
		<img src="${item.Cover}">
		<dl class="article-info">
			<dt>${item.ArticleTitle }</dt>
				<dd><span class="green">同心管家</span><span>${item.PublishDate }</span></dd>
			</dl>
		</a>
	</c:if>
</c:forEach>