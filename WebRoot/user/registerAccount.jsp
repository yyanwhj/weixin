<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../common/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>

   <base href="<%=basePath%>">
   <title>同心管家注册</title>
	<meta content="" name="description">
	<meta content="" name="keywords">
	<meta charset="UTF-8">	
	<meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">
	<link rel="stylesheet" type="text/css" href="css/weui.min.css">
	<link rel="stylesheet" type="text/css" href="css/register.css?time=20171113">	
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/zepto.min.js"></script>	
</head>
<body>
<div class="mainpage">
    <input type="hidden" id="OpenID" value="${ OpenID}">
    <input type="hidden" id="ActionType" value="${ ActionType}">
    <input type="hidden" id="link" value="${ link}">
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
	        <div class="weui_cell_hd"><label class="weui_label">密码</label></div>
	        <div class="weui_cell_bd weui_cell_primary">
	            <input class="weui_input" type="password" placeholder="请输入密码" id="pwd" />
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

	<div class="weui_cells_tips">该手机号和密码可用于登录同心管家app</div>

	<div class="weui_cells weui_cells_checkbox">
	    <label class="weui_cell weui_check_label" for="s11">
	        <div class="weui_cell_hd">
	            <input type="checkbox" class="weui_check" name="checkbox1" id="s11" checked="checked">
	            <i class="weui_icon_checked"></i>
	        </div>
	        <div class="weui_cell_bd weui_cell_primary">
	            <p>我已阅读并同意<a href="user/NonResponsibility.html" title="用户协议"><font color="#04be02">用户协议</font></a></p>
	        </div>
	    </label>            
	</div>
	<div class="weui_btn_area">
	    <a class="weui_btn weui_btn_primary" href="javascript:" id="showTooltips">确定</a>
	</div>

	<div class="weui_btn_link"><a><span>已注册，直接绑定</span></a></div> 
	
	<!--BEGIN dialog1-->
    <div class="weui_dialog_confirm" id="dialog1" style="display: none;">
        <div class="weui_mask"></div>
        <div class="weui_dialog">
            <div class="weui_dialog_hd"><strong class="weui_dialog_title">温馨提示</strong></div>
            <div class="weui_dialog_bd" style="text-align:center"></div>
            <div class="weui_dialog_ft">
                <a href="javascript:;" class="weui_btn_dialog default">取消</a>
                <a href="javascript:;" class="weui_btn_dialog primary" id="diaBtn1">去绑定</a>
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
	            <h2 class="weui_msg_title">操作完成</h2>
	            <p class="weui_msg_desc"></p>
	        </div>
	        <div class="weui_opr_area">
	            <p class="weui_btn_area">
	                <a href="javascript:;" class="weui_btn weui_btn_primary">确定</a>	                
	            </p>
	        </div>
	        <!-- <div class="weui_extra_area">
	            <a href="">查看详情</a>
	        </div> -->
	    </div>
	</div>         
</div>	
</body>
<script src="js/register.js??time=20171113"></script>
</html>