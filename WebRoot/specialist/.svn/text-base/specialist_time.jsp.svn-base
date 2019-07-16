<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../common/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>预约医生</title>
        <meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
        <meta content="yes" name="apple-mobile-web-app-capable">
        <meta content="black" name="apple-mobile-web-app-status-bar-style">
        <meta content="telephone=no" name="format-detection">
        <link rel="stylesheet" href="<%=basePath %>specialist/css/base.css" />
        <link rel="stylesheet" href="<%=basePath %>specialist/css/specialist.css" />
        <script type="text/javascript" src="<%=basePath %>js/jquery-1.11.1.min.js"></script>
    	<script src="<%=basePath %>js/layer3.1/layer.js"></script>
    </head>
    
    <body style="background-color:#f4f4f4;">
        <input type="hidden" value="${SpecialistDetail.HospitalID}" id="HospitalID" />
        <input type="hidden" value="${SpecialistDetail.DepartmentID}" id="DepartmentID" />
        <div class="so-wrap so-doctor">
        	<img src="${SpecialistDetail.Avatar}">
        	<dl>
        		<dt>${SpecialistDetail.DoctorName}</dt>
        		<dd>${SpecialistDetail.JobTitle}</dd>
        		<dd>${SpecialistDetail.HospitalName}${SpecialistDetail.DepartmentName}</dd>
        	</dl>
        </div>
        <p class="so-wrap so-good">擅长及主治：${SpecialistDetail.Skill}</p>
        <p class="so-wrap so-price">视频咨询：<span>￥${SpecialistDetail.Price}/${SpecialistDetail.ServiceMinutes}分钟</span></p>
        <div class="so-wrap so-time clearfix">
        	<h4>预约时间</h4>
        	<ul id="ScheduleList"></ul>
        	<input type="button" value="上午" class="so-btn-time" data-id="" data-price="" />
        	<input type="button" value="下午" class="so-btn-time" data-id="" data-price="" />
        	<input type="hidden" value="" id="ScheduleID" />
        	<input type="hidden" value="" id="Price" />
        	<input type="hidden" value="" id="ScheduleDate" />
        </div>
        <button type="button" class="so-btn-submit" onclick="submitAppointment()">立即预约</button>
        <script type="text/javascript">
        //console.log(${SpecialistDetail});
        //console.log(${ScheduleList});
        
        //初始化排班
        var ScheduleList = ${ScheduleList};
        var ScheduleHtml = "";
        for(var i=0; i<ScheduleList.length; i=i+2){
        	var am   = ScheduleList[i].AppointmentStatus;
        	var pm   = ScheduleList[i+1].AppointmentStatus;
        	var date = ScheduleList[i].ScheduleDate
        	var month = Number(date.split("-")[1]);
        	var day = Number(date.split("-")[2]);
	        	
        	if(am=="1" || pm=="1"){
        		ScheduleHtml += '<li class="usable"><span>可约</span>';
        	}else{
        		ScheduleHtml += '<li><span>不可约</span>';
        	}
        	if(i == 0){
        		ScheduleHtml += '<span class="so-date today">今天</span>';
        	}else{
	        	ScheduleHtml += '<span>'+ month +'月<br><i class="so-date">'+ day +'</i></span>';
        	}
        	
        	ScheduleHtml += '</li>';
        }
        $("#ScheduleList").html(ScheduleHtml);
        
        //选择预约日期
        $(document).on("touchstart","#ScheduleList li",function(){
        	$(".so-btn-time").removeClass("usable").removeClass("active");
        	$(this).addClass("active").siblings().removeClass("active");
        	$("#ScheduleID").val(""); //上下午置空。
        	var index = ($(this).index())*2;
        	var am   = ScheduleList[index].AppointmentStatus;
        	var pm   = ScheduleList[index+1].AppointmentStatus;
        	var amID = ScheduleList[index].ScheduleID;
        	var pmID = ScheduleList[index+1].ScheduleID;
        	var amPrice = ScheduleList[index].Price;
        	var pmPrice = ScheduleList[index+1].Price;
        	$("#ScheduleDate").val(ScheduleList[index].ScheduleDate);
        	if(am == "1"){
        		$(".so-btn-time").eq(0).addClass("usable");
        	}
        	if(pm == "1"){
        		$(".so-btn-time").eq(1).addClass("usable");
        	}
        	if(am == "1" || pm == "1"){
        		$(".so-btn-submit").addClass("active");
        	}else{
        		$(".so-btn-submit").removeClass("active");
        	}
        	$(".so-btn-time").eq(0).attr("data-id",amID).attr("data-price",amPrice);
        	$(".so-btn-time").eq(1).attr("data-id",pmID).attr("data-price",pmPrice);
        });
        $(document).on("click",".so-btn-time.usable",function(){
        	$(this).addClass("active").siblings().removeClass("active");
        	$("#ScheduleID").val($(this).attr("data-id"));
        	$("#Price").val($(this).attr("data-price"));
        });
        
        //立即预约
        function submitAppointment(){
        	var ScheduleID = $("#ScheduleID").val();
        	var Price = $("#Price").val();
        	
        	if(ScheduleID==""){
        		layer.msg("请选择预约时间");
        		return false;
        	}
        	var pasm = {};
        	pasm.HospitalID = $("#HospitalID").val();
        	pasm.DepartmentID = $("#DepartmentID").val();
        	pasm.TransferHospitalTime = $("#ScheduleDate").val();
        	pasm.Price = Price;
        	pasm.ScheduleID = ScheduleID; 
        	$.post("ajax/submitAppointment",pasm,function(result){
				//console.log(result);
				if(result.Status == "200"){
					window.location.href="orderCheckout?order_id="+result.DetailInfo.OrderID;
				}else{
					layer.msg(result.Message);
				}
			})
        }
        </script>
    </body>
</html>