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
	<title>${activity.ActivityName }</title>
	<meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">

    <link rel="stylesheet" href="<%=basePath%>activity/css/base.css">
	<link rel="stylesheet" href="<%=basePath%>activity/css/header.css">
	<link rel="stylesheet" href="<%=basePath%>activity/css/details_activity.css">
	<link rel="stylesheet" type="text/css" href="css/weui.min.css">

	<script type="text/javascript" src="<%=basePath%>activity/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
		var origin = '';
		var activityType = '';
		var hasApply = '';
		var isApply = '';
		var userId = '';
		var activityStatus = '';
		$(function(){
			var width=$(window).width()*0.9;
			$("p").css({"max-width":width,"margin":"0 auto"});
			activityType = $("#activityType").val();
			origin = parseInt($("#origin").val());
			hasApply = parseInt($("#hasApply").val());
			isApply = $("#isApply").val();
			userId = $("#userId").val();
			activityStatus =  $("#activityStatus").val();
			if(origin == 3 && activityStatus == 1 && hasApply == 1){
				$("#my_cancel").show();
			}else if((activityStatus == 1 && origin == 3 && hasApply == 0) || ((isApply == true || isApply == 'True') && hasApply == 0)){
				$("#apply").show();
			}else if((isApply == true || isApply == 'True') && hasApply == 1){
				$("#finish").show();
			}else if((isApply == true || isApply == 'True') && activityStatus != 1){
				$("#nona").show();
			}
			
			
			//处理简介换行
			var resume = $("#ResumeSpan").html();
			resume=resume.replace(/\r\n/g,"<BR>\r\n");
			resume=resume.replace(/\n/g,"<BR>\r\n");  

			$("#ResumeSpan").html(resume);
		})
		
		
		
		function apply(){
			$.ajax({
				type : "post",//无此配置，提交中文乱码
				cache : false,
				url : "${pageContext.request.contextPath}/userApplyActivity",
				data:{
					activityId : <%=request.getParameter("activityId") %>,
					thirdpartyAccount : $("#thirdpartyAccount").val(),
					activityStatus : $("#activityStatus").val(),
					origin :  parseInt($("#origin").val())
				},
				dataType : "json",
				success : function(data) {
					if(data.Result.Status == "200"){
						if(origin == 3){
							$("#apply").hide();
							$("#my_cancel").show();
						}else{
							$("#apply").hide();
							$("#finish").show();
						}
					}else if(data.Result.Status == "404"){
						var thirdpartyAccount = $('#thirdpartyAccount').val();
						window.location.href = "<%=basePath%>bindUserUrl?link=" + data.Result.Message + "&thirdpartyAccount=" + thirdpartyAccount;
					}else{
						alert("报名失败，请稍后重试！");
					}
				}
			});
		}
	function cancel(){
		$.ajax({
			type : "get",//无此配置，提交中文乱码
			cache : false,
			url : "${pageContext.request.contextPath}/cencelApplyActivity?activityId=<%=request.getParameter("activityId") %>&activityStatus=<%=request.getParameter("activityStatus") %>&thirdpartyAccount=<%=request.getParameter("thirdpartyAccount") %>&origin=<%=request.getParameter("origin") %>",
			dataType : "json",
			success : function(data) {
				if(data.Result.Status == "200"){
					$("#apply").show();
					$("#my_cancel").hide();
				}else{
					alert("取消报名失败，请稍后重试。");
				}
			}
		});
	}
	</script>
</head>
<body>
	<input type="hidden" id="activityType" value="${activity.ActivityType }">
	<input type="hidden" id="activityEnrollType" value="${activity.EnrollType }">
	<input type="hidden" id="origin" value="${origin }">
	<input type="hidden" id="hasApply" value="${activity.HasApply }">
	<input type="hidden" id="isApply" value="${activity.IsApply }">
	<input type="hidden" id="userId" value="${userId }">
	<input type="hidden" id="activityStatus" value="${activityStatus }">
	<input type="hidden" id="thirdpartyAccount" value="${thirdpartyAccount }" style="width:80%">
	
	<section class="first">
	 <h4 class="theme">${activity.ActivityName }</h4>
	 <c:if test="${activity.ActivityType ne 1 }">
		<div class="clearfix">
			<p>主讲人：</p>
			<div class="doc_img">
				<c:if test="${activity.Avatar == '' }">
					<img src="<%=basePath %>activity/images/doc_default.png" />
				</c:if>
				<c:if test="${activity.Avatar != '' }">
					<img src="${activity.Avatar }" alt="">
				</c:if>
			</div>
				<div class="info">
					<div class="doc_name">
						<span>${activity.SpeakerName }</span>
						<span class="AttendingPhysician">${activity.JobTitle}</span>
					</div>
					<div class="doc_hosp">${activity.CompanyName }</div>
					<div class="doc_adept">
						<span class="cont" id="ResumeSpan">${activity.Resume }</span>
					</div>
					<i class="Open topBg"></i>
				</div>
		</div> 
		<div class="PlayMode">讲座时间: ${activity.ActivityTimeText}
				
		</div>
		<div class="PlayMode">播放方式: 
				<c:if test="${activity.ActivityType eq 1 }"></c:if>
				<c:if test="${activity.ActivityType eq 2}">电话会议</c:if>
				<c:if test="${activity.ActivityType eq 3}">网络直播</c:if>
				<c:if test="${activity.ActivityType eq 4}">电话&网络</c:if>
				<c:if test="${activity.ActivityType eq 5}">线下会议</c:if>
				<c:if test="${activity.ActivityType eq 6}">网络课堂</c:if>
		</div>
			
		</c:if>
				
		<div id="checkButton">
			<div class="cancel" id="my_cancel" hidden><a href="javascript:void(0);" onclick="cancel();">取消申请</a></div>
			<!-- <div class="btn" id="apply" hidden><a onclick="apply();" class="apply" href="javascript:void(0);">免费报名</a></div> -->
			<c:if test="${activity.ActivityType != 1}">
			<!-- 
				<div class="clearfix">
					<a href="getDoctorDetail?doctorId=${activity.DoctorID }">
					<div class="doc_img">
						<c:if test="${activity.Avatar == '' }">
							<img src="<%=basePath %>activity/images/doc_default.png" />
						</c:if>
						<c:if test="${doctor.Avatar != '' }">
							<img src="${activity.Avatar }" alt="">
						</c:if>
					</div>
					</a>
					<a href="getDoctorDetail?doctorId=${activity.DoctorID }">
						<div class="info">
							<div class="doc_name">
								<span>${activity.DoctorName }</span>
								<span>${activity.JobTitle }</span>
							</div>
							<div class="doc_hosp">${activity.HospitalName }</div>
							<div class="doc_adept">
								<span>擅长：</span>
								<span class="cont">${activity.Skill }</span>
							</div>
						</div>
					</a>
				</div> -->
				<!-- APP报名 -->
				<div class="btn" id="apply" hidden><a  class="apply weui_btn weui_btn_primary" href="<%=basePath%>activity/join_activity_app.jsp">报名参加</a></div> 
				
			</c:if>
			
         	<div class="status status_02" id="nona" hidden></div>
			<div class="btn" id="finish" hidden><a class="finish" href="javascript:void(0);">已申请</a></div>
		</div>
	</section>
	<article>
		<div class="art_cont">${activity.Content }</div>
	</article>
	<script>
	var onoff = true;
	$(".info").on("click",function(){
		if(onoff){
			$(".doc_adept").css("height","auto");
			$(".Open").removeClass("topBg");
			$(".Open").addClass("bottomBg");
		}else{
			$(".doc_adept").css("height","3em");
			$(".Open").removeClass("bottomBg");
			$(".Open").addClass("topBg");
		}
		onoff =!onoff
		return false
	})
	</script>
</body>
</html>