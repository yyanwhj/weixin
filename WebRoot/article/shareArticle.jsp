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
         <title>同心百科</title>
        <meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
        <meta content="yes" name="apple-mobile-web-app-capable">
        <meta content="black" name="apple-mobile-web-app-status-bar-style">
        <meta content="telephone=no" name="format-detection">
        <script type="text/javascript" src="<%=basePath %>activity/js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="<%=basePath %>js/jweixin-1.0.0.js"></script>
        
        <link rel="stylesheet" href="<%=basePath %>article/css/base.css" />
        <link rel="stylesheet" href="<%=basePath %>article/css/article_list.css" />
        <style>
        	#htmlCode{
        		padding-bottom:40px;
        	}
        	.more a{
        		position:fixed;
        		width:100%;
        		left:0;
        		bottom:0;
        		background:#04be02;
        		color:#fff;
        	}
        </style>
    </head>
    <body>
	   我的分享网页
    </body>
    <script type="text/javascript">
    $(function(){
    	loadShareArgument();
    });
    
    function loadShareArgument(){
    	
    	$.ajax({
    		url:"http://hrxloeogwv.proxy.qqbrowser.cc/pasm_weixin/third/getJsApiArguments",
    		data:{shareURL:"http://hrxloeogwv.proxy.qqbrowser.cc/pasm_weixin/third/getSharePage"},
    		success:function(rsData){
    			
    			if(rsData!=null){
    				//初始化微信
    				wx.config({
    			        debug: false,
    			        appId: rsData.Result.appId,
    			        timestamp: rsData.Result.timestamp,
    			        nonceStr: rsData.Result.nonceStr,
    			        signature: rsData.Result.signature,
    			        jsApiList: [
    			            // 所有要调用的 API 都要加到这个列表中
    			            'checkJsApi',
    			            'onMenuShareTimeline',
    			            'onMenuShareAppMessage'
    			          ]
    			    });
    				
    				
    				wx.ready(function(){
    					//alert("微信JS ready");
    					wx.onMenuShareTimeline({
      			          title: "我的测试分享",
      			          link: "http://hrxloeogwv.proxy.qqbrowser.cc/pasm_weixin/third/getSharePage",
      			          imgUrl: "http://ixinzang.com/image/banner5.png",
      			          trigger: function (res) {
      			            // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
      			            // alert('用户点击分享到朋友圈');
      			          },
      			          success: function (res) {
      			            // alert('已分享');
      			          },
      			          cancel: function (res) {
      			            // alert('已取消');
      			          },
      			          fail: function (res) {
      			            // alert(JSON.stringify(res));
      			          }
      			        });
    					
    					wx.onMenuShareAppMessage({
        				    title: '我的测试分享', // 分享标题
        				    desc: '我的测试分享', // 分享描述
        				    link: 'http://hrxloeogwv.proxy.qqbrowser.cc/pasm_weixin/third/getSharePage', // 分享链接
        				    imgUrl: 'http://ixinzang.com/image/banner5.png', // 分享图标
        				    type: 'link', // 分享类型,music、video或link，不填默认为link
        				    dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
        				    success: function () { 
        				        // 用户确认分享后执行的回调函数
        				    },
        				    cancel: function () { 
        				        // 用户取消分享后执行的回调函数
        				    }
        				});
    					
    				});
    				
    				wx.error(function(res){
    					
    				    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
						//alert("微信JS错误 "+res);
    				});
    				
    				
    			}
    		},
    		error:function(){
    			
    		}
    	});
    }
    	
    </script>
</html>