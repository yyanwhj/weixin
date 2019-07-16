<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="../common/taglib.jsp"%>
<!doctype html>
<html>
	<head> 
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width user-scalable=no" />
		<title></title>
		<link rel="stylesheet" href="<%=basePath%>activity/css/video.css">
		 <link rel="stylesheet" href="<%=basePath %>css/layer.css"/>
		<script type="text/javascript" src="<%=basePath %>activity/js/jquery-1.11.1.min.js"></script>
		    <script src="<%=basePath %>js/layer3.1/layer.js"></script>
    <script src="<%=basePath %>js/common.js"></script>
		<script>
			var html=document.getElementsByTagName("html")[0];
			var width=html.getBoundingClientRect().width;
			html.style.fontSize=width/18+"px";
		</script>

	</head>
	<body>
	<input type="hidden" id="ArticleTag" name="ArticleTag" value="${ArticleTag}">
	<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex}">
	<input type="hidden" id="thirdpartyAccount" name="thirdpartyAccount" value="${thirdpartyAccount}">
	<input type="hidden" id="dataCount" name="dataCount" value="${dataCount}">
	
	<c:if test="${videoList == null||fn:length(videoList) == 0}">
					<span style="text-align: center;width: 100%;height:100%; display: block;line-height: 20rem;background: #DADADA">暂无视频</span>
		</c:if>
	<div id="videoBox">
	
	<c:if test="${videoList == null||fn:length(bannerList) gt 0}">
		<header class="head">
		<c:forEach items="${bannerList}" var="banner" varStatus="status">
		<c:if test="${status.index == 0 }">
			<a href="<%=basePath%>getVideoDetail?ArticleID=${bannerList[0].ArticleID}&thirdpartyAccount=${thirdpartyAccount}">
				<img src="${bannerList[0].Cover }" width="100%" />
			</a>
			<div class="text">
				<div class="bgColor"></div>
				<p>${bannerList[0].ArticleTitle}</p>
			</div>
		</c:if>
			
		
			
		</c:forEach>
		</header>
		</c:if>
		<div class="content">
		
		<c:if test="${videoList != null&&fn:length(videoList) gt 0}">
			<header>
				<span class="icon"></span>
				<span class="title" style="font-style: normal;">全部视频</span>
			</header>
			<ul class="vedio clearfix" id="VidelListUL">
				
				<c:forEach items="${videoList}" var="video">
					<li class="vedio_list fl">
					<a href="<%=basePath%>getVideoDetail?ArticleID=${video.ArticleID}&thirdpartyAccount=${thirdpartyAccount}"><img src="${video.Cover }" width="100%" /></a>
					<div class="info">
						<p class="subtitle">${video.ArticleTitle}</p>
						<p class="playnum">播放&nbsp;<span>${video.ViewCount}</span></p>
					</div>
				</li>
				</c:forEach>
			
			</ul>
			<div id="loadDiv" style="height:1.6rem;line-height:1.6rem;font-size:.6rem; width:100%;text-align: center;" onclick="loadMoreVideo()" >加载更多</div>
			</c:if>
			
			
		</div>
		</div>
		
		<script type="text/javascript">
		var loadVideoFlag = true;
		var loadVidwoFinishFlag = true;
		
		//检查是否已经加载完成
		function checkFinish(){
			 var liNum = $("#VidelListUL li").size();
			  var dataCount = $("#dataCount").val();
			  
			  if(liNum == dataCount){
				  loadVideoFlag= false;
					$("#loadDiv").text("没有更多数据了");
			  }
		}
   $(function(){
	   checkFinish();
   });
		
	function loadMoreVideo(){
		
		if(!(loadVideoFlag&&loadVidwoFinishFlag)){
			$("#loadDiv").text("没有更多数据了");
	    	return;
	    	
	    }
		
		var pageIndex = parseInt($("#pageIndex").val());
		var thirdpartyAccount = $("#thirdpartyAccount").val();
		var ArticleTag = $("#ArticleTag").val();
		$.ajax({
			type : "post",//无此配置，提交中文乱码
			cache : false,
			async:true,
			url : "${pageContext.request.contextPath}/getMoreVideoList",
			data:{pageIndex: pageIndex,ArticleTag:ArticleTag,thirdpartyAccount:thirdpartyAccount},
			dataType : "json",
			beforeSend:function(){
				loadVidwoFinishFlag = false;
			},
			success : function(data) {
				if(data.Result.Status == 200){
					if(data.Result.result.length>0){
						//如果还有数据
						
						var articleArr = data.Result.result;
						
						if(articleArr.length<6){
							loadVideoFlag= false;
							$("#loadDiv").text("没有更多数据了");
						}
						for(var i=0;i<articleArr.length;i++){
							var article = articleArr[i];
							var html ='<li class="vedio_list fl">';
							html+= '<a href="<%=basePath%>getVideoDetail?ArticleID='+article.ArticleID+'&thirdpartyAccount='+thirdpartyAccount+'"><img src="'+article.Cover+'" width="100%" /></a>';
							html += '<div class="info">';
							html += '<p class="subtitle">'+article.ArticleTitle+'</p>';
							html += '<p class="playnum">播放&nbsp;<span>'+article.ViewCount+'</span></p>';
							html += '</div>';
							html += '</li>';
							
							$("#VidelListUL").append(html);
							
						}
						
					}else{
						loadVideoFlag= false;
						$("#loadDiv").text("没有更多数据了");
						//alertCommonBox("没有更多了");
						
					}
					
					$("#pageIndex").val(data.Result.pageIndex);
					 checkFinish();
					//alert($('#VidelListUL').offset().top);
				}else{
					alertCommonBox("获取失败");
				}
				
				loadVidwoFinishFlag = true;
			},error:function(){
				loadVidwoFinishFlag = true;
			}
		});
	}
 
</script>
	</body>
</html>
