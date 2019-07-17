package com.weixin.util;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.ValueFilter;
import com.baidu.yun.core.json.ParseException;
import com.weixin.entity.AccessToken;
import com.weixin.entity.Menu;
import com.weixin.service.impl.MyX509TrustServiceImpl;

/**
 * @author qinyitao
 */
public class WeixinUtil {
	// 获取access_token的接口地址（GET） 限200（次/天）  
	//public final static String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";  
	// 菜单创建（POST） 限100（次/天）  
	public static String MENU_CREATE_URL = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";  
	
	static Logger logger=Logger.getLogger(WeixinUtil.class);
	
	public static long lastGetAccessTokenTime = 0;
	public static AccessToken accessToken = null; 
	
	
	
	/**
	 * 获取token
	 * @return
	 */
	public static String getToken(){
		return getProperties("token");
	}
	
	/**
	 * 获取EncodingAESKey
	 * @return
	 */
	public static String getEncodingAESKey(){
		return getProperties("EncodingAESKey");
	}
	
	/**
	 * 获取appid
	 * @return
	 */
	public static String getAppID(){
		return getProperties("AppID");
	}
	
	/**
	 * 获取AppSecret
	 * @return
	 */
	public static String getAppSecret(){
		return getProperties("AppSecret");
	}
	
	/**
	 * 获取微信号
	 * @return
	 */
	public static String getMicroSignal(){
		return getProperties("MicroSignal");
	}
	
	/**
	 * 获取properties参数值
	 * @param propertiesName 参数名
	 * @return
	 */
	public static String getProperties(String propertiesName){
		 InputStream inputStream = new WeixinUtil().getClass().getClassLoader().getResourceAsStream("param.properties");   
			Properties p = new Properties();
			 try {   
				  p.load(inputStream);  
			  } catch (IOException e1) {   
				  e1.printStackTrace();   
			  }   
			return p.getProperty(propertiesName);
	}
	
	/** 
	 * 获取access_token 
	 *  
	 * @param appid 凭证 
	 * @param appsecret 密钥 
	 * @return 
	 */  
//	public static AccessToken getAccessToken(String appid, String appsecret) {  
//	    AccessToken accessToken = null;  
//	  
//	    String requestUrl = ACCESS_TOKEN_URL.replace("APPID", appid).replace("APPSECRET", appsecret);  
//	    JSONObject jsonObject = httpRequest(requestUrl, "GET", null);  
//	    // 如果请求成功  
//	    if (null != jsonObject) {  
//	        try {  
//	            accessToken = new AccessToken();  
//	            accessToken.setToken(jsonObject.getString("access_token"));  
//	            accessToken.setExpiresIn(jsonObject.getInteger("expires_in"));  
//	        } catch (Exception e) {  
//	            accessToken = null;  
//	            // 获取token失败  
//	            logger.error(jsonObject.getInteger("errcode"), e);  
//	        }  
//	    }  
//	    return accessToken;  
//	}  
	
	
	/** 
	 * 创建菜单 
	 *  
	 * @param menu 菜单实例 
	 * @param accessToken 有效的access_token 
	 * @return 0表示成功，其他值表示失败 
	 */  
	public static int createMenu(Menu menu, String accessToken) {  
	    int result = 0;  
	  
	    // 拼装创建菜单的url  
	    String url = MENU_CREATE_URL.replace("ACCESS_TOKEN", accessToken);  
	    
	    // 将菜单对象转换成json字符串  
	    String jsonMenu = JSONObject.toJSONString(menu);  
	    // 调用接口创建菜单  
	    JSONObject jsonObject = httpRequest(url, "POST", jsonMenu);  
	  
	    if (null != jsonObject) {  
	        if (0 != jsonObject.getInteger("errcode")) {  
	            result = jsonObject.getInteger("errcode");  
	            //logger.error("创建菜单失败 errcode:{} errmsg:{}", jsonObject.getInteger("errcode"), jsonObject.getString("errmsg"));  
	        }  
	    }  
	  
	    return result;  
	} 
	
	
	/**
	 * 输出JSON
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
	 * 生产guid，用于登录令牌
	 * @return
	 */
	public static String guid(){
		UUID uuid = UUID.randomUUID();
		return uuid.toString();
	}
	/**
	 * 得到响应格式
	 * @param arg 按顺Type Status Message
	 * @return 响应字符传
	 */
	public static LinkedHashMap<String ,Object> getResponseMap(String ... arg){
		LinkedHashMap<String ,Object> jsonMap=new LinkedHashMap<String ,Object>();
		jsonMap.put("Type", arg[0]);
		jsonMap.put("Status", arg[1]);
		jsonMap.put("Message", arg[2]);
		return jsonMap;
	}
	/**
	 * 
	 * @param errorCode 错误码
	 * @return 输出错误信息json
	 */
	public static void responseErrorJson(String errorCode,String errorMsg,HttpServletResponse response){
		LinkedHashMap<String,Object> map=getResponseMap("Bool",errorCode,errorMsg);
		String resultJson= putResult(map);
		outJsonString(resultJson,response);
	}
	/**
	 * 将response的map对象转化为字符串，并过滤Map的value为null的转""
	 * @param map 
	 * @return
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
	
	/** 
     * 发起https请求并获取结果 
     *  
     * @param requestUrl 请求地址 
     * @param requestMethod 请求方式（GET、POST） 
     * @param outputStr 提交的数据 
     * @return JSONObject(通过JSONObject.get(key)的方式获取json对象的属性值) 
     */  
    public static JSONObject httpRequest(String requestUrl, String requestMethod, String outputStr) {  
        JSONObject jsonObject = null;  
        StringBuffer buffer = new StringBuffer();  
        try {  
            // 创建SSLContext对象，并使用我们指定的信任管理器初始化  
            TrustManager[] tm = { new MyX509TrustServiceImpl() };  
            SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");  
            sslContext.init(null, tm, new java.security.SecureRandom());  
            // 从上述SSLContext对象中得到SSLSocketFactory对象  
            SSLSocketFactory ssf = sslContext.getSocketFactory();  
  
            URL url = new URL(requestUrl);  
            HttpsURLConnection httpUrlConn = (HttpsURLConnection) url.openConnection();  
            httpUrlConn.setSSLSocketFactory(ssf);  
  
            httpUrlConn.setDoOutput(true);  
            httpUrlConn.setDoInput(true);  
            httpUrlConn.setUseCaches(false);  
            // 设置请求方式（GET/POST）  
            httpUrlConn.setRequestMethod(requestMethod);  
  
            if ("GET".equalsIgnoreCase(requestMethod))  
                httpUrlConn.connect();  
  
            // 当有数据需要提交时  
            if (null != outputStr) {  
                OutputStream outputStream = httpUrlConn.getOutputStream();  
                // 注意编码格式，防止中文乱码  
                outputStream.write(outputStr.getBytes("UTF-8"));  
                outputStream.close();  
            }  
  
            // 将返回的输入流转换成字符串  
            InputStream inputStream = httpUrlConn.getInputStream();  
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");  
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);  
  
            String str = null;  
            while ((str = bufferedReader.readLine()) != null) {  
                buffer.append(str);  
            }  
            bufferedReader.close();  
            inputStreamReader.close();  
            // 释放资源  
            inputStream.close();  
            inputStream = null;  
            httpUrlConn.disconnect();  
            jsonObject = JSONObject.parseObject(buffer.toString());  
        } catch (ConnectException ce) {  
            logger.error("Weixin server connection timed out.");  
        } catch (Exception e) {  
            logger.error("https request error:{}", e);  
        }  
        return jsonObject;  
    }  
	
	/**
	 * 验证图片格式，目前只支持jpg,png,jpeg三种
	 * @param imgStr 图片后缀
	 * @return
	 */
	public static boolean verifyImg(String imgStr){
		if(imgStr.equalsIgnoreCase("jpg") || imgStr.equalsIgnoreCase("png") || imgStr.equalsIgnoreCase("jpeg")){
			return true;
		}else{
			return false;
		}
	}
	
	public static boolean isNull(Object obj) {
		if (obj == null || StringUtils.isBlank(obj.toString()) || "null".equals(obj)) {
			return true;
		} else {
			return false;
		}
	}
	
	private static String GET_OPENID_URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
	
	//private static String GET_USERINFO_URL = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
	private static String GET_USERINFO_URL = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
	
	public static String getOpenID(String code) {
		logger.debug("---------------------enter  WeixinUtil.getopenid code="+code+"-----------------");
		 
		final String APPID =getAppID();
		// 第三方用户唯一凭证密钥  
		final String APP_SECRET =getAppSecret();
		logger.debug("APPID===>"+APPID);
		logger.debug("APP_SECRET===>"+APP_SECRET);
		AccessToken accessToken = null;  
		  
	    String requestUrl = GET_OPENID_URL.replace("APPID", APPID).replace("SECRET", APP_SECRET).replace("CODE", code);
	    logger.debug("requestUrl===>"+requestUrl);
	    JSONObject jsonObject= null;
	    try {
	    	jsonObject = httpRequest(requestUrl, "GET", null);
	    	System.out.println(jsonObject);
	    } catch(Exception e) {
	    	logger.debug(e.getMessage());
	    }
	    // 如果请求成功  
	    if (null != jsonObject) {  
	        try { 
	            accessToken = new AccessToken();  
	            accessToken.setToken(jsonObject.getString("access_token"));  
	            accessToken.setExpiresIn(jsonObject.getInteger("expires_in"));
	            accessToken.setOpenid(jsonObject.getString("openid"));
	            logger.debug("openid="+jsonObject.getString("openid"));
	        } catch (Exception e) {  
	            accessToken = null;  
	            // 获取token失败  
	            logger.error(jsonObject.getInteger("errcode"), e);  
	        }  
	    }  
	    return accessToken == null ?null:accessToken.getOpenid() ;  
	}
	
	public static JSONObject getUserInfo(String code) {
		logger.debug("---------------------enter  WeixinUtil.getopenid code="+code+"-----------------");
		 
		final String APPID =getAppID();
		// 第三方用户唯一凭证密钥  
		final String APP_SECRET =getAppSecret();
		logger.debug("APPID===>"+APPID);
		logger.debug("APP_SECRET===>"+APP_SECRET);
		//AccessToken accessToken = null;  
		JSONObject resultJsonObject = null;
		
		String requestUrl = GET_OPENID_URL.replace("APPID", APPID).replace("SECRET", APP_SECRET).replace("CODE", code);
	    logger.debug("requestUrl===>"+requestUrl);
	    JSONObject jsonObject= null;
	    try {
	    	jsonObject = httpRequest(requestUrl, "GET", null);
	    	System.out.println(jsonObject);
	    } catch(Exception e) {
	    	logger.debug(e.getMessage());
	    }
	    // 如果请求成功  
	    if (null != jsonObject) {  
	    	
	    	 try { 
	    		 resultJsonObject = new JSONObject();
		            logger.debug("openid="+jsonObject.getString("openid"));
		            String OpenID = jsonObject.getString("openid");
		            resultJsonObject.put("OpenID", OpenID);
		            //继续获取用户信息
		            try{
		            	requestUrl = GET_USERINFO_URL.replace("ACCESS_TOKEN", getAccessToken().getToken()).replace("OPENID", OpenID);
			            JSONObject userInfoJSONObject= httpRequest(requestUrl, "GET", null);
						System.out.println("=====微信返回信息========"+userInfoJSONObject.toJSONString());
			            if(userInfoJSONObject!=null){
			            	resultJsonObject.put("Nickname", userInfoJSONObject.getString("nickname"));
			            	resultJsonObject.put("Province", userInfoJSONObject.getString("province"));//省
			            	resultJsonObject.put("City", userInfoJSONObject.getString("city"));//市
			            	resultJsonObject.put("Sex", userInfoJSONObject.getString("sex"));
			            }
		            }catch(Exception e){e.printStackTrace();}
		            
		        } catch (Exception e) {  
		            accessToken = null;  
		            // 获取token失败  
		            logger.error(jsonObject.getInteger("errcode"), e);  
		        }  
		}  
		return resultJsonObject;  
	}
	
	public static String getTicketMd5Info(String userID,String time){
		if(StringUtils.isBlank(userID)||StringUtils.isBlank(time)){
			return "";
		}else{
			return MD5Util.MD5(time+userID).toLowerCase()+userID;
		}
	}
	
	/**
	 * 获取AccessToken
	 * @author 闫永林
	 * @date 2016年2月22日
	 * @return
	 */
	public static AccessToken getAccessToken() {  
	    long curTimeMillis = System.currentTimeMillis();
	    //如果当前获取时间距离上次获取时间，已经超过110分钟，重新获取(AccessToken2小时有效)
	    if((curTimeMillis-lastGetAccessTokenTime)>110*60*1000){
	    	String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET"; 
	    	String requestUrl = ACCESS_TOKEN_URL.replace("APPID", WeixinUtil.getAppID()).replace("APPSECRET", WeixinUtil.getAppSecret());
	    	
		    JSONObject jsonObject = httpRequest(requestUrl, "GET", null);  
		    // 如果请求成功  
		    if (null != jsonObject) {  
		        try {  
		            accessToken = new AccessToken();  
		            accessToken.setToken(jsonObject.getString("access_token"));  
		            accessToken.setExpiresIn(jsonObject.getInteger("expires_in"));
		            lastGetAccessTokenTime = System.currentTimeMillis();
		        } catch (Exception e) {  
		            accessToken = null;  
		            // 获取token失败  
		            logger.error(jsonObject.getInteger("errcode"), e);  
		        }  
		    } 
	    } 
	    
	    return accessToken;  
	} 
	
	public static AccessToken getAccessTokenForce(){
		JSONObject jsonObject = null;
		 try { 
			 String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET"; 
			 String requestUrl = ACCESS_TOKEN_URL.replace("APPID", WeixinUtil.getAppID()).replace("APPSECRET", WeixinUtil.getAppSecret());  
			    jsonObject = httpRequest(requestUrl, "GET", null);  
			  
	            accessToken = new AccessToken();  
	            accessToken.setToken(jsonObject.getString("access_token"));  
	            accessToken.setExpiresIn(jsonObject.getInteger("expires_in"));
	            lastGetAccessTokenTime = System.currentTimeMillis();
	        } catch (Exception e) {  
	            accessToken = null;  
	            // 获取token失败  
	            logger.error(jsonObject.getInteger("errcode"), e);  
	        }  
		 
		 return accessToken;
	}
	
	/**
	 * 获取短连接
	 * @author 闫永林
	 * @date 2016年2月23日
	 * @param longURL 需要转换的长链接，支持http://、https://、weixin://wxpay 格式的url 
	 * @return
	 */
	public static String getShortURL(String longURL) {
		
		AccessToken accessToken = getAccessToken();
		
		JSONObject params = new JSONObject();
		params.put("action", "long2short");
		params.put("long_url", longURL);
		
		String URL = "https://api.weixin.qq.com/cgi-bin/shorturl?access_token="+accessToken.getToken();
		
		JSONObject jsonObject = httpRequest(URL, "POST", params.toJSONString());
		if(jsonObject!=null&&jsonObject.getString("errmsg").equals("ok")){
			return jsonObject.getString("short_url");
		}else{
			return "";
		}
	}
	
	public static void main(String[] args) {
		System.out.println(getShortURL("http://www.baidu.com"));
	}
}