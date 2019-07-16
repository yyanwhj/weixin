package com.weixin.util;


public class Page {

	/*private int pageCount;//总页数
	private int pageIndex;//页码
	private int dataCount;//总记录数
	
	
	public Page(int pageIndex,int dataCount) {
		this.pageIndex = pageIndex;
		this.dataCount = dataCount;
		
		int pageCount=0;
		if(dataCount%Constant.PAGE_SIZE==0){
			pageCount=dataCount/Constant.PAGE_SIZE;
		}else{
			pageCount=1+(dataCount/Constant.PAGE_SIZE);
		}
		this.pageCount = pageCount;
		
	}
	public int getPageCount() {
		return pageCount;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public int getDataCount() {
		return dataCount;
	}
	@Override
	public String toString() {
		return "分页信息：总页="+pageCount+"，第"+pageIndex+"页";
	}*/
	
	
	public static String GetPagerSeo(int pageIndex, int dataCount, int pageSize, String pageURL, int pageButtonCount, boolean usePageButtonImage, boolean alwaysDisplayNaviButton, String firstPageButtonText, String lastPageButtonText, String previousPageButtonText, String nextPageButtonText)
	{
		int pageCount = (int)((dataCount - 1) / pageSize + 1);
		String tempPageUrl = "";

		if (pageIndex < 1)
		{
			pageIndex = 1;
		}
		else if (pageIndex > pageCount)
		{
			pageIndex = pageCount;
		}

		//初始化页面按钮文本
		if (usePageButtonImage == true)
		{
			firstPageButtonText = "";
			lastPageButtonText = "";
			previousPageButtonText = "";
			nextPageButtonText = "";
		}

		StringBuilder sb = new StringBuilder();

		//计算起始和终止页码
		int endButton = (int)(pageIndex + (pageButtonCount - 1) / 2);
		int startButton = (int)(endButton + 1 - pageButtonCount);


		if (pageButtonCount >= pageCount)
		{
			startButton = 1;
			endButton = pageCount;
		}
		if (endButton > pageCount)
		{
			startButton = startButton - (endButton - pageCount);
			endButton = pageCount;
		}
		if (startButton < 1)
		{
			endButton = endButton + (1 - startButton);
			startButton = 1;
		}
		if (pageCount == 1)
		{
			startButton = 1;
			endButton = 1;
		}

		sb.append("<div class='page'>");

		//创建第一页button
		if (pageIndex > 1)
		{
			tempPageUrl = pageURL.replace("{0}", "1");   
			sb.append("<a href='" + tempPageUrl + "' class='firstPageButton'>" + firstPageButtonText + "</a>");
		}
		else
		{
			if (alwaysDisplayNaviButton==true)
			{
				sb.append("<a href='javascrip:void(0);' onclick='return false;' class='firstPageButton'>" + firstPageButtonText + "</a>");
			}
		}

		//创建上一页button
		if (pageIndex > 1)
		{
			int previousPageIndex = pageIndex - 1;
			tempPageUrl = pageURL.replace("{0}", previousPageIndex+"");  
			sb.append("<a href='" + tempPageUrl + "' class='previousPageButton'>" + previousPageButtonText + "</a>");
		}
		else
		{
			if (alwaysDisplayNaviButton == true)
			{
				sb.append("<a href='javascrip:void(0);' onclick='return false;' class='previousPageButton'>" + previousPageButtonText + "</a>");
			}
		}


		//创建页码
		for (int i = startButton; i < endButton + 1; i++)
		{
			if (i == pageIndex)
			{
				sb.append("<a herf='javascrip:void(0);' onclick='return false;' class='currentPageButton'>" + pageIndex + "</a>");
			}
			else
			{
				tempPageUrl = pageURL.replace("{0}", i+"");  
				sb.append("<a href='" + tempPageUrl + "' class='pageButton'>" + i + "</a>");
			}
		}

		//创建下一页button
		if (pageCount > pageIndex)
		{
			int nextPageIndex = pageIndex + 1;
			tempPageUrl = pageURL.replace("{0}", nextPageIndex+"");  
			sb.append("<a href='" + tempPageUrl + "' class='nextPageButton'>" + nextPageButtonText + "</a>");
		}
		else
		{
			if (alwaysDisplayNaviButton == true)
			{
				sb.append("<a href='javascrip:void(0);' onclick='return false;' class='nextPageButton'>" + nextPageButtonText + "</a>");
			}
		}

		//创建最后一页button
		if (pageIndex < pageCount)
		{
			tempPageUrl = pageURL.replace("{0}", pageCount+"");  
			sb.append("<a href='" + tempPageUrl + "' class='lastPageButton'>" + lastPageButtonText + "</a>");
		}
		else
		{
			if (alwaysDisplayNaviButton == true)
			{
				sb.append("<a href='javascrip:void(0);' onclick='return false;' class='lastPageButton'>" + lastPageButtonText + "</a>");
			}
		}

		sb.append("</div>");

		return sb.toString();


	}
	
}
