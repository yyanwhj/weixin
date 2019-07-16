/**
 * 弹出框，需要引入layer.js
 * @param p_msg1
 */
function alertCommonBox(p_msg1){
	window.index=layer.open({
		  type: 1,
		  title: false,
		  closeBtn: 1,	  
		  shadeClose: true,
		  content: '<div class="cancle_box"><p>'+p_msg1+'</p><div class="btns">'
		 +'<a href="javascript:layer.close(index);">确定</a></div></div>'
		});
}

/**
 * 输入汉字、数字、字母和
 * @param checkVal
 */
function checkStandardVal(checkVal){
	var Reg = /[^\a-\z\A-\Z0-9\u4E00-\u9FA5\.\(\)\（\）\。\？\?\“\”\，\！\!]/g;
	if(Reg.test(checkVal)){
		return true;
	}else{
		return false;
	}
}

/**
 * input、textarea等输入内容
 * 显示字数
 */
function showWordAmount(event){
	var wordAmount=$(event).val().length;		
	if(wordAmount>200){
		$(event).val($(event).val().substring(0,200));
		wordAmount=$(event).val().length;	
	}
	$(event).next().find("span").text(wordAmount);
}

/**
 * 获取cookie值
 * 
 */
function getCookie(c_name){
	if (document.cookie.length>0)
	  {
	  c_start=document.cookie.indexOf(c_name + "=")
	  if (c_start!=-1)
	    { 
	    c_start=c_start + c_name.length+1 
	    c_end=document.cookie.indexOf(";",c_start)
	    if (c_end==-1) c_end=document.cookie.length
	    return unescape(document.cookie.substring(c_start,c_end))
	    } 
	  }
	return ""
}