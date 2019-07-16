package com.weixin.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.weixin.service.IActivityService;
import com.weixin.util.AbuttUtil;
import com.weixin.util.Page;

@Service
public class ActivityServiceImpl implements IActivityService{
	
	private final String ACTIVITY_LIST = "osmsActivity/getActivityList";
	private final String USER_ACTIVITY_LIST = "osmsActivity/getUserActivityList";
	private final String ACTIVITY_DETAIL = "osmsActivity/getActivityDetail";
	private final String USER_APPLY_ACTIVITY="osmsActivity/userApplyActivity";
	private final String CANCEL_APPLY_ACTIVITY= "/osmsActivity/CancelApplyActivity";
	private final String DOCTOR_DETAIL = "/doctor/getDoctorProfile";
	@Override
	public String getActivityList(HttpServletRequest request,
			Integer activityStatus, Integer pageIndex,
			HttpServletResponse response) {
		String jsp = "";
		
		JSONObject param=new JSONObject();
		param.put("DeviceID", 4);
		param.put("ActivityStatus", activityStatus);
		param.put("PageIndex", pageIndex);
		param.put("PageSize",  5);
		JSONObject resultObject = AbuttUtil.getResponseJSON(ACTIVITY_LIST, param.toJSONString());
		int status = resultObject.getIntValue("Status");
		String errorMsg = resultObject.getString("Message");
		if(status == 200){
			//添加分页
			Integer dataCount=resultObject.getJSONObject("DetailInfo").getInteger("DataCount");
			String pageURL="activity/getActivityList?activityStatus="+activityStatus+"&pageIndex={0}";
			String page=Page.GetPagerSeo(pageIndex, dataCount, 5, pageURL, 5, false, true, "首页", "末页", "上一页", "下一页");
			request.setAttribute("page", page);
			request.setAttribute("activityStatus", activityStatus);
			
			JSONArray listInfo = resultObject.getJSONArray("ListInfo");
			request.setAttribute("activityList", listInfo);
			jsp = "activity/activity_list";
		}else{
			request.setAttribute("errorMsg", errorMsg);
			jsp="member/error";
		}
		return jsp;
	}

}
