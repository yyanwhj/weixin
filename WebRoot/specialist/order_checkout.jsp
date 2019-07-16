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
        <title>订单</title>
        <meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
        <meta content="yes" name="apple-mobile-web-app-capable">
        <meta content="black" name="apple-mobile-web-app-status-bar-style">
        <meta content="telephone=no" name="format-detection">
        <link rel="stylesheet" href="<%=basePath %>specialist/css/base.css" />
        <link rel="stylesheet" href="<%=basePath %>specialist/css/specialist.css" />
        <script type="text/javascript" src="<%=basePath %>js/jquery-1.11.1.min.js"></script>
    	<script src="<%=basePath %>js/layer3.1/layer.js"></script>
    </head>
    
    <body style="padding-bottom:66px;background-color:#f4f4f4;">
        
        <ul class="oc-wrap">
        	<li>预约医生<p>${OrderDetail.DoctorName}</p></li>
        	<li>约诊时间
        		<p>
        		 	<fmt:parseDate value="${OrderDetail.ScheduleDate}" pattern="yyyy-MM-dd" var="ScheduleDate"></fmt:parseDate>
          			<fmt:formatDate value="${ScheduleDate}" pattern="yyyy-MM-dd" ></fmt:formatDate>
		        	<c:if test="${OrderDetail.DayPeriod == '1'}">上午</c:if>	
		        	<c:if test="${OrderDetail.DayPeriod == '2'}">下午</c:if>	
	        	</p>
        	</li>
        	<li>订单号<p id="OrderNumber">${OrderDetail.OrderNumber}</p></li>
        	<li>订单时间<p>${OrderDetail.RecordCreateTime}</p></li>
        	<li>用户姓名<p>${OrderDetail.TrueName}</p></li>
        </ul>
        <ul class="oc-wrap"> 
        	<li>联系电话<p id="MobilePhone" onclick="showTelBox()">${OrderDetail.MobilePhone}</p></li>
        </ul>	
        <p class="oc-tel-tip">请保持电话准确性，以便我们能第一时间联系到您</p>
        <ul class="oc-wrap">
        	<li>订单金额<p>￥<span id="Amount">${OrderDetail.Amount}</span></p></li>
        </ul>
        <div class="oc-money clearfix">
        	<p>实付款：<span>￥${OrderDetail.Amount}</span></p>
        	<button type="button" onclick="payOrder()">立即支付</button>
        </div>
        
        <script type="text/javascript">
    	//console.log(${OrderDetail});
    	//更改tel
    	function showTelBox(){
			layer.prompt({
				title: '修改手机号',
				value: $("#MobilePhone").text()
			},function(value, index, elem){
			  if(value.length<5 || value.length>20 || isNaN(value)){
			  	layer.msg("请输入正确的手机号");
			  	return false;
			  }
			  $("#MobilePhone").text(value);
			  layer.close(index);
			});
		}
		
		//点击支付
		var payPasm;
		function payOrder(){
			var pasm = {
				ProductPrice : $("#Amount").text(),
				OrderNumber : $("#OrderNumber").text()
			}
			//console.log(pasm);
			$.ajax({
				type:"POST",
				url:"ajax/specialistAppointmentPay",
				data:{'pasm':JSON.stringify(pasm)},
				dataType:"json",
				success:function(result){
					//console.log(result);
					if(result.Status == "200"){
						payPasm=result.DetailInfo;
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
						
					}
				}
			});	
		}
		
		//微信支付
		function onBridgeReady(){
			   WeixinJSBridge.invoke(
			       'getBrandWCPayRequest', {
			           "appId":payPasm.AppID,     //公众号名称，由商户传入     
			           "timeStamp":payPasm.Timestamp,         //时间戳，自1970年以来的秒数     
			           "nonceStr":payPasm.Noncestr, //随机串     
			           "package":"prepay_id="+payPasm.PrepayID,     
			           "signType":"MD5",         //微信签名方式：     
			           "paySign":payPasm.Sign //微信签名 
			       },
			       function(res){
			           if(res.err_msg == "get_brand_wcpay_request:ok" ) {
			        	   window.location.href="orderSuccess";
			           }// 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。 
			       }
			   ); 
			} 
    	</script>
    </body>
</html>