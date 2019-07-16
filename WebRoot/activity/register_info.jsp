<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>注册——填写信息</title>
	<meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">

    <link rel="stylesheet" href="<%=basePath %>activity/css/base.css">
	<link rel="stylesheet" href="<%=basePath %>activity/css/register_info.css">
	<script type="text/javascript" src="<%=basePath %>activity/js/jquery-1.11.1.min.js"></script>

			<!-- easyui -->
	<script type="text/javascript">
	$(function(){
		$("#error").hide();
		
		$(".info2,.hospital").hide();
		$("section.link2").click(function(){
			$(".bg").show();
			$(".info2").show();
		});
		$("#submit_history").click(function(){
			var PreviousHistory = '';
			var PreviousText = '';
			$('input[name="illness"]:checked').each(function(){
				PreviousHistory +=$(this).val()+',';
				PreviousText += $(this).siblings("span").html()+',';
			});
			
			$("#PreviousHistory").val(PreviousHistory);
			$("#PreviousText").html(PreviousText);
			$(".bg").hide();
			$(".info2").hide();
		});

		$("section.link1").click(function(){
			$(".bg").show();
			$(".hospital").show();
		});
/* 		$(".hospital div ul li").click(function(){
			alert($(this).attr("target"));
			$(".bg").hide();
			$(".hospital").hide();
		}); */
		
		//复选框事件
		$(".history_info li input").each(function(){
		    $(this).click(function(){
		    	if($(this).val() == 'noillness' && $(this).is(':checked')){
		    		$(".history_info li input").each(function(){
		    			if($(this).val() != 'noillness' && $(this).is(':checked')){
		    				$(this).attr("checked",false);
		    			}
		    		});
		    	}else{
		    		$(".history_info li input[value='noillness']").attr("checked",false);
		    	}
		    }); 

		}); 
	});
	
	function loadInstitutionList(){
		var institutionName = $("#institutionName").val();
		$.ajax({
			type : "post",//无此配置，提交中文乱码
			cache : false,
			url : "${pageContext.request.contextPath}/getInstitutionList",
			data:{InstitutionName : institutionName },
			dataType : "json",
			success : function(data) {
				$("#dataStr ul").detach();
				if(data.Result.Status == 200){
					$("#dataStr").append(data.Result.Message);
				}else{
					$("#dataStr").append(data.Result.Message);
				}
			}
		});
	}
	function getInstitutionID(id){
		$("#InstitutionID").val(id);
		$("#showInstitutionName").html($("#"+id).html());
 		$(".bg").hide();
		$(".hospital").hide();
	}
	
	function form_submit(){
		$("#error").hide();
		$("#AreaID").val($("#loc_province").val());//给AreaID赋值
		var institutionID = $("#InstitutionID").val();
		if(institutionID == ''){
			$("#message").html("请选择就诊医院");
			$("#error").show();
			return;
		}
		var illness = $("#PreviousHistory").val();
		if(illness == ''){
			$("#message").html("请选择病史");
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
</head>
<body>
<div class="bg"></div>
<form id="form" action="">
<div class="info">
	<section class="clearfix link1">
		<div id="showInstitutionName">输入关键词选择就诊医院</div>
		<input type="hidden" value="" id="InstitutionID" name="InstitutionID" />
	</section>
	<section class="clearfix history link2">
		<div class="label" id="PreviousText">病史</div>
		<input type="hidden" value="" id="PreviousHistory" name="PreviousHistory"></input>
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
</div>

<div class="info2">
	<section class="history_info">
	<div class="title">病史</div>
	<ul>
		<li>
			<span class="name">冠心病</span>
			<input type="checkbox" name="illness" value="CoronaryHeartDisease">
		</li>
		<li>
			<span class="name">心肌梗塞</span>
			<input type="checkbox" name="illness" value="MyocardialInfarction">
		</li>
		<li>
			<span class="name">心衰</span>
			<input type="checkbox" name="illness" value="HeartFailure">
		</li>
		<li>
			<span class="name">粥样埃及硬化</span>
			<input type="checkbox" name="illness" value="Atherosclerosis">
		</li>
		<li>
			<span class="name">高血压</span>
			<input type="checkbox" name="illness" value="Hypertension">
		</li>
		<li>
			<span class="name">高血脂</span>
			<input type="checkbox" name="illness" value="Hyperlipidemia">
		</li>
		<li>
			<span class="name">高血糖</span>
			<input type="checkbox" name="illness" value="Hyperglycemia">
		</li>
		<li>
			<span class="name">无</span>
			<input type="checkbox" name="illness" value="noillness">
		</li>
	</ul>
	</section>
	<input type="hidden" name="thirdpartyAccount" id="thirdpartyAccount" value="${thirdpartyAccount }">
	<section class="clearfix" id="error">
			<span id="message" style="color: red;text-align: center;margin-left: 35%;"></span>
	</section>
	<section class="submit" style="margin-top:2em;">
		<a class="submit" id="submit_history" href="javascript:;">完成</a>
	</section>
</div>


	<section class="hospital">
		<div class="search"><input type="text" id="institutionName" placeholder="输入关键词搜索医院" onchange="loadInstitutionList()"></div>
		<div id="dataStr"></div>
	</section>
</form>
</div>
</body>
</html>
