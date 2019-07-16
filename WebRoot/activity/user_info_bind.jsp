<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../common/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>增加病史</title>
	<meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">
    <link rel="stylesheet" href="<%=basePath%>activity/css/base.css">
	<link rel="stylesheet" href="<%=basePath%>activity/css/register_info.css">
	
	<script type="text/javascript" src="<%=basePath%>activity/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>activity/js/autopoint.js"></script>
	<link href="<%=basePath %>activity/css/select2.css" rel="stylesheet"/>
	
	<style type="text/css">
		.dropDiv {
		    background-color: #FFFFFF;
		    position: absolute;
		    z-index: 10;
		    display: none;
		    cursor: hand;
		    border:1px solid #7F9DB9;
		     margin-top:2%;
		}
		
		.dropDiv .jhover {
		    background-color: #D5E2FF;
		}
		.dropDiv .list {
		    float:left;
		    width:100%;
		    padding:2%;
		}
		.dropDiv .word {
			z-index: 11;
			float:left;
		}
		
		.dropDiv .view {
			float:right;
			color: gray;
			text-align: right;
			font-size: 1em;
		}
	</style>
</head>
<body>
	<form id="form" action="">
		<section class="clearfix">
			<div class="label">就诊医院</div>
			<div class="data">
				<input type="hidden" value="" id="HospitalID" name="HospitalID" />
				<input type="text" class="easyui-validatebox" placeholder="请输入关键字.." size="22" id="HospitalName" name="HospitalName" value="" autocomplete="off">
			</div>
		</section>
		<section class="clearfix">
			<div class="label">病史</div>
			<div class="data">
				<select name="illness" id="illness" multiple>
					<option value="CoronaryHeartDisease">冠心病</option>
					<option value="MyocardialInfarction">心肌梗塞</option>
					<option value="HeartFailure">心衰</option>
					<option value="Atherosclerosis">粥样动脉硬化</option>
					<option value="Hypertension">高血压</option>
					<option value="Hyperlipidemia">高血脂</option>
					<option value="Hyperglycemia">高血糖</option>
				</select>
				<input type="hidden" value="" id="PreviousHistory" name="PreviousHistory"></input>
			</div>
		</section>
		<section class="clearfix">
			<div class="label">手术类型</div>
			<div class="data">
				<select name="Instrument" id="Instrument" class="easyui-validatebox">
					<option value="">-请选择-</option>
					<option value="1">冠脉支架</option>
					<option value="2">起搏器</option>
					<option value="3">瓣膜</option>
					<option value="4">封堵器</option>
				</select>
			</div>
		</section>
		<section class="clearfix">
			<div class="label">手术时间</div>
			<div class="data">
				<input type="date" name="SurgicalTime" id="SurgicalTime" value="" />
			</div>
		</section>
		<section class="clearfix">
			<div class="label">所在地区</div>
			<div class="data">
				<select id="loc_province">
					<option value="">省份</option><option value="1">北京市</option><option value="22">天津市</option><option value="44">上海市</option><option value="66">重庆市</option><option value="108">河北省</option><option value="406">山西省</option><option value="622">内蒙古</option>
					<option value="804">辽宁省</option><option value="945">吉林省</option><option value="1036">黑龙江省</option><option value="1226">江苏省</option><option value="1371">浙江省</option><option value="1500">安徽省</option><option value="1679">福建省</option><option value="1812">江西省</option>
					<option value="1992">山东省</option><option value="2197">河南省</option><option value="2456">湖北省</option><option value="2613">湖南省</option><option value="2822">广东省</option><option value="3015">广西省</option><option value="3201">海南省</option><option value="3235">四川省</option>
					<option value="3561">贵州省</option><option value="3728">云南省</option><option value="3983">西藏</option><option value="4136">陕西省</option><option value="4334">甘肃省</option><option value="4499">青海省</option><option value="4588">宁夏</option><option value="4624">新疆</option>
					<option value="4802">香港</option><option value="4822">澳门</option><option value="4825">台湾省</option>
				</select>
				<input id="AreaID" type="hidden" name="AreaID" value="" />
			</div>
		</section>
		<section class="clearfix">
			<div class="label">详细地址</div>
			<div class="data">
				<input type="url" name="Street" id="Street"/>
			</div>
		</section>
		<section class="clearfix" id="error">
			<span id="message" style="color: red;text-align: center;margin-left: 35%;"></span>
		</section>
		<section class="submit">
			<a href="javascript:void(0);" onclick="form_submit();">完成</a>
		</section>
		<input type="hidden" name="thirdpartyAccount" id="thirdpartyAccount" value="${thirdpartyAccount }">
	</form>
</body>
<script type="text/javascript">
$(function(){
	$("#error").hide();
});

$(function(){
	var hospitalName = $("#HospitalName").val();
	var ul_height=$(".med_history ul").height();
	$(".med_history").height(ul_height);
	$(window).resize(function(){
		var ul_height=$(".med_history ul").height();
		$(".med_history").height(ul_height);
	});
	$("#HospitalName").autopoint({url:'<%=basePath%>getHospitalList?hospitalName='+hospitalName});
});
function form_submit(){
	$("#AreaID").val($('#loc_province').val());//给AreaID赋值
	$("#error").hide();
	var illness = '';
	$("#illness option:selected").each(function(){
        illness = illness + $(this).val()+",";
    });
	if(illness == ''){
		$("#message").html("请选择病史");
		$("#error").show();
		return;
	}
	$("#PreviousHistory").val(illness);
	var hospital = $("#hospital").val();
	if(hospital == ''){
		$("#message").html("请选择就诊医院");
		$("#error").show();
		return;
	}
	var instrument = $("#Instrument").val();
	if(instrument == ''){
		$("#message").html("请选择手术类型");
		$("#error").show();
		return;
	}
	var surgicalTime = $("#SurgicalTime").val();
	if(surgicalTime == ''){
		$("#message").html("请选择手术日期");
		$("#error").show();
		return;
	}
	
	var d1 = new Date(surgicalTime.replace(/\-/g, "\/"));
	var d2 = new Date();
	if(d1 > d2){
		$("#message").html("手术日期不能大于今天");
		$("#error").show();
		return;
	}
	var areaId = $("#AreaID").val();
	if(areaId == ''){
		$("#message").html("请选择所在地");
		$("#error").show();
		return;
	}
	var street = $("#Street").val();
	if(street == ''){
		$("#message").html("请填写详细地址");
		$("#error").show();
		return;
	}
		
	$.ajax( {
		type : "post",//无此配置，提交中文乱码
		cache : false,
		url : "${pageContext.request.contextPath}/bindUserInfo",
		dataType : "json",
		data : ($("#form").serializeArray()),
		success : function(data) {
			if(data.Result.Status == 200){
				var thirdpartyAccount = $("#thirdpartyAccount").val();
				window.location.href = '<%=basePath%>everydayKnown?thirdpartyAccount='+thirdpartyAccount;
			}else{
				alert(data.Result.Message);
			}
		}
	});
}
</script>
</html>
