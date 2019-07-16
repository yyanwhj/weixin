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
	<link rel="stylesheet" type="text/css" href="css/register.css?time=20171114">	
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/select2.css"/>
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/zepto.min.js"></script>
	<style>
		div.weui_cell:before{right:0;width:auto;}
		label.weui_label{width:5em;}
		.select2-choice{height:30px !important;line-height:30px !important;}
		.required::before{content:'*';color:red;position:absolute;margin-left:-8px;margin-top:3px;}
		div.select2-container .select2-choice > .select2-chosen{font-size:16px !important;}
	</style>
</head>
<body>
<input type="hidden" id="basePath" value="<%=basePath%>">
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
	            <input class="weui_input" type="number" placeholder="请输入号码" id="mobie" />
	        </div>
	        <div class="weui_cell_ft">
	            <i class="weui_icon_warn"></i>
	        </div>
	    </div>

	    <div class="weui_cell">
	        <div class="weui_cell_hd"><label class="weui_label">密码</label></div>
	        <div class="weui_cell_bd weui_cell_primary">
	            <input class="weui_input" type="password" placeholder="请输入密码6-20位" id="pwd" />
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
	    
	    <div class="weui_cell">
	     	<div class="weui_cell_hd"><label class="weui_label required" for="TrueName">姓名</label></div>
	        <div class="weui_cell_bd weui_cell_primary">
	          <input class="weui_input" type="text" placeholder="请输入姓名" name="TrueName" id="TrueName" value="" />
	        </div>           
	    </div>	          
		<div class="weui_cell weui_cell_select weui_select_after">
			<div class="weui_cell_hd"><label class="weui_label required">手术类型</label></div>
               <div class="weui_cell_bd weui_cell_primary">
                   <select class="weui_select" name="Instrument" id="Instrument" >
                       <option value="">请选择</option>
                       <option value="0">无</option>
					<option value="1">冠脉支架</option>
					<option value="2">起搏器</option>
					<option value="3">瓣膜</option>
					<option value="4">封堵器</option>
					<option value="5">冠脉造影</option>
					<option value="6">球囊扩张</option>
					<option value="7">射频消融</option>
					<option value="8">心脏搭桥</option>
                   </select>
               </div>                
    	</div>
    	
    	<div class="weui_cell">
            <div class="weui_cell_hd"><label class="weui_label required">手术时间</label></div>
            <div class="weui_cell_bd weui_cell_primary">
                <input class="weui_input" type="date" id="SurgicalTime" name="SurgicalTime" value=""/>
            </div>
   		</div>
   
	   <!-- <div class="weui_cell">
			<div class="weui_cell_hd"><label class="weui_label required">所在地区</label></div>		
           	<div class="location clearfix" style="height:90px; margin-left:10px">
			    <select id="loc_province" style="width:100%;height:30px"></select>
			    <select id="loc_city" style="width:100%;height:30px"></select>
			    <select id="loc_town" style="width:100%;height:30px"></select>
			</div>			
			<input type="hidden" name="AreaID" id="AreaID" value=""/>
		</div>	
	
		<div class="weui_cell">
			<div class="weui_cell_hd"><label class="weui_label required" for="Street">详细地址</label></div>
			<div class="weui_cell_bd weui_cell_primary">
              <textarea oninput="showWordAmount(this)" class="weui_textarea" placeholder="请输入详细地址" rows="3" name="Street" id="Street"  style="padding:0px;"></textarea>
              <div class="weui_textarea_counter"><span>0</span>/200</div>
	       </div>       
		</div>
	
		<div class="weui_cell" style="display:none">
			<div class="weui_cells_tips"></div>
		</div>
		
		<div class="weui_cell">
	     	<div class="weui_cell_hd"><label class="weui_label" for="ZipCode">邮政编码</label></div>
	        <div class="weui_cell_bd weui_cell_primary">
	          <input class="weui_input" type="number" placeholder="请输入邮政编码" name=ZipCode id="ZipCode" value="" />
	        </div>       
	    </div>	  
       
		 <div class="weui_cell">
	     	<div class="weui_cell_hd"><label class="weui_label required" for="Phone">联系电话</label></div>
	        <div class="weui_cell_bd weui_cell_primary">
	          <input class="weui_input" type="number" placeholder="请输入联系电话" name="Phone" id="Phone" value="" />
	        </div>           
	    </div> -->
	    <!-- <div class="weui_toptips weui_warn js_tooltips"></div>	 -->
	    
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
<script type="text/javascript" src="<%=path %>/js/common.js"></script>
<script src="js/register2.js?time=20171114_2"></script>
<%-- <script type="text/javascript" src="<%=path %>/js/modified_userinfo.js"></script> --%>
<!-- 实现三级联动 -->
<script type="text/javascript" src="<%=path %>/js/area.js"></script>
<script type="text/javascript" src="https://www.ixinzang.com/weixin/location.js"></script>
<script type="text/javascript" src="https://www.ixinzang.com/weixin/select2.js"></script>
<script type="text/javascript" src="<%=path %>/js/select2_locale_zh-CN.js"></script>
<script type="text/javascript">  
   $(function(){
	   //所在区域
	   var areaID='${ DetailInfo.AreaPath}';
	   var provinceID=areaID.split(",")[1];
	   var cityID=areaID.split(",")[2];
	   var townID='${DetailInfo.AreaID}';	   
	  	
	   if(cityID){
    	   $("#loc_province").val(provinceID);
    	   $("#loc_province").change();             	   
    	   $("#loc_city").val(cityID);
    	   $("#loc_city").change();  
    	   $("#loc_town").val(townID);
    	   $("#loc_town").change();  
       }else if(provinceID){
    	   $("#loc_province").val(provinceID);
    	   $("#loc_province").change(); 
    	   $("#loc_city").val(townID);
    	   $("#loc_city").change();
       }else if(townID){
    	   $("#loc_province").val(townID);
		   $("#loc_province").change();
       }		   
   })
</script>
</html>