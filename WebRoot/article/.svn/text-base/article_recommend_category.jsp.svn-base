<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<ul class="rsub-nav clearfix">
<c:forEach items="${CategoryList}" var="item" varStatus="indexStatus">
	<c:if test="${indexStatus.index ==0 }"><li class="active" data-id="${item.ACID}">${item.ACTitle }</li></c:if>
	<c:if test="${indexStatus.index > 0 }"><li data-id="${item.ACID}">${item.ACTitle }</li></c:if>
</c:forEach>
</ul>
<div id="ACList">
<c:forEach items="${ArticleList }" var="item">
	<c:choose>
		<c:when test="${item.LinkTargetType eq -1 }">
			<a class="article-item" href="<%=basePath %>/getArticleDetail?articleID=${item.ArticleID }">
				<img src="${item.Cover}">
				<dl class="article-info">
					<dt>${item.ArticleTitle }</dt>
				<dd><span>${item.PublishDate }</span></dd>
				</dl>
			</a>
		</c:when>
		<c:otherwise>
			<c:if test="${not empty item.LinkURL }">
				<a class="article-item" href="${item.LinkURL }">
				<img src="${item.Cover}">
				<dl class="article-info">
					<dt>${item.ArticleTitle }</dt>
					<dd><span>${item.PublishDate }</span></dd>
				</dl>
				</a>
			</c:if>
			<c:if test="${empty item.LinkURL }">
				<a class="article-item" href="javascript:void(0)">
					<img src="${item.Cover}">
				<dl class="article-info">
					<dt>${item.ArticleTitle }</dt>
					<dd><span>${item.PublishDate }</span></dd>
				</dl>
				</a>
			</c:if>
		</c:otherwise>
	</c:choose>
</c:forEach>
</div>
