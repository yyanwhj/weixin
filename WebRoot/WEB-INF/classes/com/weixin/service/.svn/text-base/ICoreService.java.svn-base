package com.weixin.service;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public interface ICoreService {
	 public String processRequest(HttpServletRequest request);
	 
	 public String montageHTML(JSONArray list,Integer activityStatus,String thirdpartyAccount,Integer origin);
	 
	 public String checkAccountIsBind(String thirdPartyAccount);
	 
	 public JSONObject checkAccountHasMedicalHistory(String userId);
	 
	 public Integer fromToday(String surgicalTime);
	 
	 public Integer daysToWeek(Integer days);
	 
	 public String montageInstitutionHTML(JSONArray list);
	 
	 public String montageArticleHTML(JSONArray list);
}
