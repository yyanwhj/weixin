<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>APP介绍</title>
        <meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
        <meta content="yes" name="apple-mobile-web-app-capable">
        <meta content="black" name="apple-mobile-web-app-status-bar-style">
        <meta content="telephone=no" name="format-detection">
        <link rel="stylesheet" href="<%=basePath %>activity/css/base.css" />
        <style>
            p.text{font-size:16px;color:#515151;text-indent:2em;line-height:2em; margin:0 1em;}
            p.text:last-child{padding-bottom:1em;}
            .logo img{
                width:30%;
                margin:2em 35%;
            }
        </style>
    </head>
    <body>
            <div class="logo"><img src="<%=basePath %>activity/images/logo.png" alt="" /></div>
            <p class="text">经皮冠状动脉介入治疗即PCI手术是目前治疗冠心病最主要的手段，患者通过植入支架可以解除病痛，延长生命，提高生活质量，但是支架的植入并非是一劳永逸，而只是治疗的开始，术后还需要经过长期、专业、系统的康复指导才能达到良好的愈后效果。同心管家是目前市场上唯一一款针对支架术后患者康复指导的APP应用软件，它用现代化的移动互联技术和传统的电话咨询，用最便捷的方式为患者提供个性化的术后解决方案。同心管家公众版APP包括术后天天知、在线咨询、电话咨询、医学讲座、健康商城、康复百科、主治医生、家庭共享等功能。</p>
            <p class="text">同心管家还推出了医生版APP，为医生提供一个免费的管理、优化平台。患者只需通过“主治医生”版块的扫描功能扫描医生二维码，即可建立与医生的联系。医生可以对患者资料汇总管理，为患者答疑解惑，发布消息公告，以实现建立个人品牌、优化工作流程。</p>
            <p class="text">同心管家APP实现了全新的康复管理模式，用简洁、直接、有效的方法帮助患者顺利度过支架术后康复期，为患者的生活提供便利，为患者的健康保驾护航。</p>
    </body>
</html>
