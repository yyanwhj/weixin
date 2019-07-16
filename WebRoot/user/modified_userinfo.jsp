<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="../common/taglib.jsp"%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>用户信息</title>
	<meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>css/weui.min.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/select2.css"/>
	<script type="text/javascript" src="<%=basePath %>activity/js/jquery-1.11.1.min.js"></script>
	<style>
		div.weui_cell:before{right:0;width:auto;}
		label.weui_label{width:5em;}
		.select2-choice{height:30px !important;line-height:30px !important;}
		.required::before{content:'*';color:red;position:absolute;margin-left:-8px;margin-top:3px;}
		div.select2-container .select2-choice > .select2-chosen{font-size:16px !important;}
	</style>	
</head>
<body>
<form id="form" action="">
<input type="hidden" value="${UserID }" name="UserID" id="UserID">
<input type="hidden" value="${OpenID }" name="OpenID" id="OpenID">

    <div class="weui_cell">
     	<div class="weui_cell_hd"><label class="weui_label required" for="TrueName">姓名</label></div>
        <div class="weui_cell_bd weui_cell_primary">
          <input class="weui_input" type="text" placeholder="请输入姓名" name="TrueName" id="TrueName" value="${DetailInfo.TrueName }" />
        </div>           
    </div>	          
	<div class="weui_cell weui_cell_select weui_select_after">
				<div class="weui_cell_hd"><label class="weui_label required">手术类型</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <select class="weui_select" name="Instrument" id="Instrument" >
                        <option value="">请选择</option>
                        <option value="0" <c:if test='${DetailInfo.Instrument== 0}'> selected="selected" </c:if>>无</option>
						<option value="1" <c:if test='${DetailInfo.Instrument== 1}'> selected="selected" </c:if>>冠脉支架</option>
						<option value="2" <c:if test='${DetailInfo.Instrument== 2}'> selected="selected" </c:if>>起搏器</option>
						<option value="3" <c:if test='${DetailInfo.Instrument== 3}'> selected="selected" </c:if>>瓣膜</option>
						<option value="4"<c:if test='${DetailInfo.Instrument== 4}'> selected="selected" </c:if>>封堵器</option>
						<option value="5"<c:if test='${DetailInfo.Instrument== 5}'> selected="selected" </c:if>>冠脉造影</option>
						<option value="6"<c:if test='${DetailInfo.Instrument== 6}'> selected="selected" </c:if>>球囊扩张</option>
						<option value="7"<c:if test='${DetailInfo.Instrument== 7}'> selected="selected" </c:if>>射频消融</option>
						<option value="8"<c:if test='${DetailInfo.Instrument== 8}'> selected="selected" </c:if>>心脏搭桥</option>
                    </select>
                </div>                
    </div>
    <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label required">手术时间</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <c:if test='${DetailInfo.Instrument== 0}'>
                    	<input class="weui_input" type="date" id="SurgicalTime" name="SurgicalTime" readonly="readonly"/>
                    </c:if>
                    <c:if test='${DetailInfo.Instrument!= 0}'>
                    	<input class="weui_input" type="date" id="SurgicalTime" name="SurgicalTime" value="${DetailInfo.SurgicalTime}"/>
                    </c:if>
                </div>
   </div>
   
   <div class="weui_cell">
		<div class="weui_cell_hd"><label class="weui_label required">所在地区</label></div>		
                    <div class="location clearfix" style="height:90px; margin-left:10px">
					    <select id="loc_province" style="width:100%;height:30px"></select>
					    <select id="loc_city" style="width:100%;height:30px"></select>
					    <select id="loc_town" style="width:100%;height:30px"></select>
					</div>			
			<input type="hidden" name="AreaID" id="AreaID" value="${DetailInfo.AreaID }"/>
	</div>	
	
	<div class="weui_cell">
		<div class="weui_cell_hd"><label class="weui_label required" for="Street">详细地址</label></div>
		<div class="weui_cell_bd weui_cell_primary">
              <textarea oninput="showWordAmount(this)" class="weui_textarea" placeholder="请输入详细地址" rows="3" name="Street" id="Street"  style="padding:0px;">${DetailInfo.Street }</textarea>
              <div class="weui_textarea_counter"><span>0</span>/200</div>
       </div>       
	</div>
	
	<div class="weui_cell" style="display:none">
		<div class="weui_cells_tips"></div>
	</div>
	 <div class="weui_cell">
     	<div class="weui_cell_hd"><label class="weui_label" for="ZipCode">邮政编码</label></div>
        <div class="weui_cell_bd weui_cell_primary">
          <input class="weui_input" type="text" placeholder="请输入邮政编码" name=ZipCode id="ZipCode" value="${DetailInfo.ZipCode }" />
        </div>           
    </div>	  
       
	 <div class="weui_cell">
     	<div class="weui_cell_hd"><label class="weui_label required" for="Phone">联系电话</label></div>
        <div class="weui_cell_bd weui_cell_primary">
          <input class="weui_input" type="tel" placeholder="请输入联系电话" name="Phone" id="Phone" value="${ DetailInfo.Phone}" />
        </div>           
    </div>
    
    <div class="weui_toptips weui_warn js_tooltips"></div>	
	<div class="weui_btn_area">
            <a class="weui_btn weui_btn_primary" href="javascript:" id="showTooltips" onclick="form_submit();">保存</a>
    </div>
</form>
	<!--BEGIN toast-->
    <div id="toast" style="display: none;">
        <div class="weui_mask_transparent"></div>
        <div class="weui_toast">
            <i class="weui_icon_toast"></i>
            <p class="weui_toast_content">已完成</p>
        </div>
    </div>
    <!--end toast-->
    
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
<script type="text/javascript" src="<%=path %>/js/common.js"></script>    
<script type="text/javascript" src="<%=path %>/js/modified_userinfo.js"></script>
<!-- 实现三级联动 -->
<script type="text/javascript" src="<%=path %>/js/area.js"></script>
<script type="text/javascript" src="https://www.ixinzang.com/weixin/location.js"></script>
<script type="text/javascript" src="https://www.ixinzang.com/weixin/select2.js"></script>
<script type="text/javascript" src="<%=path %>/js/select2_locale_zh-CN.js"></script>
<script type="text/javascript">  
   $(function(){
	   showWordAmount($("#Street")[0]);
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
</body>
</html>

