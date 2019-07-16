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
		<title>支付成功-心电监护</title>
		<link rel="stylesheet" href="activity/css/base.css"/>
		<link rel="stylesheet" href="activity/css/ecg_monitoring_service.css"/>
		<script src="js/jquery-1.11.1.min.js"></script>
		<script src="<%=basePath %>js/layer3.1/layer.js"></script>
	</head>
	<body>
		<div class="ecg-wrapper ecg-success">
			<h3>支付成功</h3>
			<p>您已支付成功，请留下您的联系方式。<br>我们客服人员尽快联系您。</p>
			<input type="tel" placeholder="请输入您的联系方式" id="tel">
			<button type="submit" id="submitBtn">提交</button>
		</div>
		<script>
			function GetOrderNum() {   
			   var url = location.search; //获取url中"?"符后的字串   
			   var orderNum="";
			   if (url.indexOf("?") != -1) {   
			      var str = url.substr(1);   
			      strs = str.split("&");   
			      for(var i = 0; i < strs.length; i ++) {   
			         if(strs[i].split("=")[0] == "OrderNum"){
			         	orderNum = unescape(strs[i].split("=")[1]);
			         }
			      }   
			   }
			   return orderNum;
			}
			
			$("#submitBtn").click(function(){
				var tel = $("#tel").val();
				var orderNum = GetOrderNum();
				if(isNaN(tel) || tel.length<5 || tel.length>20){
					layer.msg("请输入正确的手机号码");
					return false;
				}
				if(orderNum == ""){
					layer.msg("订单号获取失败");
					return false;
				}
				
				$.post("pasmPay/updateOrderPhone",{MobilePhone:tel ,OrderNumber:orderNum},function(result){
					if(result.Status == "200"){
						layer.msg("稍后客服与您联系");
						setTimeout("WeixinJSBridge.call('closeWindow')",3000);
					}else{
						layer.msg("记录电话失败");
					}
				})
			});
		</script>
	</body>
</html>
