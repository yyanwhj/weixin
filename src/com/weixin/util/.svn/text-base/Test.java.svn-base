package com.weixin.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.util.Properties;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.weixin.entity.response.NewsMessage;


public class Test {
	
	private final String GET_LOTTERY_ACTIVITY = "article/getArticleList2";
	public static void main(String[] args) throws Exception {
		String url = "order/changeOrderStatus";	
//		String json = "{\"LoginID\":\"13241591181\",\"BaiduChannelID\":\"null\",\"DeviceID\":\"2\",\"DeviceSN\":\"99000554176489\",\"OSVersion\":\"4.4.4\",\"Password\":\"e10adc3949ba59abbe56e057f20f883e\",\"BaiduUserID\":\"null\",\"ApplicationID\":\"13\",\"DeviceModel\":\"MI 4C\"}";
		String json=    "{\"OrderID\":\"3\",\"WorkerID\":1,\"Note\":\"12345\",\"DeviceID\":\"1\",\"LoginToken\":\"8a7221a4-df35-48df-833c-790c489a0222\",\"OrderStatus\":\"15\",\"ApplicationID\":\"17\"}";




		
		JSONObject resultObject=AbuttUtil.getResponseJSON(url, json);
		System.out.println("=============result:"+resultObject);
		
	}
	
	public NewsMessage getLotteryActivity(String fromUserName,String toUserName){
		try{
			JSONObject articleParam = new JSONObject();
			articleParam.put("DeviceID", 1);
			articleParam.put("ApplicationID", 4);
			articleParam.put("ACIDList", 11);
			articleParam.put("PageIndex", 1);
			articleParam.put("PageSize",5);
			articleParam.put("LinkTargetType", 2);
			articleParam.put("RefreshTime", new Date());
			JSONObject resultObject = AbuttUtil.getResponseJSON(GET_LOTTERY_ACTIVITY, articleParam.toJSONString());
			System.out.println("=============result:"+resultObject);
			int status = resultObject.getIntValue("Status");
			if(status == 200){
				//添加分页
				Integer dataCount=resultObject.getJSONObject("DetailInfo").getInteger("DataCount");
				JSONArray responseArray =  resultObject.getJSONArray("ListInfo");
				//return encasedActivity(fromUserName, toUserName, dataCount, responseArray);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
}
