<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>往期回顾</title>
	<meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">

    <link rel="stylesheet" type="text/css" href="<%=basePath%>activity/css/base.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>activity/css/header.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>activity/css/activity_list.css" />
	<link rel="stylesheet" href="<%=basePath%>activity/css/none.css">
	
	<script type="text/javascript" src="<%=basePath%>activity/js/jquery-1.11.1.min.js"></script>
<body style="overflow-y: auto;" >
	<div id="htmlCode">
	<c:choose>
		<c:when test="${empty activityList}">
	           <div class="none"><img src="<%=basePath%>activity/images/none.png" alt=""></div>
	       	</c:when>
       	<c:otherwise>
			<c:forEach items="${activityList }" var="act">
				<section class="">
					<a href="<%=basePath %>getActivityDetail?activityId=${act.ActivityID}&activityStatus=${activityStatus}&thirdpartyAccount=${thirdpartyAccount}">
						<div class="list">
							<div class="title">${act.ActivityName }</div>
							<div class="date">${fn:length(act.StartTime)>10 ? fn:substring(act.StartTime,0,10):act.StartTime}${fn:length(act.StartTime)>10? '':''}</div>
							
							<c:choose>
								<c:when test="${act.ActivityType == 1}">
									<div class="type">
										<img src='<%=basePath%>activity/images/notice_icon.png' />
										<span>公告</span>
									</div>
								</c:when>
								<c:when test="${act.ActivityType == 2}">
									<div class="type">
										<img src="<%=basePath%>activity/images/phone_icon.png" />
										<span>电话会议</span>
									</div>
								</c:when>
								<c:when test="${act.ActivityType == 3}">
									<div class="type">
										<img src="<%=basePath%>activity/images/net_icon.png" />
										<span>网络直播</span>
									</div>
								</c:when>
								<c:when test="${act.ActivityType == 4}">
									<div class="type">
										<img src="<%=basePath%>activity/images/phone_net.png" />
										<span>电话&网络</span>
									</div>
								</c:when>
								<c:when test="${act.ActivityType == 5}">
									<div class="type">
										<img src="<%=basePath%>activity/images/address.png" />
										<span>${act.Address }</span>
									</div>
								</c:when>
							</c:choose>	
							<div class="content">${act.Description }</div>
						</div>
				</a>
				</section>
			</c:forEach>
		</c:otherwise>
		</c:choose>
	</div>
	<div id="loadMore">
		<a href="javascript:void(0);" onclick="loadActivity();">获取更多</a>
	</div>
	<div id="noMore" hidden>
		<span>没有更多活动</span>
	</div>
	<input type="hidden" id="pageIndex" value="${pageIndex }">
	<input type="hidden" id="pageCount" value="${pageCount }">
	<input type="hidden" id="thirdpartyAccount" value="${thirdpartyAccount }">
</body>
	<script type="text/javascript">
	
	$(function(){
		 var pageIndex = $("#pageIndex").val();
		  var pageCount = $("#pageCount").val(); 
		  if(pageIndex>1){
			  $("#pageIndex").val(1);
		  }else if(pageCount<=1){
			  $("#loadMore").hide();
			  $("#noMore").hide();
		  }
	  });
	
	function loadActivity(){
		var pageIndex = $("#pageIndex").val();
		var thirdpartyAccount = $("#thirdpartyAccount").val();
		$.ajax({
			type : "get",//无此配置，提交中文乱码
			cache : false,
			beforeSend:function(){
				$("#loadMore a").attr("disabled",true);
			},
			url : "${pageContext.request.contextPath}/getMoreActivityList?activityStatus=2&pageIndex="+pageIndex+"&origin=1&thirdpartyAccount="+thirdpartyAccount,
			dataType : "json",
			success : function(data) {
				if(data.Result.Status == 200){
					var pageCount = $("#pageCount").val(); 
					var curPageIndex = data.Result.pageIndex;
					
					if(pageCount<=curPageIndex){
						$("#loadMore").hide();
						$("#noMore").show();
					}else{
						$("#loadMore a").attr("disabled",false);
					}
					$("#htmlCode").append(data.Result.Message);
					$("#pageIndex").val(curPageIndex);
				}else{
					alert(data.Result.Message);
				}
			}
		});
	}
</script>
</html>