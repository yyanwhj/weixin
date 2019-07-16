<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
    	<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width user-scalable=no" />
		<title>同心管家在线视频咨询</title>
		<script>
			var html=document.getElementsByTagName("html")[0];
			var width=html.getBoundingClientRect().width;
			html.style.fontSize=width/16+"px";
		</script>
		<link rel="stylesheet" href="activity/css/online_video_consult.css"/>
	</head>
	<body>
		<div class="content">
			<img src="activity/images/online_video_consult2.jpg"/>
			<input type="button" value="立即支付" class="payBtn"/>
		</div>
		<script src="js/jquery-1.11.1.min.js"></script>
		<script>
			$(".payBtn").on("click",function(){
				if (typeof WeixinJSBridge == "undefined"){
				   if( document.addEventListener ){
				       document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
				   }else if (document.attachEvent){
				       document.attachEvent('WeixinJSBridgeReady', onBridgeReady); 
				       document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
				   }
				}else{
				   onBridgeReady();
				}
			});
			
			function onBridgeReady(){
			   WeixinJSBridge.invoke(
			       'getBrandWCPayRequest', {
			           "appId":"${DetailInfo.AppID }",     //公众号名称，由商户传入     
			           "timeStamp":"${DetailInfo.Timestamp }",         //时间戳，自1970年以来的秒数     
			           "nonceStr":"${DetailInfo.Noncestr }", //随机串     
			           "package":"prepay_id="+"${DetailInfo.PrepayID }",     
			           "signType":"MD5",         //微信签名方式：     
			           "paySign":"${DetailInfo.Sign }" //微信签名 
			       },
			       function(res){
			           if(res.err_msg == "get_brand_wcpay_request:ok" ) {}     // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。 
			       }
			   ); 
			}
			
		</script>
	</body>
</html>
