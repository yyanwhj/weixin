package com.weixin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.weixin.entity.AccessToken;
import com.weixin.entity.Button;
import com.weixin.entity.CommonButton;
import com.weixin.entity.ComplexButton;
import com.weixin.entity.Menu;
import com.weixin.util.WeixinUtil;
@Controller
@RequestMapping("menu")
public class MenuController {
	
	public static void main(String[] args) {
		String jsonMenu = JSONObject.toJSONString(getMenu()); 
		System.out.println(jsonMenu);
		// 第三方用户唯一凭证  
		final String APPID = WeixinUtil.getAppID();  
		// 第三方用户唯一凭证密钥  
		final String APP_SECRET = WeixinUtil.getAppSecret();  
		// 调用接口获取access_token  
        AccessToken at = WeixinUtil.getAccessToken();  
        if (null != at) {  
            // 调用接口创建菜单  
            int result = WeixinUtil.createMenu(getMenu(), at.getToken());  
  
            // 判断菜单创建结果  
            if (0 == result)  
                System.out.println("成功");
            else  
            	System.out.println("菜单创建失败，错误码：" + result);  
        }  
//		System.out.println("oVmZMtyvN0sfP-Eew4YLJb5r4uvk".length());
	}
  
    /** 
     * 组装菜单数据 
     *  
     * @return 
     */  
    private static Menu getMenu() {  
        CommonButton consulteOnline = new CommonButton();  
        consulteOnline.setName("线上咨询");  
        consulteOnline.setType("click");  
        consulteOnline.setKey("CONSULTE_ONLINE");
  
        CommonButton consulTelephone = new CommonButton();  
        consulTelephone.setName("电话咨询");  
        consulTelephone.setType("click");  
        consulTelephone.setKey("CONSULTE_TELEPHONE");
        
        CommonButton askedQeustions = new CommonButton();  
        askedQeustions.setName("常见问题");  
        askedQeustions.setType("view");  
        askedQeustions.setUrl("http://weixin.ixinzang.com/askedQuestions");
  
        CommonButton ownKnown = new CommonButton();  
        ownKnown.setName("术后天天知");  
        ownKnown.setType("click");  
        ownKnown.setKey("OWN_KNOW");
  
        CommonButton ownRehabilitationEncyclopedia = new CommonButton();  
        ownRehabilitationEncyclopedia.setName("康复百科");  
        ownRehabilitationEncyclopedia.setType("view");  
        ownRehabilitationEncyclopedia.setUrl("http://weixin.ixinzang.com/book/book1.jsp");
        
        CommonButton pasmRehabilitationEncyclopedia = new CommonButton();  
        pasmRehabilitationEncyclopedia.setName("同心百科");  
        pasmRehabilitationEncyclopedia.setType("view");  
        pasmRehabilitationEncyclopedia.setUrl("http://weixin.ixinzang.com/getArticleList");
  

        CommonButton userAPPDownload = new CommonButton();  
        userAPPDownload.setName("公众版APP下载");  
        userAPPDownload.setType("view");  
        userAPPDownload.setUrl("http://weixin.ixinzang.com/activity/download_user.jsp");
        
        CommonButton doctorAPPDownload = new CommonButton();  
        doctorAPPDownload.setName("医生版APP下载");  
        doctorAPPDownload.setType("view");  
        doctorAPPDownload.setUrl("http://weixin.ixinzang.com/activity/download_doctor.jsp");
        
        CommonButton appIntroduce = new CommonButton();  
        appIntroduce.setName("APP介绍");  
        appIntroduce.setType("view");  
        appIntroduce.setUrl("http://weixin.ixinzang.com/activity/pasmapp_intro.jsp");
        
        CommonButton appVideo = new CommonButton();  
        appVideo.setName("宣传片");  
        appVideo.setType("view");  
        appVideo.setUrl("http://v.qq.com/boke/page/z/0/b/z0156yc3fxb.html ");
        
        CommonButton lotteryActivity = new CommonButton();
        lotteryActivity.setName("抽奖活动");  
        lotteryActivity.setType("click");  
        lotteryActivity.setKey("LOTTERY_ACTIVITY");
        
        CommonButton integralActivity = new CommonButton();
        integralActivity.setName("积分活动");
        integralActivity.setType("view");
        integralActivity.setUrl("http://weixin.ixinzang.com/activity/intrgral_activity.jsp");
        
        CommonButton swingActivity = new CommonButton();
        swingActivity.setName("转盘活动");
        swingActivity.setType("view");
        swingActivity.setUrl("http://weixin.ixinzang.com/activity/swing_activity.jsp");
        
        CommonButton activity = new CommonButton();
		activity.setName("医学讲座");
		activity.setType("click");
		activity.setKey("ACTIVITY");
		
		CommonButton medicalConsultation = new CommonButton();
		medicalConsultation.setName("医学咨询");
		medicalConsultation.setType("click");
		medicalConsultation.setKey("MEDICAL_CONSULTATION");
		
		ComplexButton rehabilitationssistant = new ComplexButton();
		rehabilitationssistant.setName("康复助手");
		rehabilitationssistant.setSub_button(new Button[]{ownKnown,activity,ownRehabilitationEncyclopedia,pasmRehabilitationEncyclopedia,medicalConsultation});
		
		
		ComplexButton dowload = new ComplexButton();
		dowload.setName("APP下载");
		dowload.setSub_button(new CommonButton[]{userAPPDownload,doctorAPPDownload,appIntroduce,appVideo});
		
		ComplexButton activityArea = new ComplexButton();
		activityArea.setName("活动专区");
		activityArea.setSub_button(new CommonButton[]{lotteryActivity,integralActivity,swingActivity});
    	/** 
         * 这是公众号xiaoqrobot目前的菜单结构，每个一级菜单都有二级菜单项<br> 
         *  
         * 在某个一级菜单下没有二级菜单的情况，menu该如何定义呢？<br> 
         * 比如，第三个一级菜单项不是“更多体验”，而直接是“幽默笑话”，那么menu应该这样定义：<br> 
         * menu.setButton(new Button[] { mainBtn1, mainBtn2, btn33 }); 
         */  
        Menu menu = new Menu();  
        menu.setButton(new Button[] { rehabilitationssistant, dowload, activityArea });  
  
        return menu;  
    }  

}
