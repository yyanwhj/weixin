$(function(){
	var WIDTH=$(window).width();	
	pageMove(WIDTH);
	var OpenID=$("#OpenID").val();
	var ActionType=$("#ActionType").val();
	var link=$("#link").val();
	
	//用户绑定获取验证码
	$("button.weui_cell_getVcode").on("click",function(event){
		event.preventDefault();	
		$("#diaBtn3").unbind();
		$(".VerificationCodeBox").unbind();
		$(".prompting").hide();
		var _this=this;
		var entireNumber=checkMobie();//带地区号的手机号
		if(entireNumber==false){
			return;
		}		
		$("#dialog3 .VerificationCodeBox iframe").attr("src",$("#basePath").val()+"common/createVerificationCode.jsp?MobilePhone="+entireNumber);
		//验证手机号是否注册过
		$.ajax({
			type:"GET",
			url:"user/checkMobilePhoneIsAvailable",
			data:"LoginID="+entireNumber,
			dataType:"json",
			success:function(rs){
				if(rs.Status==200){//如果手机没找到，提示需要注册
					$("#dialog1").show();
					$("#dialog1 .weui_dialog_bd").text("手机号还没注册");					 
					$(".weui_loading_toast").hide();					
				}else{//发送验证码
					$("#VerificationCodeInp").val("");
					$("#dialog3").show();
					$("#diaBtn3").on("click",function(event){
						var VerificationCode = $("#VerificationCodeInp").val();
						if(VerificationCode == ""){
							$(".prompting").text("请输入答案").show();
							return
						}else{
							$(".prompting").hide();
							if(entireNumber){
								sendSMS(entireNumber,VerificationCode,_this);
							}
						}
					});
					$(".weui_loading_toast").hide ();
				}
			},
			error:function(){
				$("#dialog2").show();
				$("#dialog2 .weui_dialog_bd").text("请求失败");
			},
			beforeSend:function(){
				$(".weui_loading_toast").show();
			}
			
		});
		$(".VerificationCodeBox").on("click",function(){
			$("#dialog3 .VerificationCodeBox iframe").attr("src",$("#basePath").val()+"common/createVerificationCode.jsp?MobilePhone="+entireNumber);
		})
	});
    
	$(".weui_dialog_ft a.default2").on("click",function(event){
		event.preventDefault();		
		$('#dialog3').hide();	
	});
	
	
	$("#Vcode").focus(function(){
		checkMobie();
		$("#dialog2").hide();
	});
	
	$(".weui_dialog_ft a#diaBtn1").on("click",function(event){
		event.preventDefault();
		window.location.href="user/toRegister?OpenID="+OpenID+"&ActionType="+ActionType+"&link="+link;
		$('#dialog1').hide();	
	});
	
	$(".weui_dialog_ft a.default").on("click",function(event){
		event.preventDefault();		
		$('#dialog1').hide();	
	});

	$(".weui_dialog_ft a#diaBtn2").on("click",function(event){
		event.preventDefault();	
		$('#dialog2').hide();	
	});

	
	//确定
	$("#showTooltips").on("tap",function(event){
		event.preventDefault();		
		
		var entireNumber=checkMobie();
		if(!checkMobie()){
			return false;
		}		
		var Vcode=$("#Vcode").val();
		if(!Vcode){
			$("#dialog2").show();
			$("#dialog2 .weui_dialog_bd").text("请输入验证码");
			$("#Vcode").parent().parent().find(".weui_icon_warn").show();
			return false;
		}else{
			$("#Vcode").parent().parent().find(".weui_icon_warn").hide();
		}				
		
		$.ajax({
			type:"GET",
			url:"user/bindWeChatAccount",
			data:"LoginID="+entireNumber+"&Captcha="+Vcode+"&ActionType="+ActionType+"&OpenID="+OpenID,
			success:function(rs){
				if(rs.Status==109){
					$("#dialog2").show();
					$("#dialog2 .weui_dialog_bd").text("验证码错误或者过期");
					$(".weui_loading_toast").hide ();
				}else if(rs.Status==200){
					//如果绑定成功		
					if(link==""){//
						$(".weui_loading_toast").hide ();
						$(".page").show();
						$(".page .weui_msg_desc").text("微信已与"+ entireNumber +"成功绑定");
						setTimeout(function(){
							addTransition(0.5);		
							pageMove(0);
						},1);
					}else{
						window.location.href=link;	//跳转到指定的路径
					}
					
				}else if(rs.Status==106){
					//账户为注册跳转注册
					$("#dialog1").show();
					$("#dialog1 .weui_dialog_bd").text("用户不存在");					 
					$(".weui_loading_toast").hide ();
				}else if(rs.Status==117){
					$("#dialog2").show();
					$("#dialog2 .weui_dialog_bd").text("你已经绑定过用户");
					$(".weui_loading_toast").hide ();
				}else if(rs.Status==118){
					$("#dialog2").show();
					$("#dialog2 .weui_dialog_bd").text("该手机号已经绑定过其它微信");
					$(".weui_loading_toast").hide ();
				}else{
					$("#dialog2").show();
					$("#dialog2 .weui_dialog_bd").text("绑定失败");
					$(".weui_loading_toast").hide ();
				}
			},
			error:function(){
				$("#dialog2").show();
				$("#dialog2 .weui_dialog_bd").text("请求失败");
				$(".weui_loading_toast").hide ();
			},
			beforeSend:function(){
				$(".weui_loading_toast").show();
			}
		});
		//setTimeout(function(){$(".weui_loading_toast").hide ();},2000);
				
	});

	//注册绑定
	$(".weui_btn_link").on("click",function(){
		window.location.href="user/toRegister?OpenID="+OpenID+"&ActionType="+ActionType+"&link="+link;		
	});
	
	//更换绑定账户
	$(".page .weui_btn_primary").on("tap",function(){
		window.location.href="user/toModifiedBindAccount?OpenID="+OpenID;
	});
});

//发送绑定用户验证码
function sendSMS(LoginID,VerificationCode,ele){
	$.ajax({
		type:"GET",
		url:"user/sendBindCAPTCHA",
		data:"LoginID="+LoginID+"&VerificationCode="+VerificationCode,
		success:function(rs){
			if(rs.Status == 200){
				wait=60;
				time(ele);
				$("#dialog3").hide();
			}if(rs.Status == 400){
				$("#dialog2").show();
				$("#dialog2 .weui_dialog_bd").text("发送频繁，请稍候再试！");
			}else{
				$("#dialog3").hide();
				$("#dialog2").show();
				$("#dialog2 .weui_dialog_bd").text(rs.Message);
			}
		},
		error:function(){
			$("#dialog2").show();
			$("#dialog2 .weui_dialog_bd").text("请求失败");
		}
	});
}
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
			time(o)  
		},  
		1000);  
	}  
}

function checkMobie(){
	var mobieNumber=$("#mobie").val();
	var mobieAreaNumber=$(".weui_select option:selected").text();
	if(mobieNumber==""){
		$("#dialog2").show();
		$("#dialog2 .weui_dialog_bd").text("请输入手机号");
		$("#mobie").parent().parent().find(".weui_icon_warn").show();
		return false;
	}else if(!/^[0-9]{11}$/.test(mobieNumber)){
		$("#dialog2").show();
		$("#dialog2 .weui_dialog_bd").text("请输入正确的手机号");
		$("#mobie").parent().parent().find(".weui_icon_warn").show();
		return false;
	}else{
		$("#mobie").parent().parent().find(".weui_icon_warn").hide();		
		return mobieNumber;
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