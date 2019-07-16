<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     <title>视频详情</title>
    <meta content="telephone=no" name="format-detection">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge, chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" href="<%=basePath%>activity/css/reset.css"/>
    <link rel="stylesheet" href="<%=basePath%>activity/css/videoDetail.css"/>
    <script src="js/jquery-1.11.1.min.js"></script>
  </head>
   <%-- src="http://v.qq.com/iframe/player.html?vid=${DetailInfo.LinkTargetID}&amp;auto=0" --%>
  <body>
    <div class="page">
    <div class="content">
        <div class="video-box">
            <iframe class="video_iframe"
                src="${DetailInfo.LinkURL}&amp;auto=0"
                allowfullscreen=""
                frameborder="0"
                width="100%">
            </iframe>
        </div>
        <div class="tools">
            <div class="tag-box">
                <!-- <img src="images/video_picks/addTime2.png" alt=""/> -->
                <span class="time-sub">${DetailInfo.PublishDate }</span>
                <span class="fabuTime"></span>
            </div>
            
            <div class="tag-box">
                <span><i>·</i>播放</span>
                <span>${DetailInfo.ViewCount }</span>
            </div>
            <div class="tag-box">
                <!-- <img src="images/video_picks/collect2.png" alt=""/> -->
                <span><i></i>
                
                 <!--分享
                <div class="videoDetailShare">
                    <div class="jiathis_style">
                        <span class="jiathis_txt">分享到：</span>
					    <a class="jiathis_button_weixin"></a>
					    <a class="jiathis_button_qzone"></a>
					    <a class="jiathis_button_tqq"></a>
					    <a class="jiathis_button_tsina"></a>
					    <a class="jiathis_button_renren"></a>
					    <a class="jiathis_button_cqq"></a>
					    <a class="jiathis_button_xiaoyou"></a>
					    <a href="http://www.jiathis.com/share?uid=2078083" class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank"></a>
					    <a class="jiathis_counter_style"></a>
                    </div>
                    <script type="text/javascript" >
                    	var murl = '<%=basePath%>/article/StoryDetail/1/${StoryDetail.ArticleID}';
                    	/* var gsnr = '${StoryDetail.ArticleDescription }';
                    	gsnr = gsnr.substring(0, 60); */
				        var jiathis_config={
				            data_track_clickback:true,
				            url:murl,
				            sm:"qzone,tsina,weixin,tqq,renren,cqq,tieba,kaixin001,t163,douban,xiaoyou,hi,copy",
				            /* summary:gsnr, //简介内容 */
				            title:'${StoryDetail.ArticleTitle }',//标题
				            shortUrl:false,
				            hideMore:false
				        }
				    </script>
                    <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
                </div>-->
                </span>
                <span>
                
                </span>
            </div>
        </div>
        <div class="info-box detail-box">
            <div class="title">
                简介：
            </div>
            <div class="info-details">
               ${DetailInfo.ArticleContent }
            </div>
        </div>
    </div>
</div>
<script>
    $(function(){
    	var time = $(".time-sub").text();
    	var yue = time.substr(5,2);
    	var ri = time.substr(8,2);
    	var str = yue+"月"+ri+"日";
    	$(".fabuTime").text(str);
        $(".video-box").height(($(".video-box").width()/16)*9);
        $(".video-box iframe").height(($(".video-box iframe").width()/16)*9);
    });
</script>
  </body>
</html>
