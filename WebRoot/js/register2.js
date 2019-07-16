$(function(){
	var WIDTH=$(window).width();	
	pageMove(WIDTH);	
	var OpenID=$("#OpenID").val();
	var loadingToast=$(".weui_loading_toast");
	var ActionType=$("#ActionType").val();
	var link=$("#link").val();
	
	//详细地址
	//showWordAmount($("#Street")[0]);
	
	//获取验证码
	$("button.weui_cell_getVcode").on("click",function(event){
		event.preventDefault();	
		$("#diaBtn3").unbind();
		$(".VerificationCodeBox").unbind();
		$(".prompting").hide();
		var entireNumber=checkMobie();//带地区号的手机号
		var _this=this;
		if(entireNumber==false){
			return;
		}
		$("#dialog3 .VerificationCodeBox iframe").attr("src",$("#basePath").val()+"common/createVerificationCode.jsp?MobilePhone="+entireNumber);
		$("#VerificationCodeInp").val("");
		$("#dialog3").show();
		compatibilityIOS1();
		$("#diaBtn3").on("click",function(event){
			if($("#VerificationCodeInp").val() == ""){
				$(".prompting").text("请输入答案").show();
				return
			}
			compatibilityIOS2();
			$(".weui_cell_getVcode").attr('disabled',"true");
			var VerificationCode = $("#VerificationCodeInp").val();
			$.ajax({
				type:"GET",
				url:"user/sendRegisterCaptcha",
				data:"LoginID="+entireNumber+"&VerificationCode="+VerificationCode,
				dataType:"json",
				success:function(rs){
					if(rs.Status==200){
						loadingToast.hide();
						if(entireNumber){
							wait=60;
							time(_this);
						}
						
					}else if(rs.Status==102){
						loadingToast.hide();
						$("#dialog1").show();
						$("#dialog1 .weui_dialog_bd").text("账号已注册");
					}else if(rs.Status == 400){
						loadingToast.hide();
						showRegTip("发送频繁，请稍候再试！");
					}else{
						showRegTip(rs.Message);
					}
					$('.weui_cell_getVcode').removeAttr("disabled");
				},
				error:function(){
					loadingToast.hide();
					showRegTip("请求失败");
					$('.weui_cell_getVcode').removeAttr("disabled");
				},
				beforeSend:function(){
					$('.weui_cell_getVcode').removeAttr("disabled");
					/*loadingToast.show();*/
				}
			});
			$("#dialog3").hide();
		});
		$(".VerificationCodeBox").on("click",function(){
			$("#dialog3 .VerificationCodeBox iframe").attr("src",$("#basePath").val()+"common/createVerificationCode.jsp?MobilePhone="+entireNumber);
		})
	});

	$(".weui_dialog_ft a.default2").on("click",function(event){
		event.preventDefault();		
		$('#dialog3').hide();
		$('.weui_cell_getVcode').removeAttr("disabled");
		compatibilityIOS2();
	});
	
	$("#pwd,#Vcode").focus(function(){
		checkMobie();
		$("#dialog2").hide();
	});

	$("#pwd").blur(function(){
		checkPwd();
		$("#dialog2").hide();
	});
	
	//去绑定
	$(".weui_dialog_ft a#diaBtn1").on("tap",function(event){
		event.preventDefault();
		window.location.href="user/toBindAccountDirc?OpenID="+OpenID+"&ActionType="+ActionType;
		$('#dialog1').hide();	
	});
	
	//取消
	$(".weui_dialog_ft a.default").on("click",function(event){
		event.preventDefault();		
		$('#dialog1').hide();	
	});
	
	//温馨提示确定btn
	$(".weui_dialog_ft a#diaBtn2").on("click",function(event){
		event.preventDefault();	
		$('#dialog2').hide();	
	});
	
	//手术类型为‘无’时
	$("#Instrument").change(function(){
		if($(this).val() == 0){
			$("#SurgicalTime").val("").attr("readonly","readonly");
		}else{
			$("#SurgicalTime").removeAttr("readonly");
		}
	});

	//注册确定按钮
	$("#showTooltips").on("tap",function(event){
		event.preventDefault();		
		var regObj = {
				LoginID      : checkMobie(),
				Password     : checkPwd(),
				CAPTCHA      : $("#Vcode").val(),
				TrueName     : $("#TrueName").val(),
				Instrument   : $("#Instrument").val(),
				SurgicalTime : $("#SurgicalTime").val(),
				AreaID       : $("#loc_town").val(),
				Street       : $("#Street").val(),
				ZipCode      : $("#ZipCode").val(),
				Phone        : $("#Phone").val()
		}
		var todayTime=Date.parse(new Date());
		var Spechars = new RegExp("[~'!@#$%^&*()-+_=:]");
		var ZipCodeText= /^\d{6}$/;
		
		if(!$("#s11")[0].checked){
			showRegTip("请勾选“我已阅读并同意用户协议”");
			return false;
		}else if(!checkMobie()){
			return false;
		}else if(!checkPwd()){
			return false;
		}else if(regObj.CAPTCHA == ''){
			showRegTip("请输入验证码");
			return false;
		}else if(regObj.TrueName == ''){
			showRegTip("请填写姓名");
			return false;
		}else if(regObj.TrueName.length>45){
			showRegTip("姓名长度不能超过45个字符");
			return false;
		}else if(regObj.Instrument == ''){
			showRegTip("请选择手术类型");
			return false;
		}else if(regObj.Instrument!=0){
			if(!regObj.SurgicalTime){
				showRegTip("请填写手术时间");
				return false;
			}
			if(Date.parse(new Date(regObj.SurgicalTime))>todayTime){
				showRegTip("手术日期不能大于今天");
				return false;
			}
		}/*else if(regObj.AreaID == ''){
			showRegTip("请选择所在地");
			return false;				
		}else if(regObj.Street == ''){
			showRegTip("请填写详细地址");
			return false;		
		}else if(regObj.Street.length<4 || regObj.Street.length>200){
			showRegTip("详细地址不能少于四个字且不能超过二百字");
			return false;
		}else if(Spechars.test(regObj.Street)){
			showRegTip("详细地址中不能包含特殊字符");
			return false;
		}else if(regObj.ZipCode!='' && !ZipCodeText.test(regObj.ZipCode)){
			showRegTip("请填写正确的邮政编码");
			return false;
		}else if(regObj.Phone == ''){
			showRegTip("请填写联系电话");
			return false;
		}else if(regObj.Phone.length>15){
			showRegTip("电话号码不能超过15位");
			return false;
		}*/
		
		$.ajax({
			type:"POST",
			url:"user/register2",
			data:{'regObj':JSON.stringify(regObj)},
			dataType:"json",
			success:function(rs){
				if(rs.Status==200){
					//注册成功
					if(link==""){//
						/*$(".page").show();
						$(".page .weui_msg_desc").text("注册成功并成功绑定"+ regObj.LoginID);
						setTimeout(function(){
							addTransition(0.5);		
							pageMove(0);
						},1);*/
						loadingToast.hide();
						window.location.href="../user/toBindAccountDirc?OpenID="+OpenID;	//跳转到指定的路径
					}else{
						window.location.href=link;	//跳转到指定的路径
					}
				}else if(rs.Status==102){
					showRegTip("账号已注册");
					loadingToast.hide();
				}else if(rs.Status==117){
					showRegTip("该微信账号已绑定手机号");
					loadingToast.hide();
				}else if(rs.Status==109){
					showRegTip("验证码错误或者过期");
					loadingToast.hide();
				}else{
					showRegTip("注册失败");
					loadingToast.hide();
				}
			},
			error:function(){
				showRegTip("请求失败");
				loadingToast.hide();
			},
			beforeSend:function(){
				loadingToast.show();
			}
		});		
	});

	//已注册直接去绑定
	$(".weui_btn_link").on("tap",function(){
		window.location.href="user/toBindAccountDirc?OpenID="+OpenID+"&ActionType=1";
		
	});

	$(".page .weui_btn_primary").on("tap",function(){			
		window.location.href="user/modifieduserinfoinit?OpenID="+OpenID;
	});

});

var wait=0;
function time(o) {  
	if (wait == 0) {  
		o.removeAttribute("disabled");            
		o.innerHTML="获取验证码";  
		wait = 60;  
	} else {  
		o.setAttribute("disabled", true);  
		o.innerHTML= wait + "s";  
		wait--;  
		setTimeout(function() {  
			time(o);  
		},  
		1000);  
	}  
}

function checkMobie(){
	var mobieNumber=$("#mobie").val();
	var mobieAreaNumber=$(".weui_select option:selected").text();
	if(mobieNumber==""){
		showRegTip("请输入手机号");
		$("#mobie").parent().parent().find(".weui_icon_warn").show();
		return false;
	}else if(!/^[0-9]{11}$/.test(mobieNumber)){
		showRegTip("请输入正确的手机号");
		$("#mobie").parent().parent().find(".weui_icon_warn").show();
		return false;
	}else{
		$("#mobie").parent().parent().find(".weui_icon_warn").hide();		
		return mobieNumber;
	}
}

function checkPwd(){
	var passWord=$("#pwd").val();	
	if(passWord==""){
		showRegTip("请输入密码");
		$("#pwd").parent().parent().find(".weui_icon_warn").show();
		return false;
	}else if(passWord.length<6){
		showRegTip("密码最少6位");
		$("#pwd").parent().parent().find(".weui_icon_warn").show();
		return false;
	}else{
		$("#pwd").parent().parent().find(".weui_icon_warn").hide();		
		return passWord;
	}
}

function pageMove(x_distance){	
	$(".page").css({
			"transform":"translateX("+x_distance+"px)",
			"-webkit-transform":"translateX("+x_distance+"px)",
			"-moz-transform":"translateX("+x_distance+"px)",
			"-ms-transform":"translateX("+x_distance+"px)",
			"-o-transform":"translateX("+x_distance+"px)"
	});
}
function addTransition(time){
	$(".page").css({
			"transition":"all "+time+"s",
			"-webkit-transition":"all "+time+"s",
			"-moz-transition":"all "+time+"s",
			"-ms-transition":"all "+time+"s",
			"-o-transition":"all "+time+"s"
	});
}

function showRegTip(tip){
	$("#dialog2").show();
	$("#dialog2 .weui_dialog_bd").text(tip);
}

/*IOS光标交融问题*/
function compatibilityIOS1(){
	$("body").css({
		"position": "fixed",
		"width": "100%"
	})
}
function compatibilityIOS2(){
	$("body").css({
		"position": "relative"
	})
}



//验证手机号
/*function cheakMobile(){
	var LoginID = $("#telephone").val();
	$.ajax({
		type:"GET",
		url:"<%=basePath %>user/checkMobilePhoneIsAvailable",
		data:"LoginID="+LoginID,
		dataType:"json",
		success:function(rs){
			if(rs.Status==200){
				//如果手机没找到，提示需要注册
			}else{
				$("#dialog2").show();
				$("#dialog2 .weui_dialog_bd").text("手机号已经注册过");				
			}
		},
		error:function(){
			$("#dialog2").show();
			$("#dialog2 .weui_dialog_bd").text("请求失败");			
		}
	});
}*/