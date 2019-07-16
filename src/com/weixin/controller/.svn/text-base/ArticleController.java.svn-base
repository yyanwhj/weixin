package com.weixin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.weixin.util.AbuttUtil;
import com.weixin.util.Constant;

@Controller
@RequestMapping("/article")
public class ArticleController extends BaseController{
	/**
	 * @Description: 微信文章列表
	 * @author       banliang
	 * @Date         2017-04-25
	 */
	@RequestMapping("getArticleList")
	public String getArticleList(HttpServletRequest request,HttpServletResponse response){
		String jsp = "common/error";
		JSONObject param = new JSONObject();
		param.put("DeviceID", 5);
		param.put("ApplicationID", 4);
		param.put("CategoryID", request.getParameter("CategoryID"));//默认冠心病
		param.put("PageSize", 5);
		JSONObject resultObject1=AbuttUtil.getResponseJSON("article/getArticleCategoryList", param.toJSONString());
		JSONArray categoryArray =  resultObject1.getJSONArray("CategoryList");
		String ACID = "";
		if(categoryArray != null){
			JSONObject categoryJSONObject = (JSONObject) categoryArray.get(0);
			ACID = categoryJSONObject.getString("ACID");
		}
		param.put("ACID", ACID);
		JSONObject resultObject=AbuttUtil.getResponseJSON("article/getWeiXinArticleList", param.toJSONString());
		if(resultObject.get("Status").equals("200")){
			request.setAttribute("imgHost", Constant.IMG_PATH);
			request.setAttribute("ArticleList", resultObject.getJSONArray("ListInfo"));
			request.setAttribute("CategoryList", resultObject1.getJSONArray("CategoryList"));
			jsp = "article/article_recommend";
		}
		return jsp;
	}
	/**
	 * @Description: 微信文章banner list
	 * @author       banliang
	 * @Date         2017-04-25
	 */
	@RequestMapping("getArticleBannerList")
	public String getArticleBannerList(HttpServletRequest request,HttpServletResponse response){
		JSONObject param = new JSONObject();
		param.put("DeviceID", 5);
		param.put("ApplicationID", 4);
		JSONObject resultObject=AbuttUtil.getResponseJSON("article/getArticleBannerList", param.toJSONString());
		request.setAttribute("imgHost", Constant.IMG_PATH);
		request.setAttribute("BannerList", resultObject.getJSONArray("ListInfo"));
		return "article/article_recommend_banner";
	}
	/**
	 * @Description: 文章一级分类列表
	 * @author       banliang
	 * @Date         2017-04-26
	 */
	@RequestMapping("getArticleCategoryList")
	public String getArticleCategoryList(HttpServletRequest request,HttpServletResponse response){
		JSONObject param = new JSONObject();
		param.put("DeviceID", 5);
		param.put("ApplicationID", 4);
		param.put("CategoryID", request.getParameter("CategoryID"));//默认冠心病
		param.put("PageSize", 5);
		String ACID = "";
		JSONObject resultObject1=AbuttUtil.getResponseJSON("article/getArticleCategoryList", param.toJSONString());
		JSONArray categoryArray =  resultObject1.getJSONArray("CategoryList");
		if(categoryArray != null){
			JSONObject categoryJSONObject = (JSONObject) categoryArray.get(0);
			ACID = categoryJSONObject.getString("ACID");
		}
		param.put("ACID", ACID);
		JSONObject resultObject=AbuttUtil.getResponseJSON("article/getWeiXinArticleList", param.toJSONString());
		request.setAttribute("imgHost", Constant.IMG_PATH);
		request.setAttribute("ArticleList", resultObject.getJSONArray("ListInfo"));
		request.setAttribute("CategoryList", resultObject1.getJSONArray("CategoryList"));
		return "article/article_recommend_category";
	}
	/**
	 * @Description: 文章二级分类列表
	 * @author       banliang
	 * @Date         2017-04-26
	 */
	@RequestMapping("getArticleACList")
	public String getArticleACList(HttpServletRequest request,HttpServletResponse response){
		JSONObject param = new JSONObject();
		param.put("DeviceID", 5);
		param.put("ApplicationID", 4);
		param.put("ACID", request.getParameter("ACID"));
		String PageIndex = request.getParameter("PageIndex");
		if(PageIndex != null){
			param.put("PageIndex", PageIndex);
		}
		param.put("PageSize", 5);
		JSONObject resultObject=AbuttUtil.getResponseJSON("article/getWeiXinArticleList", param.toJSONString());
		request.setAttribute("ArticleList", resultObject.getJSONArray("ListInfo"));
		request.setAttribute("ArticleCount", resultObject.getJSONArray("ListInfo").size());
		return "article/article_recommend_AC";
	}
	/**
	 * @Description: 微信号内搜索列表
	 * @author       banliang
	 * @Date         2017-05-16
	 */
	@RequestMapping("getSearchArticleList")
	public String getSearchArticleList(HttpServletRequest request,HttpServletResponse response){
		String jsp = "common/error";
		String Keyword = request.getParameter("Keyword");
		JSONObject param = new JSONObject();
		param.put("DeviceID", 5);
		param.put("ApplicationID", 4);
		param.put("PageSize", 5);
		param.put("Keyword", Keyword);
		String PageIndex = request.getParameter("PageIndex");
		if(PageIndex != null){
			param.put("PageIndex", PageIndex);
		}
		JSONObject resultObject=AbuttUtil.getResponseJSON("article/getSearchArticleList", param.toJSONString());
		if(resultObject.get("Status").equals("200")){
			request.setAttribute("imgHost", Constant.IMG_PATH);
			request.setAttribute("DataCount", resultObject.getInteger("DataCount"));
			request.setAttribute("ArticleList", resultObject.getJSONArray("ListInfo"));
			request.setAttribute("IsShowData", "true");
			request.setAttribute("Keyword", Keyword);
			jsp = "article/article_search";
		}
		return jsp;
	}
	/**
	 * @Description: 微信号内搜索列表
	 * @author       banliang
	 * @Date         2017-05-16
	 */
	@RequestMapping("getSearchArticleListMore")
	public String getSearchArticleListMore(HttpServletRequest request,HttpServletResponse response){
		String jsp = "common/error";
		String Keyword = request.getParameter("Keyword");
		JSONObject param = new JSONObject();
		param.put("DeviceID", 5);
		param.put("ApplicationID", 4);
		param.put("PageSize", 5);
		param.put("Keyword", Keyword);
		String PageIndex = request.getParameter("PageIndex");
		if(PageIndex != null){
			param.put("PageIndex", PageIndex);
		}
		JSONObject resultObject=AbuttUtil.getResponseJSON("article/getSearchArticleList", param.toJSONString());
		if(resultObject.get("Status").equals("200")){
			request.setAttribute("imgHost", Constant.IMG_PATH);
			request.setAttribute("ArticleList", resultObject.getJSONArray("ListInfo"));
			jsp = "article/article_search_more";
		}
		return jsp;
	}
	
	//康复讲座视频
	@RequestMapping("getRehabilitationVideo")
	public String getRehabilitationVideo(HttpServletRequest request,HttpServletResponse response){
		JSONObject param = new JSONObject();
		param.put("DeviceID", 5);
		param.put("ApplicationID", 4);
		param.put("SortDirection", "DESC");
		param.put("ArticleTag", "百科讲座");
		param.put("PageIndex", 1);
		param.put("PageSize", 10);
		
		JSONObject resultObject  =AbuttUtil.getResponseJSON("pasm/getVideoPageData", param.toJSONString()); 
		
		JSONArray listInfo = resultObject.getJSONArray("ListInfo");
		request.setAttribute("videoList", listInfo);
		
		return "article/rehabilitation_video";
	}
	
	@RequestMapping("/ajax/getRehabilitationVideo")
	public void getAjaxRehabilitationVideo(HttpServletRequest request,HttpServletResponse response){
		try{
			JSONObject param = new JSONObject();
			String ArticleTag = request.getParameter("ArticleTag");
			Integer pageIndex = Integer.parseInt(request.getParameter("pageIndex")); 
			param.put("DeviceID", 5);
			param.put("ApplicationID", 4);
			param.put("SortDirection", "DESC");
			param.put("ArticleTag", ArticleTag);
			param.put("PageIndex", pageIndex);
			param.put("PageSize", 10);
			
			JSONObject resultObject  =AbuttUtil.getResponseJSON("pasm/getVideoPageData", param.toJSONString()); 
			
			outJsonString(resultObject.toJSONString(), response);
			System.out.println("--------------"+resultObject.toJSONString());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//康复直播预告
	@RequestMapping("/getRehabilitationLivePreview")
	public String getRehabilitationLivePreview(HttpServletRequest request,HttpServletResponse response){
		JSONObject param = new JSONObject();
		param.put("DeviceID", 5);
		param.put("ApplicationID", 4);
		param.put("PageSize", 1);
		param.put("ACID", request.getParameter("ACID"));
		
		JSONObject resultObject=AbuttUtil.getResponseJSON("article/getWeiXinArticleList", param.toJSONString());
		if(resultObject.get("Status").equals("200")){
			request.setAttribute("ArticleList", resultObject.getJSONArray("ListInfo"));
		}
		return "article/rehabilitation_live_preview";
	}
}
