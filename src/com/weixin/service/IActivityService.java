package com.weixin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IActivityService {
	
	public String getActivityList(HttpServletRequest request,Integer activityStatus,Integer pageIndex,HttpServletResponse response);

}
