package com.weixin.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.ValueFilter;


/**
 * 对接公共方法
 * @author Lepu
 *
 */
public class AbuttUtil {
	private static Logger logger = Logger.getLogger(AbuttUtil.class);
	/**
	 * 请求接口
	 * @param path 接口地址
	 * @param params 接口参数字符串
	 * @return 返回 接口响应结果
	 * @author qinyitao
	 * @date 2014.10.10
	 */
	public static String HttpPostToServer(String path,String param) {
		String result="";
		try {
			logger.info("请求参数："+param+"   path:"+path);
			
			NameValuePair NameValuePair1  = new BasicNameValuePair("ht",param);
			
			HttpPost httpPost = new HttpPost(path);
			HttpClient httpClient =new DefaultHttpClient();
			
			List<NameValuePair> params = new ArrayList<NameValuePair>();
			params.add(NameValuePair1);
			
			httpPost.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
			HttpResponse response = httpClient.execute(httpPost);
			result = EntityUtils.toString(response.getEntity());
			
			logger.info("返回结果："+result);
		}  catch (IOException e) {
			e.printStackTrace();
		} 
		return result;
	}
	/**
	 * 请求接口
	 * @param path 接口地址
	 * @param params 接口参数列表
	 * @return 返回 接口响应结果
	 * @author qinyitao
	 * @date 2014.10.10
	 */
	public static String HttpPostToServer(String path,List<NameValuePair> params) {
		String result="";
		try {
			
			logger.info("请求参数："+params);
			HttpPost httpPost = new HttpPost(path);
			HttpClient httpClient =new DefaultHttpClient();

			httpPost.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
			HttpResponse response = httpClient.execute(httpPost);
			result = EntityUtils.toString(response.getEntity());
			logger.info("返回结果："+result);
		}  catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return result;
	}
	/**
	 * 用户使用
	 * 直接返回result的value对象
	 * @param path 接口地址
	 * @param param 请求参数JSON字符串
	 * @return Result的value对象
	 */
	public static JSONObject getResponseJSON(String path,String param){
		String result=HttpPostToServer(Constant.API_HOST+path, param);
		JSONObject jsonObject=JSONObject.parseObject(result);
		return jsonObject.getJSONObject("Result");}
	
	/**
	 * 直接
	 * @author 闫永林
	 * @date 2017年11月22日
	 * @param apiHost
	 * @param path
	 * @param param
	 * @return
	 */
	public static JSONObject getResponseJSONForStation(String apiHost,String path,String param){
		String result=HttpPostToServer(apiHost+path, param);
		JSONObject jsonObject=JSONObject.parseObject(result);
		return jsonObject.getJSONObject("Result");}
	/**
	 * 员工使用
	 * 直接返回result的value对象
	 * @param path 接口地址
	 * @param paramList 请求参数list集合
	 * @return Result的value对象
	 */
	public static JSONObject getResponseJSON(String path,List<NameValuePair> params){
		String result=HttpPostToServer(Constant.MANAGE_HOST+path, params);
		JSONObject jsonObject=JSONObject.parseObject(result);
		return jsonObject.getJSONObject("Result");
	}
	
	/**
	 * 输出JSON
	 * @param json Ajax 字符串
	 * @param response
	 * @author qinyitao
	 * @date 2014.10.8
	 */
	public static void outJsonString(String json,HttpServletResponse response) {
		logger.info("***输出json***"+json);
		try {
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/json;charset=utf-8");
			response.getWriter().write(json);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			logger.warn("###输出json异常###"+e.getMessage());
		}
	}
	
	/**
	 * @param arg 按顺序 Status Message Type
	 * @return 响应字符串
	 */
	public static LinkedHashMap<String ,Object> getResponseMap(String ... arg){
		LinkedHashMap<String ,Object> jsonMap=new LinkedHashMap<String ,Object>();
		jsonMap.put("Type", arg[2]);
		jsonMap.put("Status", arg[0]);
		//jsonMap.put("ErrorCode", arg[1]);
		jsonMap.put("Message", arg[1]);
		return jsonMap;
	}
	
	/**
	 * 将response的map对象转化为字符串，并过滤Map的value为null的转""
	 * @param map 
	 * @return String JSON
	 */
	public static String putResult(Map<String ,Object> map){
		Map<String ,Object> resultMap=new LinkedHashMap<String ,Object>();
		resultMap.put("Result", map);
		ValueFilter filter=new ValueFilter() {//过滤value为null的转为“”
			
			public Object process(Object arg0, String arg1, Object arg2) {
				if(arg2==null){
					return "";
				}
				return arg2;
			}
		};
		return JSONObject.toJSONString(resultMap,filter);
	}
}
