package com.weixin.service.impl;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.URL;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.weixin.entity.AccessToken;
import com.weixin.entity.response.Article;
import com.weixin.entity.response.CustomServiceTextMsg;
import com.weixin.entity.response.Image;
import com.weixin.entity.response.NewsMessage;
import com.weixin.entity.response.PictureMessage;
import com.weixin.entity.response.TextMessage;
import com.weixin.entity.response.TextMsg;
import com.weixin.service.ICoreService;
import com.weixin.util.AbuttUtil;
import com.weixin.util.Constant;
import com.weixin.util.MessageUtil;
import com.weixin.util.RedisHelper;
import com.weixin.util.SignUtil;
import com.weixin.util.WeixinUtil;

@Service
public class CoreService implements ICoreService{
	
	public Logger logger = Logger.getLogger(CoreService.class);
	
	private final String ACTIVITY_LIST = "osmsActivity/getActivityList";
	private final String USER_ACTIVITY_LIST = "thirdparty/getUserActivityList";
	private final String CHECK_ACCOUNT_IS_BIND = "thirdparty/checkAccountIsBind";
	private final String CHECK_ACCOUNT_HAS_MEDICAL_HISTORY = "thirdparty/getUserMedicalHistory";
	private final String GET_AUTO_RESPONSE = "autoResponse/getQuestionAnswerResponse";
	private final String GET_LOTTERY_ACTIVITY = "thirdparty/getArticleList";
	private String CUSTOM_SERVICE_SEND_MESSAGE_URL = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=ACCESS_TOKEN";

	private final String GET_DOCTOR_BY_CODE = "doctor/getDoctorByDoctorCode";
	private final String GET_INSTITUTION_DETAIL_BY_CODE = "institution/getInstitutionByCode";
	private final String ADD_SOURCE_BY_CODE = "user/addUserSourceForWeiXin";
	private final String UPDATE_USER_SOURCE_FOR_WEIXIN="user/updateUserSourceForWeiXin";
	@Override
	public String processRequest(HttpServletRequest request) {
		
		String respMessage = null;  
	        try {  
	            // 默认返回的文本消息内容  
	            String respContent = "您好，欢迎关注同心管家!";  
	            // xml请求解析  
	            Map<String, String> requestMap = MessageUtil.parseXml(request);  
	  
	            // 发送方帐号（open_id）  
	            String fromUserName = requestMap.get("FromUserName");  
	            // 公众帐号  
	            String toUserName = requestMap.get("ToUserName");  
	            // 消息类型  
	            String msgType = requestMap.get("MsgType"); 
	            
	            // 文本消息  
	            if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {
	            	String content = (String)requestMap.get("Content");
	            	
	            	//提前回复,如果是遇到视频问诊,直接回复图片
	            	/*if(StringUtils.isNotBlank(content)&&content.indexOf("视频问诊")>-1){
	            		//默认的Media
	            		//{"media_id":"58naiiYxlK7xaMjS2V1F0XU-8utpup6DnpUKm1_27ew","url":"http:\/\/mmbiz.qpic.cn\/mmbiz_jpg\/5tFic2QHtphnicBgSoT08vKoQpZbM1iaMjmU9gtjgaT3TxBYSWMiciaGMemNGd1UcFDl61FT08hibXibsGicpGcECicccPw\/0?wx_fmt=jpeg"}
	            		//return MessageUtil.pictureMessageToXml(getPictureMessage(fromUserName, toUserName,"58naiiYxlK7xaMjS2V1F0XU-8utpup6DnpUKm1_27ew"));
	            		List videoArtileList = new ArrayList();
	                    Article videoArticle = new Article();
	                    videoArticle.setTitle("视频问诊");
	                    videoArticle.setDescription("本周出诊专家强生远副主任医师");
	                    videoArticle.setPicUrl(Constant.WeiXinServerURL + "article/images/videoconsult.jpg");
	                    videoArticle.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx9f8c0fab5fe2b5fc&redirect_uri=http://weixin.ixinzang.com/pasmPay/onlineVideoConsult?response_type=code&scope=snsapi_base&state=1#wechat_redirect");
	                    videoArtileList.add(videoArticle);
	                    NewsMessage vidwoConsultShow = getNewsMessage(fromUserName, toUserName, 1, videoArtileList);
	                    return MessageUtil.newsMessageToXml(vidwoConsultShow);
	            	}*/
	            	
	            	/*respContent =  "您的信息已收到，我们会及时回复。 如遇在线咨询等候时间较长，您也可以添加同心管家客服微信号：txgj120 咨询。也可点击此链接http://dl.ixinzang.com/pasm/d.html下载同心管家APP，为您提供更多健康资讯及免费咨询服务。";
	            	String KeyWordList=getCache("KeyWordList");
	         		JSONObject appObject=JSON.parseObject(KeyWordList);
	         		List list = appObject.getJSONArray("ListInfo");
	         		if(list != null){
	         			for(int i = 0;i<list.size();i++){
	         				Map<String,Object> map = (Map<String,Object>) list.get(i);
	         				String StartTime = map.get("StartTime") == null ? "":map.get("StartTime").toString();
	         				String EndTime = map.get("EndTime") == null ? "":map.get("EndTime").toString();
	         				String KeyWord = map.get("KeyWord") == null ? "":map.get("KeyWord").toString();
	         				String LinkTargetType = map.get("LinkTargetType") == null ? "":map.get("LinkTargetType").toString();
	         				String ReplyContent = map.get("ReplyContent") == null ? "":map.get("ReplyContent").toString();
	         				String Cover = map.get("Cover") == null ? "":Constant.IMG_PATH+map.get("Cover").toString();
	         				String LinkURL = map.get("LinkURL") == null ? "":map.get("LinkURL").toString();
	         				
	         				if(dateCompare(StartTime,EndTime)){
	         					String MatchType = map.get("MatchType") == null ? "":map.get("MatchType").toString();
	         					if("1".equals(MatchType)){
	         						if(content.equals(KeyWord)){
	         							if("1".equals(LinkTargetType)){//文本
	         								respContent = ReplyContent;
	         								break;
	         							} else if("2".equals(LinkTargetType)){//文章详情
	         								String LinkTargetID = map.get("LinkTargetID") == null ? "":map.get("LinkTargetID").toString();
	         								List<Article> articleList = getArticleDetail(LinkTargetID, ReplyContent, Cover);
	         				                NewsMessage monthShow = getNewsMessage(fromUserName, toUserName, 1, articleList);
	         				                return MessageUtil.newsMessageToXml(monthShow);
	         							} else if("3".equals(LinkTargetType)){//指定URL
	         								List<Article> nationalDayArticle = getNationalDayList(ReplyContent,Cover,LinkURL);
	         								NewsMessage monthShow = getNewsMessage(fromUserName, toUserName, 1, nationalDayArticle);
	         								return MessageUtil.newsMessageToXml(monthShow);
	         							}
	         						}
	         					} else if ("2".equals(MatchType)){
	         						if(content.indexOf(KeyWord) > -1){
	         							if("1".equals(LinkTargetType)){//文本
	         								respContent = ReplyContent;
	         								break;
	         							} else if("2".equals(LinkTargetType)){//文章详情
	         								String LinkTargetID = map.get("LinkTargetID") == null ? "":map.get("LinkTargetID").toString();
	         								List<Article> articleList = getArticleDetail(LinkTargetID, ReplyContent, Cover);
	         				                NewsMessage monthShow = getNewsMessage(fromUserName, toUserName, 1, articleList);
	         				                return MessageUtil.newsMessageToXml(monthShow);
	         							} else if("3".equals(LinkTargetType)){//指定URL
	         								List<Article> nationalDayArticle = getNationalDayList(ReplyContent,Cover,LinkURL);
	         								NewsMessage monthShow = getNewsMessage(fromUserName, toUserName, 1, nationalDayArticle);
	         								return MessageUtil.newsMessageToXml(monthShow);
	         							}
	         						}
	         					}
	         				}
	         			}
	         		}*/
	            	return "";
	            }  
	            // 图片消息  
	            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) {  
	            	//respContent =  "您的信息已收到，我们会及时回复。 如遇在线咨询等候时间较长，您也可以添加同心管家客服微信号：txgj120 咨询。也可点击此链接http://dl.ixinzang.com/pasm/d.html下载同心管家APP，为您提供更多健康资讯及免费咨询服务。";
	            	return "";
	            }  
	            // 地理位置消息  
	            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)) {  
	            	//respContent =  "您的信息已收到，我们会及时回复。 如遇在线咨询等候时间较长，您也可以添加同心管家客服微信号：txgj120 咨询。也可点击此链接http://dl.ixinzang.com/pasm/d.html下载同心管家APP，为您提供更多健康资讯及免费咨询服务。";
	            	return "";
	            }  
	            // 链接消息  
	            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LINK)) {  
	            	//respContent =  "您的信息已收到，我们会及时回复。 如遇在线咨询等候时间较长，您也可以添加同心管家客服微信号：txgj120 咨询。也可点击此链接http://dl.ixinzang.com/pasm/d.html下载同心管家APP，为您提供更多健康资讯及免费咨询服务。";
	            	return "";
	            }  
	            // 音频消息  
	            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VOICE)) {  
	            	//respContent =  "您的信息已收到，我们会及时回复。 如遇在线咨询等候时间较长，您也可以添加同心管家客服微信号：txgj120 咨询。也可点击此链接http://dl.ixinzang.com/pasm/d.html下载同心管家APP，为您提供更多健康资讯及免费咨询服务。";
	            	return "";
	            }  
	            // 事件推送  
	            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {  
	                // 事件类型  
	                String eventType = requestMap.get("Event");  
	                // 订阅  
	                if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {  
	                	try{
	                		JSONObject UserInfojsonObject = getUserInfoByOpenID(fromUserName);//获取用户信息通过OpenID
	                		String EventKey = requestMap.get("EventKey");
	                		if(StringUtils.isNotBlank(EventKey)&&EventKey.indexOf("qrscene_")>-1){
	                			EventKey = EventKey.replace("qrscene_", "");
	                		}
	                		logger.info("EventKey:"+EventKey);
	                		JSONObject params = new JSONObject();
	                		params.put("ThirdpartyAccount", fromUserName);
	                		params.put("TATID", 1);
	                		params.put("ApplicationID", 4);
	                		setNickName(params,UserInfojsonObject);//设置昵称到params集合
	                		params.put("SceneID", EventKey);
	        				JSONObject jsonObject = AbuttUtil.getResponseJSON(ADD_SOURCE_BY_CODE, params.toJSONString());
                			logger.error("添加订阅信息"+jsonObject);
	                	}catch(Exception e){
	                		e.printStackTrace();
	                		logger.error("订阅事件异常"+e.getMessage());
	                	}
	                	 
	                	/*respContent = "欢迎关注同心管家！国内专业的心血管疾病预防、筛查、辅助诊疗、支架术后康复管理平台，已覆盖50多万心血管用户，为他们的心脏健康保驾护航！在同心管家您可以享受：\n\n"
            			        +"●随时随地在线咨询\n"
                        		+"●知名心内科专家一对一视频答疑\n"
                        		+"●心电监护方案与心电解读服务\n"
                        		+"●支架术后系统康复方案\n"
                        		+"●就医指导，国内知名三甲医院急速转诊\n"
                        		+"等诸多专业服务，您的健康由我们为您守护！\n\n"
                        		+"★您可以随时在公众号平台留言给我们，或添加医护助理微信号：txgj120 随时进行咨询。\n"
                        		+"★点击以下链接，注册下载“同心管家”APP 为您提供更多健康资讯及心血管康复服务： [图片]https://weixin.ixinzang.com/activity/download_user.jsp";*/
                        //return MessageUtil.pictureMessageToXml(getPictureMessage(fromUserName, toUserName,"veUSkCd8VSW-2r-OF5b8Z9h2JPdIzB8TuqhZZdpR-Yo"));
	                	//默认的Media
	            		List artileList = new ArrayList();
	                    Article article = new Article();
	                    article.setTitle("欢迎关注同心管家，点击了解更多！");
	                    article.setDescription("● 术后为何还是胸闷？憋气？\n● 冠心病如何分辨致命胸痛？\n● 支架术后多久可以运动？\n● 服用阿司匹林出血该怎么办？\n● 支架术后能坐飞机么？能喝咖啡么？\n● 冠心病、支架术后究竟如何正确进行居家心脏康复？\n\n—— 同心管家集合50万心血管病用户的热点问题，特邀全国心内科TOP10科室心内专家为您详细解析。\n★  同心管家，守护心脏健康，重启美丽人生  ★");
	                    article.setPicUrl(Constant.WeiXinServerURL + "article/images/attention.jpg");
	                    article.setUrl("https://12i.cn/uzGFU9");
	                    artileList.add(article);
	                    NewsMessage vidwoConsultShow = getNewsMessage(fromUserName, toUserName, 1, artileList);
	                    return MessageUtil.newsMessageToXml(vidwoConsultShow);
	                } 
	                // 取消订阅  
	                else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {  
	                	UnConcern(fromUserName);//取消关注
	                }  
	                // 自定义菜单点击事件  
	                else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)) {  
	                    // 事件KEY值，与创建自定义菜单时指定的KEY值对应  
	                    String eventKey = requestMap.get("EventKey");  
	                    if (eventKey.equals("ACTIVITY_NOTICE")) {  
	                    	JSONObject param=new JSONObject();
	            			param.put("DeviceID", 4);
	            			param.put("ActivityStatus", 1);
	            			param.put("PageIndex", 1);
	            			param.put("PageSize",  5);
	            			JSONObject resultObject = AbuttUtil.getResponseJSON(ACTIVITY_LIST, param.toJSONString());
	            			JSONArray listInfo = resultObject.getJSONArray("ListInfo");
	            			NewsMessage news = getResponseNewsMessage(fromUserName, toUserName, listInfo,1);
	            			return MessageUtil.newsMessageToXml(news);
	            			
	                    } else if (eventKey.equals("ACTIVITY_PREVIOUS")) {  
	                    	JSONObject param=new JSONObject();
	            			param.put("DeviceID", 4);
	            			param.put("ActivityStatus", 2);
	            			param.put("PageIndex", 1);
	            			param.put("PageSize",  5);
	            			JSONObject resultObject = AbuttUtil.getResponseJSON(ACTIVITY_LIST, param.toJSONString());
	            			JSONArray listInfo = resultObject.getJSONArray("ListInfo");
	            			NewsMessage news = getResponseNewsMessage(fromUserName, toUserName, listInfo,2);
	            			return MessageUtil.newsMessageToXml(news);
	                    } else if (eventKey.equals("CONSULTE_ONLINE")) {  
	                        respContent = "点击下方的键盘按钮输入要咨询的问题";  
	                    } else if (eventKey.equals("CONSULTE_TELEPHONE")) {  
	                        respContent = "\t\t\t\t\t\t\t010-53767509\n\n"
	                        		+ "团队\n"+"这里有专业的医师团队，为您提供全面的术后康复咨询。\n\n"
                    				+ "时间\n咨询服务时间为周一至周日8:30—17:30\n\n"
                    				+ "资费\n拨打010-53767509，您只需支付普通市话费，不产生任何附加费用";  
	                        
	                    } else if (eventKey.equals("OWN_KNOW")) {  //术后天天知
	                    	   //判断用户是否已经绑定账户
	                    	String userId = checkAccountIsBind(fromUserName);
	                    	String url = Constant.WeiXinServerURL+"everydayKnown?thirdpartyAccount="+fromUserName;
	                    	if(userId == null ||userId.equals("")){
	                    		NewsMessage news = getEverydayKnownNoUser(fromUserName, toUserName,url);
	                    		return MessageUtil.newsMessageToXml(news);
	                    	}
	                    	JSONObject resultObject = checkAccountHasMedicalHistory(userId);
	                		JSONObject jsonObject = resultObject.getJSONObject("DetailInfo");
	                		if(WeixinUtil.isNull(jsonObject.getString("Instrument")) || WeixinUtil.isNull(jsonObject.getString("SurgicalTime"))){
	                			TextMessage text = getResponseTextMessage(fromUserName, toUserName);
	                			text.setContent("<a href=\""+url+"\">您还没录入手术信息，请点击录入。</a>");
	                			return MessageUtil.textMessageToXml(text);
	                		}
	                		//验证手术类型
	                		JSONObject resultObject5 =checkAccountHasMedicalHistory(userId);
	                		logger.info("验证手术类型查询的信息:"+resultObject5);
	                		JSONObject jsonObject5 = resultObject5.getJSONObject("DetailInfo");
	                		if(resultObject5.getInteger("Status") == 200){
	                			if(jsonObject5.getInteger("Instrument") != 1){
	                				TextMessage text = getResponseTextMessage(fromUserName, toUserName);
		                			text.setContent("您好！该内容目前暂无法提供！");
		                			return MessageUtil.textMessageToXml(text);
	                			}
	                		}
	                		//	
	                		
	                		String surgicalTime = jsonObject.getString("SurgicalTime");
	                		logger.info(surgicalTime);
	        				Integer days = fromToday(surgicalTime);
	        				request.getSession().setAttribute("maxDays", days);
	        				String messageStr = "";
	        				if(days <= 7){
	        					messageStr = "您是术后第"+days+"天,请点击查看今天的注意事项。";
	        				}else if(days > 7){
	        					Integer weeks = daysToWeek(days);
	        					messageStr = "您是术后第"+weeks+"周,请点击查看本周的注意事项。";
	        				}
	        				NewsMessage news = everydayKnown(fromUserName, toUserName,messageStr, url);
	                    	return MessageUtil.newsMessageToXml(news);
	                    	
	                    } else if (eventKey.equals("OWN_REHIBIETATION_ENCYCLOPEDIA")) {  
	                        respContent = "康复百科菜单项被点击！openid:"+fromUserName;  
	                    } else if (eventKey.equals("OWN_ACTICITY")) {  
	                        //判断用户是否已经绑定账户
	                    	String userId = checkAccountIsBind(fromUserName);
	                    	if(userId == null|| userId.equals("")){
	                    		String link = Constant.WeiXinServerURL+"getUserActivityList?thirdpartyAccount="+fromUserName+"~activityStatus=-1~pageIndex=1";
	                    		NewsMessage news = bindUser(fromUserName, toUserName, link);
	                    		return MessageUtil.newsMessageToXml(news);
	                    	}
	                    	JSONObject param=new JSONObject();
	            			param.put("UserID", userId);
	            			param.put("ActivityStatus", -1);
	            			param.put("PageIndex", 1);
	            			param.put("PageSize",  5);
	            			JSONObject resultObject = AbuttUtil.getResponseJSON(USER_ACTIVITY_LIST, param.toJSONString());
	            			JSONArray listInfo = resultObject.getJSONArray("ListInfo");
	            			NewsMessage news = getResponseNewsMessage(fromUserName, toUserName, listInfo,-1);
	            			return MessageUtil.newsMessageToXml(news);
	                    } else if(eventKey.equals("ACTIVITY")){//讲座
	                    	NewsMessage news = getActivityMessage(fromUserName, toUserName);
	                    	return MessageUtil.newsMessageToXml(news);
	                    }else if(eventKey.equals("BESTVIDEO")){//视频集萃
	                    	NewsMessage news = getBestVideoMessage(fromUserName, toUserName);
	                    	return MessageUtil.newsMessageToXml(news);
	                    }else if(eventKey.equals("MEDICAL_CONSULTATION")){
	                    	NewsMessage news = getConsulMessage(fromUserName, toUserName);
	                    	return MessageUtil.newsMessageToXml(news);
	                    }else if(eventKey.equals("APP_DOWNLOAD")){
	                    	NewsMessage news = downloadApp(fromUserName, toUserName);
	                    	return MessageUtil.newsMessageToXml(news);
	                    }else if(eventKey.equals("LOTTERY_ACTIVITY")){//抽奖活动
	                    	NewsMessage news = getLotteryActivity(fromUserName, toUserName);
	                    	
	                    	if(news!=null&&news.getArticles()!=null&&news.getArticles().size()>0){
	                    		return MessageUtil.newsMessageToXml(news);
	                    	}else{
	                    		respContent = "目前暂无抽奖活动!";
	                    	}
	                    }
	                }  
	            }  
	  
	            TextMessage textMessage = getResponseTextMessage(fromUserName, toUserName);
	            textMessage.setContent(respContent);  
	            respMessage = MessageUtil.textMessageToXml(textMessage);  
	        } catch (Exception e) {  
	            e.printStackTrace();
	            logger.debug(e);
	        }  
	  
	        return respMessage;  
	}
	private void setNickName( JSONObject params,
			JSONObject UserInfojsonObject) {
		if(UserInfojsonObject!=null){
			params.put("Nickname", UserInfojsonObject.getString("nickname"));
		}else{
			params.put("Nickname", "");
		}
	}

	//获取用户信息
	private JSONObject getUserInfoByOpenID(String fromUserName) {
		AccessToken accessToken =  WeixinUtil.getAccessToken();
		String GET_USER_INFO = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
		
		GET_USER_INFO = GET_USER_INFO.replace("ACCESS_TOKEN",accessToken.getToken());
		
		GET_USER_INFO = GET_USER_INFO.replace("OPENID", fromUserName);
		JSONObject jsonObject = WeixinUtil.httpRequest(GET_USER_INFO, "POST", null);
		logger.info("获取用户信息数据-------------"+jsonObject);
		return  jsonObject;
	}
    
	//取消关注
	private void UnConcern(String fromUserName) {
		JSONObject param_s = new JSONObject();
		param_s.put("ThirdpartyAccount", fromUserName);
		param_s.put("ApplicationID", 4);
		param_s.put("HasUnfollowed", 1);
		param_s.put("DeviceID", 5);
		JSONObject jsonObject = AbuttUtil.getResponseJSON(UPDATE_USER_SOURCE_FOR_WEIXIN, param_s.toJSONString());
		logger.error("取消关注执行结果："+jsonObject);
	}
	
	private NewsMessage getLotteryActivity(String fromUserName,String toUserName){
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
			int status = resultObject.getIntValue("Status");
			if(status == 200){
				//添加分页
				Integer dataCount=resultObject.getJSONObject("DetailInfo").getInteger("DataCount");
				JSONArray responseArray =  resultObject.getJSONArray("ListInfo");
				return encasedActivity(fromUserName, toUserName, dataCount, responseArray);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 拼接抽奖活动返回数据
	 * @param fromUserName
	 * @param toUserName
	 * @param dataCount
	 * @param jsonArray
	 * @return
	 */
	private NewsMessage encasedActivity(String fromUserName,String toUserName,Integer dataCount,JSONArray jsonArray){
		NewsMessage newsMessage = new NewsMessage();
		newsMessage.setToUserName(fromUserName);  
		newsMessage.setFromUserName(toUserName);  
		newsMessage.setCreateTime(new Date().getTime());  
		newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);  
		newsMessage.setArticleCount(dataCount);
		
		String img_host = WeixinUtil.getProperties("img_host");
		List<Article> articles = new ArrayList<Article>();
		for (int i = jsonArray.size() -1; i >= 0; i--) {
			JSONObject jsonObj = jsonArray.getJSONObject(i);
			Article newsArticle = new Article();
			newsArticle.setTitle(jsonObj.getString("ArticleTitle"));
			newsArticle.setPicUrl(img_host+jsonObj.getString("Cover"));
			newsArticle.setUrl(Constant.WeiXinServerURL+"getRaffleDetail?raffleID="+jsonObj.getInteger("LinkTargetID")+"&thirdpartyAccount="+fromUserName);
			articles.add(newsArticle);
		}
		newsMessage.setArticles(articles);
		return newsMessage;
	}

	
	
	//医学咨询
	private NewsMessage getConsulMessage(String fromUserName,String toUserName){
		NewsMessage newsMessage = new NewsMessage();
		newsMessage.setToUserName(fromUserName);  
		newsMessage.setFromUserName(toUserName);  
		newsMessage.setCreateTime(new Date().getTime());  
		newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);  
		newsMessage.setArticleCount(3);
		
		List<Article> articles = new ArrayList<Article>();
		Article onlineConsult = new Article();
		onlineConsult.setTitle("在线咨询");
		onlineConsult.setPicUrl(Constant.WeiXinServerURL+"activity/images/online_consult1.png");
		onlineConsult.setUrl(Constant.WeiXinServerURL+"activity/online_consult.jsp");
		articles.add(onlineConsult);
		
		Article askOnline = new Article();
		askOnline.setTitle("电话咨询");
		askOnline.setUrl(Constant.WeiXinServerURL+"activity/consul_phone.jsp");
		articles.add(askOnline);
		
		Article newsArticle = new Article();
		newsArticle.setTitle("常见问题");
		newsArticle.setUrl(Constant.WeiXinServerURL+"activity/online_faq.jsp");
		articles.add(newsArticle);
		
		
		
		newsMessage.setArticles(articles);
		return newsMessage;
	}
	
	//视频集萃  讲座视频
		private NewsMessage getBestVideoMessage(String fromUserName,String toUserName){
			NewsMessage newsMessage = new NewsMessage();
			newsMessage.setToUserName(fromUserName);  
			newsMessage.setFromUserName(toUserName);  
			newsMessage.setCreateTime(new Date().getTime());  
			newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);  
			newsMessage.setArticleCount(3);
			
			List<Article> articles = new ArrayList<Article>();
			Article drugVideoArticle = new Article();
			drugVideoArticle.setTitle("用药管理-心内科专家为您讲解支架术后用药对策");
			drugVideoArticle.setPicUrl(Constant.WeiXinServerURL+"activity/images/drug_management.png");
			drugVideoArticle.setUrl(Constant.WeiXinServerURL+"getVideoList?ArticleTag=1&thirdpartyAccount="+fromUserName);
			articles.add(drugVideoArticle);
			
			Article comicArticle = new Article();
			comicArticle.setTitle("动漫系列-动漫的形式、生活的场景，轻松讲述康复故事");
			comicArticle.setUrl(Constant.WeiXinServerURL+"getVideoList?ArticleTag=2&thirdpartyAccount="+fromUserName);
			articles.add(comicArticle);
			
			Article lectureArticle = new Article();
			lectureArticle.setTitle("百科讲座-心内科专家为您解读康复过程中饮食、运动、心理等方方面面");
			lectureArticle.setUrl(Constant.WeiXinServerURL+"getVideoList?ArticleTag=3&thirdpartyAccount="+fromUserName);
			articles.add(lectureArticle);
			
			newsMessage.setArticles(articles);
			return newsMessage;
		}
	
		//App下载
		private NewsMessage downloadApp(String fromUserName,String toUserName){
			NewsMessage newsMessage = new NewsMessage();
			newsMessage.setToUserName(fromUserName);  
			newsMessage.setFromUserName(toUserName);  
			newsMessage.setCreateTime(new Date().getTime());  
			newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);  
			newsMessage.setArticleCount(2);
			
			List<Article> articles = new ArrayList<Article>();
			Article onlineConsult = new Article();
			onlineConsult.setTitle("同心管家宣传片");
			onlineConsult.setPicUrl(Constant.WeiXinServerURL+"activity/images/propaganda_film1.png");
			onlineConsult.setUrl("http://v.qq.com/boke/page/z/0/b/z0156yc3fxb.html");
			articles.add(onlineConsult);
			
			Article askOnline = new Article();
			askOnline.setTitle("同心管家APP下载");
			askOnline.setUrl(Constant.WeiXinServerURL+"activity/download_user.jsp");
			articles.add(askOnline);
			
			//Article newsArticle = new Article();
			//newsArticle.setTitle("医生版APP下载");
			//newsArticle.setUrl(Constant.WeiXinServerURL+"activity/download_doctor.jsp");
			//articles.add(newsArticle);
			
			
			
			newsMessage.setArticles(articles);
			return newsMessage;
		}
	
	private TextMessage getResponseTextMessage(String fromUserName,String toUserName){
		 // 回复文本消息  
        TextMessage textMessage = new TextMessage();  
        textMessage.setToUserName(fromUserName);  
        textMessage.setFromUserName(toUserName);  
        textMessage.setCreateTime(new Date().getTime());  
        textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);  
        textMessage.setFuncFlag(0);  
        return textMessage;
	}
	
	private NewsMessage getEventNewsMessage(String fromUserName,String toUserName,String link){
		NewsMessage newsMessage = new NewsMessage();
		newsMessage.setToUserName(fromUserName);  
		newsMessage.setFromUserName(toUserName);  
		newsMessage.setCreateTime(new Date().getTime());  
		newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);  
		newsMessage.setArticleCount(2);
		newsMessage.setArticles(getEventArticle(fromUserName, toUserName, link));
		return newsMessage;
	}
	
	private List<Article> getEventArticle(String fromUserName,String toUserName,String link){
		List<Article> arts = new ArrayList<Article>();
		Article firstArt = new Article();
		firstArt.setPicUrl(Constant.WeiXinServerURL+"activity/images/event.png");
		firstArt.setTitle("公众号介绍");
		firstArt.setUrl(Constant.WeiXinServerURL+"activity/introduce.jsp");
		arts.add(firstArt);
		Article secondArticle = new Article();
		secondArticle.setTitle("绑定用户");
		secondArticle.setUrl(Constant.WeiXinServerURL+"user/toBindAccount?OpenID="+fromUserName+"&link="+link);
		arts.add(secondArticle);
		return arts;
	}
	
	
	/**
	 * 获取讲座类型列表
	 * @param fromUserName
	 * @param toUserName
	 * @return
	 */
	private NewsMessage getActivityMessage(String fromUserName,String toUserName){
		NewsMessage newsMessage = new NewsMessage();
		newsMessage.setToUserName(fromUserName);  
		newsMessage.setFromUserName(toUserName);  
		newsMessage.setCreateTime(new Date().getTime());  
		newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);  
		newsMessage.setArticleCount(3);
		List<Article> articles = new ArrayList<Article>();
		Article newsArticle = new Article();
		newsArticle.setTitle("讲座预告");
		newsArticle.setPicUrl(Constant.WeiXinServerURL+"activity/images/new_activity_0309.png");
		newsArticle.setUrl(Constant.WeiXinServerURL+"getActivityList?activityStatus=1&pageIndex=1&thirdpartyAccount="+fromUserName);
		articles.add(newsArticle);
				
		Article oldArticle = new Article();
		oldArticle.setTitle("往期回顾");
		oldArticle.setUrl(Constant.WeiXinServerURL+"getActivityList?activityStatus=2&pageIndex=1&thirdpartyAccount="+fromUserName);
		articles.add(oldArticle);
		
		Article memoArticle = new Article();
		memoArticle.setTitle("讲座记录");
		memoArticle.setUrl(Constant.WeiXinServerURL+"getUserActivityList?activityStatus=-1&pageIndex=1&thirdpartyAccount="+fromUserName);
		articles.add(memoArticle);
		newsMessage.setArticles(articles);
		return newsMessage;
	}
	/**
	 * 图文消息(讲座)
	 * @param fromUserName
	 * @param toUserName
	 * @return
	 */
	private NewsMessage getResponseNewsMessage(String fromUserName,String toUserName,JSONArray jsonArray,Integer activityStatus){
		NewsMessage newsMessage = new NewsMessage();
		newsMessage.setToUserName(fromUserName);  
		newsMessage.setFromUserName(toUserName);  
		newsMessage.setCreateTime(new Date().getTime());  
		newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);  
		newsMessage.setArticleCount(jsonArray.size()+1);
		List<Article> articles = new ArrayList<Article>();
		for (int i = 0; i <jsonArray.size()+1; i++) {
			Article art = new Article();
			if(i == 0){
				if(activityStatus == 1){
					art.setTitle("讲座预告");
					art.setPicUrl(Constant.WeiXinServerURL+"activity/images/new_activity_0309.png");
					art.setUrl(Constant.WeiXinServerURL+"getActivityList?activityStatus="+activityStatus+"&pageIndex=1&thirdpartyAccount="+fromUserName);
				}else if(activityStatus == 2){
					art.setTitle("往期回顾");
					art.setPicUrl(Constant.WeiXinServerURL+"activity/images/old_activity_0309.png");
					art.setUrl(Constant.WeiXinServerURL+"getActivityList?activityStatus="+activityStatus+"&pageIndex=1&thirdpartyAccount="+fromUserName);
				}else if(activityStatus == -1){
					art.setTitle("讲座记录");
					art.setPicUrl(Constant.WeiXinServerURL+"activity/images/activity_records.png");
					art.setUrl(Constant.WeiXinServerURL+"getUserActivityList?activityStatus="+activityStatus+"&pageIndex=1&thirdpartyAccount="+fromUserName);
				}
			}else{
				JSONObject obj = jsonArray.getJSONObject(i-1);
				art.setTitle(obj.getString("ActivityName"));
				int status = activityStatus;
				int origin = activityStatus;
				if(activityStatus == -1){
					status = obj.getIntValue("ActivityStatus");
					origin = 3;
				}
				art.setUrl(Constant.WeiXinServerURL+"getActivityDetail?activityStatus="+status+"&activityId="+obj.getString("ActivityID")+"&thirdpartyAccount="+fromUserName+"&origin="+origin);
			}
			articles.add(art);
		}
		newsMessage.setArticles(articles);
		return newsMessage;
	}
	
	
	/**
	 * 书后天天知未绑定用户
	 * @param fromUserName
	 * @param toUserName
	 * @param link
	 * @return
	 */
	private NewsMessage getEverydayKnownNoUser(String fromUserName,String toUserName,String link){
		NewsMessage newsMessage = new NewsMessage();
		newsMessage.setToUserName(fromUserName);  
		newsMessage.setFromUserName(toUserName);  
		newsMessage.setCreateTime(new Date().getTime());  
		newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);  
		newsMessage.setArticleCount(1);
		List<Article> arts = new ArrayList<Article>();
		Article art = new Article();
		art.setPicUrl(Constant.WeiXinServerURL+"activity/images/everyday_banner.png");
		art.setTitle(" 如何了解 “术后天天知” 内容？");
		art.setDescription("您好！“术后天天知”是关于支架手术患者的术后康复注意事项，包括饮食、运动、用药、心理等方面。您需注册、完善个人相关信息并绑定后方可阅读。");
		art.setUrl(Constant.WeiXinServerURL+"everydayKnownIntroduceURL?thirdpartyAccount="+fromUserName+"&link="+link);
		arts.add(art);
		newsMessage.setArticles(arts);
		return newsMessage;
	}
	
	/**
	 * 图文消息(绑定用户)
	 * @param fromUserName
	 * @param toUserName
	 * @return
	 */
	private NewsMessage bindUser(String fromUserName,String toUserName,String link){
		NewsMessage newsMessage = new NewsMessage();
		newsMessage.setToUserName(fromUserName);  
		newsMessage.setFromUserName(toUserName);  
		newsMessage.setCreateTime(new Date().getTime());  
		newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);  
		newsMessage.setArticleCount(1);
		List<Article> articles = new ArrayList<Article>();
		Article art = new Article();
		art.setTitle("绑定用户");
		art.setUrl(Constant.WeiXinServerURL+"user/toBindAccountDirc?OpenID="+fromUserName+"&link="+link+"&ActionType=1");
		articles.add(art);
		newsMessage.setArticles(articles);
		return newsMessage;
	}
	
	private NewsMessage everydayKnown(String fromUserName,String toUserName,String title,String url){
		NewsMessage newsMessage = new NewsMessage();
		newsMessage.setToUserName(fromUserName);  
		newsMessage.setFromUserName(toUserName);  
		newsMessage.setCreateTime(new Date().getTime());  
		newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);  
		newsMessage.setArticleCount(1);
		List<Article> articles = new ArrayList<Article>();
		Article art = new Article();
		art.setTitle(title);
		art.setUrl(url);
		articles.add(art);
		newsMessage.setArticles(articles);
		return newsMessage;
	}
	
	
	private String checkServerImpl(HttpServletRequest request,HttpServletResponse response){
		String signature = request.getParameter("signature"); //微信加密密匙
		String timestamp = request.getParameter("timestamp"); //时间戳
		String nonce = request.getParameter("nonce"); //随机数
		String echostr = request.getParameter("echostr");//随机字符串
        // 通过检验signature对请求进行校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败  
        if (SignUtil.checkSignature(signature, timestamp, nonce)) {  
            return echostr;  
        }  
        return "";
	}
	
	@Override
	public String checkAccountIsBind(String thirdPartyAccount){
		try {
			JSONObject checkParam=new JSONObject();
			checkParam.put("ThirdPartyAccount",thirdPartyAccount);
			checkParam.put("ApplicationID","4");
			checkParam.put("TATID", 1);
			JSONObject resultObject = AbuttUtil.getResponseJSON(CHECK_ACCOUNT_IS_BIND, checkParam.toJSONString());
			int status = resultObject.getIntValue("Status");
			String errorMsg = resultObject.getString("Message");
			if(status == 200){
				System.out.println(resultObject.getInteger("UserID"));
				return resultObject.getInteger("UserID")+"";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}


	/**
	 * 讲获取到的更多数据拼接成html串
	 */
	@Override
	public String montageHTML(JSONArray jsonArray,Integer activityStatus,String thirdpartyAccount,Integer origin) {
		StringBuffer htmlStr = new StringBuffer();
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject json = jsonArray.getJSONObject(i);
			htmlStr.append("<section class='first'>").append("<a href='getActivityDetail?activityId=").append(json.get("ActivityID")).append("&activityStatus=").append(activityStatus).append("&thirdpartyAccount=").append(thirdpartyAccount).append("&origin=").append(origin).append("'>").append("<div class='list'>");
			if(Integer.parseInt(json.get("ActivityType").toString()) == 1){
				htmlStr.append("<div class=''>").append("</div>");
			}/*else if(json.get("IsApply").equals(true) && activityStatus == 1 && Integer.parseInt(json.get("ActivityType").toString()) != 1){
				htmlStr.append("<div class='status status_01'>").append("报名中").append("</div>");
			}else{
				htmlStr.append("<div class='status status_02'>").append("已报满").append("</div>");
			}*/
			htmlStr.append("<div class='title'>").append(cutActivityName(String.valueOf(json.get("ActivityName")))).append("</div>");
			htmlStr.append("<div class='date'>").append(json.get("StartTime").toString().substring(0, 10)).append("</div>");
			if(json.get("ActivityType").equals(1)){
				htmlStr.append("<div class='type'><img src='http://weixin.ixinzang.com/activity/images/notice_icon.png'/>").append("<span>公告</span>").append("</div>");
			}else if(json.get("ActivityType").equals(2)){
				htmlStr.append("<div class='type'><img src='http://weixin.ixinzang.com/activity/images/phone_icon.png'/>").append("<span>电话会议</span>").append("</div>");
			}else if(json.get("ActivityType").equals(3)){
				htmlStr.append("<div class='type'><img src='http://weixin.ixinzang.com/activity/images/net_icon.png'/>").append("<span>网络直播</span>").append("</div>");
			}else if(json.get("ActivityType").equals(4)){
				htmlStr.append("<div class='type'><img src='http://weixin.ixinzang.com/activity/images/phone_net.png'/>").append("<span>电话&网络</span>").append("</div>");
			}else{
				htmlStr.append("<div class='type'><img src='http://weixin.ixinzang.com/activity/images/address.png'/>").append("<span>").append(json.get("Address")).append("</span>").append("</div>");
			}
			htmlStr.append("<div class='content'>").append(json.get("Description")).append("</div>");
			htmlStr.append("</div></a></section>");
		}
		return htmlStr.toString();
	}  
	
	private String cutActivityName(String activityName){
		if(activityName.length() > 12){
			activityName = activityName.substring(0, 12)+"...";
		}
		return activityName;
	}

	@Override
	public  JSONObject checkAccountHasMedicalHistory(String userId) {
		try {
			JSONObject checkParam=new JSONObject();
			checkParam.put("UserID",userId);
			JSONObject resultObject = AbuttUtil.getResponseJSON(CHECK_ACCOUNT_HAS_MEDICAL_HISTORY, checkParam.toJSONString());
			int status = resultObject.getIntValue("Status");
			//String errorMsg = resultObject.getString("Message");
			if(status == 200){
				System.out.println(resultObject.getInteger("UserID"));
				return resultObject;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public Integer fromToday(String surgicalTime) {
		long between_days = 0;
		 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
        try {
        	Calendar cal = Calendar.getInstance();    
			cal.setTime(sdf.parse(surgicalTime));
			long time1 = cal.getTimeInMillis();                 
			cal.setTime(new Date());    
			long time2 = cal.getTimeInMillis();         
			between_days=(time2-time1)/(1000*3600*24);  
		} catch (ParseException e) {
			e.printStackTrace();
		}    
       return Integer.parseInt(String.valueOf(between_days));   
	}

	@Override
	public Integer daysToWeek(Integer days) {
		Integer weeks = days / 7;
		if(days % 7 > 0){
			weeks++;
		}
		if(weeks >= 52){
			weeks = 52;
		}
		return weeks;
	}
	
	private String getAutoRespone(String content,String thirdPartyAccount){
		String userId = checkAccountIsBind(thirdPartyAccount);
		String responseContent = "";
		try{
			JSONObject autoParam = new JSONObject();
			autoParam.put("ApplicationID", 4);
			autoParam.put("Question", content);
			autoParam.put("UserID", userId);
			autoParam.put("PageIndex", 1);
			autoParam.put("PageSize", 1);
			logger.info("**************************请求参数："+autoParam.toJSONString());
			JSONObject resultObject = AbuttUtil.getResponseJSON(GET_AUTO_RESPONSE, autoParam.toJSONString());
			
			
			int status = resultObject.getIntValue("Status");
			String errorMsg = resultObject.getString("Message");
			if(status == 200){
				JSONArray responseArray =  resultObject.getJSONArray("ListInfo");
				responseContent = resultObject.getJSONObject("DetailInfo").getString("Message");
				responseContent += "\n";
				for (int i = 0; i < responseArray.size(); i++) {
					JSONObject obj = responseArray.getJSONObject(i);
					responseContent += obj.getString("ARQuestion") + "\n";
					responseContent += obj.getString("ARAnswer") + "\n\n";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return responseContent;
	}
	
	public static void main(String[] args) {
		
		//System.out.println(isBetween("2016-07-18 16:36:00", "2016-07-18 16:36:59"));
	}

	@Override
	public String montageInstitutionHTML(JSONArray jsonArray) {
		StringBuffer htmlStr = new StringBuffer();
		htmlStr.append("<ul>");
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject json = jsonArray.getJSONObject(i);
			htmlStr.append("<li id="+json.getString("InstitutionID")+" onclick='getInstitutionID("+json.getString("InstitutionID")+");'>").append(json.getString("InstitutionName")).append("</li>");
		}
		htmlStr.append("</ul>");
		return htmlStr.toString();
	}

	@Override
	public String montageArticleHTML(JSONArray list) {
		StringBuffer htmlStr = new StringBuffer();
		for (int i = 0; i < list.size(); i++) {
			JSONObject art = list.getJSONObject(i);
			htmlStr.append("<section>");
			htmlStr.append("<a href='getArticleDetail?articleID=").append(art.getInteger("ArticleID")).append("'  class='clearfix'>");
			htmlStr.append("<div class='img'><img src='").append(art.get("Cover")).append("' alt='' /></div>");
			htmlStr.append("<div class='desc'><div class='title'>").append(art.getString("ArticleTitle")).append("</div>");
			htmlStr.append("<div class='cont'>").append(art.getString("ArticleDescription")).append("</div></div></a> </section>");
		}
		return htmlStr.toString();
	}
	
	private void sendWelcomMsgDelay(String toUserName,String msg,long millis){
		  try{
			  final String sendTo = toUserName;
			  final String sendMsg = msg;
			  final long delayMillis = millis;
			 Thread t =  new Thread(new Runnable() {
				
				@Override
				public void run() {
					try {
						Thread.sleep(delayMillis);
						AccessToken accessToken = WeixinUtil.getAccessToken();
						  String url = CUSTOM_SERVICE_SEND_MESSAGE_URL.replace("ACCESS_TOKEN", accessToken.getToken());  
						  CustomServiceTextMsg cstm = new CustomServiceTextMsg();
						  cstm.setTouser(sendTo);
						  cstm.setMsgtype("text");
						  TextMsg textMsg = new TextMsg();
						  textMsg.setContent(sendMsg);
						  cstm.setText(textMsg);
						// 将菜单对象转换成json字符串  
						String jsonCstm = JSONObject.toJSONString(cstm); 
						httpRequest(url, "POST", jsonCstm);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						logger.error("发送咨询信息失败:toUserName"+sendTo+"  sendMsg:"+sendMsg);
					}
				}
			});
			  
			t.start();  
		  }catch(Exception e){
			  logger.error("sendWelcomMsg error:{}", e);  
		  }
		  
	  }
	
	/**
	   * 发起Http请求
	   * @author yanyonglin
	   * @param requestUrl
	   * @param requestMethod
	   * @param outputStr
	   * @return
	   */
	  private JSONObject httpRequest(String requestUrl, String requestMethod, String outputStr) {  
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
	  
	  	public    boolean isBeforeNow(String yyyyMMdd){
			
			boolean flag = false;
			try{
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				if(df.parse(yyyyMMdd).getTime()<new Date().getTime()){
					flag = true;
				}
			}catch(Exception e){e.printStackTrace();}
			
			return flag;
		}
	  	
	  	public    boolean isBetween(String beginyyyyMMdd,String endyyyMMdd){
			
			boolean flag = false;
			try{
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				if(df.parse(beginyyyyMMdd).getTime()<new Date().getTime()&&df.parse(endyyyMMdd).getTime()>new Date().getTime()){
					flag = true;
				}
			}catch(Exception e){e.printStackTrace();}
			
			return flag;
		}
	  	
	  	 public    boolean isAfterNow(String yyyyMMdd){
				
				boolean flag = false;
				try{
					DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
					if(df.parse(yyyyMMdd).getTime()>new Date().getTime()){
						flag = true;
					}
				}catch(Exception e){e.printStackTrace();}
				
				return flag;
			}
	  	private String getCache(String key){
			String value= RedisHelper.getValue(key);
			if(StringUtils.isBlank(value)){
				value="{'Type':'Bool','Status':'404','Message':'无"+key+"缓冲'}";
			}
			return value;
		}
	  	private boolean dateCompare(String StartTime,String EndTime) throws ParseException{
	  		boolean returnfalg = false;
			if(StringUtils.isBlank(StartTime) || StringUtils.isBlank(EndTime)){
				return returnfalg;
			}
			Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date startDate = sdf.parse(StartTime);
			Date endDate = sdf.parse(EndTime);
			if(d.after(startDate)&&d.before(endDate)){
				returnfalg = true;
			}
			return returnfalg;
		}
	  	private List<Article> getArticleDetail(String ArticleID, String ArticleTitle,String Cover){
	  	  List<Article> arts = new ArrayList<Article>();
	      Article article = new Article();
	  	  Article knowArticle = new Article();
	  	  knowArticle.setTitle(ArticleTitle);
	  	  knowArticle.setPicUrl(Cover);
	  	  knowArticle.setUrl(Constant.WeiXinServerURL+"getArticleDetail?articleID="+ArticleID);
	  	  arts.add(knowArticle);
	        return arts;
	    }
	  	private NewsMessage getNewsMessage(String fromUserName, String toUserName, int count, List<Article> articles)
	    {
	      NewsMessage newsMessage = new NewsMessage();
	      newsMessage.setToUserName(fromUserName);
	      newsMessage.setFromUserName(toUserName);
	      newsMessage.setCreateTime(new Date().getTime());
	      newsMessage.setMsgType("news");
	      newsMessage.setArticleCount(count);
	      newsMessage.setArticles(articles);
	      return newsMessage;
	    }
	  	
	  	private List<Article> getNationalDayList(String Title,String Cover,String LinkURL){
	  	  List<Article> arts = new ArrayList<Article>();
	  	  Article knowArticle = new Article();
	        knowArticle.setTitle(Title);
	        knowArticle.setPicUrl(Cover);
	        knowArticle.setUrl(LinkURL);
	        arts.add(knowArticle);
	  	  return arts;
	    } 
	  	
	  	private PictureMessage getPictureMessage(String fromUserName, String toUserName,String mediaId)
	    {
	      PictureMessage pictureMessage = new PictureMessage();
	      pictureMessage.setToUserName(fromUserName);
	      pictureMessage.setFromUserName(toUserName);
	      pictureMessage.setCreateTime(new Date().getTime());
	      pictureMessage.setMsgType("image");
	      Image image = new Image();
	      image.setMediaId(mediaId);
	      pictureMessage.setImage(image);
	      return pictureMessage;
	    }
}
