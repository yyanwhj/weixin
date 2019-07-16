	//提示
	function showTooltip(text,time){
		var setTime=time || 2;
		$(".js_tooltips").text(text);
		$(".js_tooltips").show();
		setTimeout(function(){
			$(".js_tooltips").hide();
		},setTime*1000);
	}
	
	//手术类型为‘无’时
	$("#Instrument").change(function(){
		if($(this).val() == 0){
			$("#SurgicalTime").val("").attr("readonly","readonly");
		}else{
			$("#SurgicalTime").removeAttr("readonly");
		}
	});
	
	//保存信息
	function form_submit(){
		$("#AreaID").val($("#loc_province").val());//给AreaID赋值
		if($('#loc_province').val() != null && $('#loc_province').val() != ''){
			$("#AreaID").val($('#loc_province').val());
		}
		if($('#loc_city').val() != null && $('#loc_city').val() != ''){
			$("#AreaID").val($('#loc_city').val());
		}
		if($('#loc_town').val() != null && $('#loc_town').val() != ''){
			$("#AreaID").val($('#loc_town').val());
		}		
		
		var TrueName=$("#TrueName").val();		
		var pattern = new RegExp("[~'!@#$%^&*()-+_=:]"); 	
		 
		if(TrueName == '' || TrueName == null){
			showTooltip("请填写姓名");	
			$("#TrueName").focus();
			return false;	
		}else if(TrueName.length >45){
			showTooltip("姓名长度不能超过45个字符");
			$("#TrueName").focus();
			return false;	
		}else if(pattern.test(TrueName)){
			showTooltip("姓名中不能包含特殊字符");	
			$("#TrueName").val("");  
            $("#TrueName").focus();
            return false;	
		}
		
		var instrument = $("#Instrument").val();
		if(instrument == ''){
			showTooltip("请选择手术类型");			
			return false;
		}
		var surgicalTime =Date.parse(new Date($("#SurgicalTime").val()));
		var todayTime=Date.parse(new Date());
		$("#SurgicalTime").removeAttr("disabled");
		if(instrument!=0){          //手术不为‘无’
			if(!surgicalTime){
				showTooltip("请填写手术日期");			
				return false;			
			}else if(surgicalTime>todayTime){
				showTooltip("手术日期不能大于今天");			
				return false;
			}
		}
		
		if($("#loc_province").val() == ''|| $("#loc_city").val() =='' || $("#loc_town").val() == ''){
			showTooltip("请选择所在地");			
			return false;				
		}
		var street = $("#Street").val();
		if(street == ''){
			showTooltip("请填写详细地址");
			$("#Street").focus();
			return false;		
		}else if(street.length<4){
			showTooltip("详细地址不能少于四个字");
			$("#Street").focus();
			return false;	
		}else if(street.length>200){
			showTooltip("详细地址不能超过二百字");
			$("#Street").focus();
			return false;	
		}else if(pattern.test(street)){
			showTooltip("详细地址中不能包含特殊字符");
			$("#Street").focus();
			return false;
		}		
		var ZipCodeText= /^\d{6}$/;
		
		var ZipCode = $("#ZipCode").val();
		if(ZipCode != '' && !ZipCodeText.test(ZipCode)){
			showTooltip("请填写正确的邮政编码");
			$("#ZipCode").focus();
			return false;			
		}
		
		var Phone = $("#Phone").val();
		if(Phone == ''){
			showTooltip("请填写联系电话");
			$("#Phone").focus();
			return false;			
		}else if(Phone.length>15){
			showTooltip("电话号码不能超过15位");	
			$("#Phone").focus();
			return false;
		}
		
		var OpenID=$("#OpenID").val();
		$.ajax( {
			type : "post",//无此配置，提交中文乱码
			cache : false,
			url : "../user/modifiedUserInfo",
			dataType : "json",
			data : ($("#form").serializeArray()),
			success : function(data) {
				if(data.Status == 100){
					$(".weui_loading_toast").hide();
					showTooltip(data.Result.Message);	
				}
				if(data.Status == 200){
					$(".weui_loading_toast").hide();
					$("#toast").show();
					setTimeout(function(){
						window.location.href = '../user/modifieduserinfoinit?OpenID='+OpenID;
					},1000);					
				}else{
					$(".weui_loading_toast").hide();
					showTooltip(data.Result.Message);					
				}
			},
			error:function(){
				$(".weui_loading_toast").hide();				
				showTooltip("请求失败");
			},
			beforeSend:function(){
				$(".weui_loading_toast").show();
			}
		});
	}
	