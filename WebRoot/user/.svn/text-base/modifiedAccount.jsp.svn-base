<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>同心管家修改账户</title>    
	<meta content="" name="description">
	<meta content="" name="keywords">
	<meta charset="UTF-8">	
	<meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">
	<link rel="stylesheet" type="text/css" href="css/weui.min.css">
	<link rel="stylesheet" type="text/css" href="css/register.css">
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/modifiedAccount.js?time=20171114"></script>
	<script src="js/zepto.min.js"></script>   
  </head>
  
  <body>
   	<input type="hidden" id="OpenID" value="${ OpenID}">
    <input type="hidden" id="basePath" value="<%=basePath%>">
    
    <div class="mainpage">
	<div class="logoBox">
		<img src="images/logo.png" alt="同心管家">
		<div class="logohead">同心管家</div>
	</div>

	<div class="weui_cells weui_cells_form">
	    <div class="weui_cell weui_cell_select weui_select_before">
	        <div class="weui_cell_hd">
	            <select class="weui_select" name="select2">
	                <option value="1">+86</option>
	                <option value="2">+80</option>
	                <option value="3">+84</option>
	                <option value="4">+87</option>
	            </select>
	        </div>
	        <div class="weui_cell_bd weui_cell_primary">
	            <input class="weui_input" type="tel" placeholder="请输入号码" id="mobie" />
	        </div>
	        <div class="weui_cell_ft">
	            <i class="weui_icon_warn"></i>
	        </div>
	    </div>	    

		<div class="weui_cell">
	        <div class="weui_cell_hd"><label class="weui_label">验证码</label></div>
	        <div class="weui_cell_bd weui_cell_primary">
	            <input class="weui_input" type="number" placeholder="请输入验证码" id="Vcode" />
	        </div>
	        <div class="weui_cell_ft">
	            <i class="weui_icon_warn"></i>
	        </div>
	        <button class="weui_cell_getVcode">
	            获取验证码
	        </button>
	    </div> 
	</div>

	<div class="weui_cells_tips" style="display: none">底部说明文字底部说明文字</div>

	<div style="height:35px"></div>
	<div class="weui_btn_area">
	    <a class="weui_btn weui_btn_primary" href="javascript:" id="showTooltips">确定</a>
	</div>

	<!-- 验证码弹窗 -->
	<div class="weui_dialog_alert" id="dialog3" style="display: none;">
        <div class="weui_mask"></div>
        <div class="weui_dialog">
            <div class="weui_dialog_hd"><strong class="weui_dialog_title">请填写答案</strong></div>
            <input type="text" class="VerificationCodeInp" name="" id="VerificationCodeInp" value="" />
            <div class="VerificationCodeBox clearfix">
            	<iframe src="" width="140" height="30"></iframe>
            	<span>换一组</span>
            </div>
            <p class="prompting" style="display: none;"></p>
            <div class="weui_dialog_ft">
	            <a href="javascript:;" class="weui_btn_dialog default2">取消</a>
	            <a href="javascript:;" class="weui_btn_dialog" id="diaBtn3">确定</a>
	        </div>
        </div>
    </div>
	
	<!--BEGIN dialog1-->
    <div class="weui_dialog_confirm" id="dialog1" style="display: none;">
        <div class="weui_mask"></div>
        <div class="weui_dialog">
            <div class="weui_dialog_hd"><strong class="weui_dialog_title">温馨提示</strong></div>
            <div class="weui_dialog_bd" style="text-align:center"></div>
            <div class="weui_dialog_ft">
                <a href="javascript:;" class="weui_btn_dialog default">取消</a>
                <a href="javascript:;" class="weui_btn_dialog primary" id="diaBtn1">去注册</a>
            </div>
        </div>
    </div>
    <!--END dialog1-->
	
    <!--BEGIN dialog2-->
    <div class="weui_dialog_alert" id="dialog2" style="display: none;">
        <div class="weui_mask"></div>
        <div class="weui_dialog">
            <div class="weui_dialog_hd"><strong class="weui_dialog_title">温馨提示</strong></div>
            <div class="weui_dialog_bd"></div>
            <div class="weui_dialog_ft">
                <a class="weui_btn_dialog primary" id="diaBtn2">确定</a>
            </div>
        </div>
    </div>
    <!--END dialog2-->

	<!-- loading toast -->
    <div id="loadingToast" class="weui_loading_toast" style="display:none;">
        <div class="weui_mask_transparent"></div>
        <div class="weui_toast">
            <div class="weui_loading">
                <div class="weui_loading_leaf weui_loading_leaf_0"></div>
                <div class="weui_loading_leaf weui_loading_leaf_1"></div>
                <div class="weui_loading_leaf weui_loading_leaf_2"></div>
                <div class="weui_loading_leaf weui_loading_leaf_3"></div>
                <div class="weui_loading_leaf weui_loading_leaf_4"></div>
                <div class="weui_loading_leaf weui_loading_leaf_5"></div>
                <div class="weui_loading_leaf weui_loading_leaf_6"></div>
                <div class="weui_loading_leaf weui_loading_leaf_7"></div>
                <div class="weui_loading_leaf weui_loading_leaf_8"></div>
                <div class="weui_loading_leaf weui_loading_leaf_9"></div>
                <div class="weui_loading_leaf weui_loading_leaf_10"></div>
                <div class="weui_loading_leaf weui_loading_leaf_11"></div>
            </div>
            <p class="weui_toast_content">数据加载中</p>
        </div>
    </div>


    <div class="page">
	    <div class="weui_msg">
	        <div class="weui_icon_area"><i class="weui_icon_success weui_icon_msg"></i></div>
	        <div class="weui_text_area">
	            <h2 class="weui_msg_title">操作成功</h2>
	            <p class="weui_msg_desc"></p>
	        </div>
	         <div class="weui_opr_area">
	            <p class="weui_btn_area">
	                <a href="javascript:;" class="weui_btn weui_btn_primary getinfo">查看我的资料</a>	               
	            </p>
	        </div>	 
	        <div class="weui_opr_area">
	            <p class="weui_btn_area">
	                <a href="javascript:;" class="weui_btn weui_btn_primary">更换手机号</a>	               
	            </p>
	        </div>	        
	    </div>
	</div>         
</div>	
    
  <script>
$(function(){
	$(".getinfo").on("tap",function(){
		window.location.href="user/modifieduserinfoinit?OpenID=${OpenID}";
	});
	
});
</script>    
    
    
  </body>
</html>
