<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>康复手册</title>
	<meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">
	<link rel="stylesheet" type="text/css" href="css/book.css">
</head>
<body>
	<article>
		<section class="bold" id="top" name="top">【目 录】</section>

		<section><a href="#1">
			<div class="part">第一章 冠心病常识</div>
			<div>1.冠心病概述</div>
			<div>2.冠心病家族</div>
			<div>3.冠心病的危险因素</div>
			<div>4.冠心病的健康处方</div>
		</a></section>
		<section><a href="#2">
			<div class="part">第二章 冠心病的治疗</div>
			<div>1.冠心病的治疗方法</div>
			<div>2.什么是冠心病的介入治疗</div>
			<div>3.介入治疗手术步骤</div>
			<div>4.介入治疗适应证</div>
			<div>5.介入治疗的优点</div>
			<div>6.支架术后的不适调理</div>
			<div>7.支架术后伤口护理</div>
			<div>8.支架术后并发症</div>
			<div>9.支架术后胸部疼痛</div>
			<div> 10.支架内再狭窄</div>
			<div>11.支架术后的临床随访和造影复查</div>
		</a></section>
		<section><a href="#3">
			<div class="part">第三章 冠状动脉支架介绍</div>
			<div>1.冠状动脉支架</div>
			<div>2.不同类型支架特点</div>
		</a></section>
		<section><a href="#4">
			<div class="part">第四章 支架术后药物处方</div>
			<div>1.支架术后药物治疗的必要性</div>
			<div>2.支架术后常用药物</div>
			<div>3.冠心病的药物处方-五大药物基石</div>
			<div>4.目前市场上常见药物品牌</div>
			<div>5.术后用药常见问答</div>
		</a></section>
		<section><a href="#5">
			<div class="part">第五章 支架术后营养处方</div>
			<div>1.术后饮食应做到“三多三少”</div>
			<div>2.围手术期饮食方法</div>
			<div>3.对术后康复有利的四种食品</div>
			<div>4.支架术后的七条饮食建议</div>
			<div>5.术后用药常见问答</div>
		</a></section>
		<section><a href="#6">
			<div class="part">第六章 支架术后运动处方</div>
			<div>1.运动是良医</div>
			<div>2.术后运动方法介绍</div>
			<div>3.术后运动注意事项</div>
			<div>4.术后运动常见问答</div>
		</a></section>
		<section><a href="#7">
			<div class="part">第七章 支架术后心理处方</div>
			<div>1.喜怒哀乐也伤“心”</div>
			<div>2.术后警惕焦虑、抑郁情绪</div>
			<div>3.术后康复从性格开始</div>
			<div>4.睡眠管理</div>
			<div>5.术后情绪常见问答</div>
		</a></section>
		<section><a href="#8">
			<div class="part">第八章 支架术后戒烟限酒处方</div>
			<div>1.戒烟对控制心血管疾病的重要性</div>
			<div>2.戒烟的方法</div>
			<div>3.长期饮酒、酗酒伤心</div>
			<div>4.限酒的方法</div>
			<div>5.术后戒烟限酒常见问答</div>
		</a></section>
		<section><a href="#9">
			<div class="part">第九章 心脏病家庭急救、自救方法</div>
			<div>1.您应牢记的危险信号</div>
			<div>2.您应掌握的求救方法</div>
			<div>3.应该学会的自救方法</div>
			<div>4.应该学会的急救方法</div>
			<div>5.“一键式” 智能呼叫终端</div>
			<div>6.心脏病家庭急救、自救常见问答</div>
		</a></section>
		<section><a href="#10">
			<div class="part">第十章 支架术后身体活动评估</div>
			<div>1.做家务</div>
			<div>2.工作</div>
			<div>3.开车</div>
			<div>4.乘坐飞机</div>
			<div>5.性生活</div>
			<div>6.外出旅游</div>
		</a></section>
		<section><a href="#11">
			<div class="part">第十一章 冠心病危险因素指标防控</div>
			<div>1.血压</div>
			<div>2.血糖</div>
			<div>3.血脂</div>
			<div>4.体重</div>
			<div>5.运动</div>
			<div>6.戒烟</div>
			<div>7.限酒</div>
		</a></section>
		<section><a href="#12">
			<div class="part">第十二章 支架术后关心的问题</div></a></section>
		<section><a href="#13">
			<div class="part">第十三章 未来健康辅助新技术</div>
			<div>1.健康管理概述</div>
			<div>2.移动医疗——您身边的医生</div>
			<div>3.同心管家App—支架术后患者健康管理好助手</div>
		</a></section>
		<section><a href="#14">
			<div class="part">附 录</div>
			<div>附录1  复查时间表</div>
			<div>附录2  各种活动的能量消耗水平（用METs衡量）</div>
			<div>附录3  主要食物中胆固醇含量</div>
			<div>附录4  主要食物中膳食纤维含量</div>
			<div>附录5  心肌梗死患者术后3周院内运动康复指导</div>
			<div>附录6  焦虑自评量表（SAS）</div>
			<div>附录7  抑郁自评量表（SDS）</div>
		</a></section>
		<section class="bold">【章节介绍】</section>
		<section id="1" name="1">
			<div class="part">第一章   冠心病常识</div>
			<div class="indent">在现代社会，冠心病已不再是老年人的专利，年轻群体患病的例子早已屡见不鲜，其中不乏猝死的悲剧。就算及时发现并进行了支架手术，也不能说从此可以高枕无忧——如果不坚持用药并保持良好的生活习惯，心绞痛、心肌梗死都可能不期而至。</div>
			<div class="indent">那么，心绞痛出现时会有哪些症状？心肌梗死发生前会不会有先兆？怎样才能预防心肌梗死的再次来袭？看完本章，您会对这些您最关心的问题有一个全面的了解。</div>
			<div class="img"><img src="images/pic_1.jpg" alt=""></div>
		</section>
		<section id="2" name="2">
			<div class="part">第二章  冠心病治疗</div>
			<div class="indent">冠心病的主要治疗方法有药物、介入治疗和冠状动脉搭桥术等，其中介入治疗是近年来发展迅速、非常成熟的一种微创技术。那么，介入治疗到底是怎样一种治疗技术？介入治疗后会不会出现并发症？介入治疗后要不要进行临床随访和造影复查？看完本章，不仅能解除您对支架手术的种种困惑和不解，还能帮您应对术后的不适，正确进行穿刺部位的伤口护理。</div>
			<div class="img"><img src="images/pic_2.jpg" alt=""></div>
		</section>
		<section id="3" name="3">
			<div class="part">第三章  冠状动脉支架介绍</div>
			<div class="indent">对于支架，多数人一知半解，可能只知道有国产和进口之分，并不知道支架也有不同类型、也在不断更新换代、推陈出新。那么，小小的支架怎样能撑起狭窄或闭塞的血管？不同支架的治疗效果有什么不同？未来理想的支架会是什么样子？本章带您走近支架技术，揭开支架的神秘面纱，领略支架的神奇功效，以平常心看待支架植入治疗。</div>
			<div class="img"><img src="images/pic_3.jpg" alt=""></div>
		</section>
		<section id="4" name="4">
			<div class="part">第四章  支架术后药物处方</div>
			<div class="indent">药物处方是治疗冠心病的基础。支架术后坚持药物治疗，不仅对预防支架内血栓形成至关重要，还有助于预防和控制其他部位冠脉粥样硬化的发生和发展。那么，支架术后的常用药物都有哪些？这些药物的效用和注意事项各是什么？怎样才算是合理用药？看完本章，您将会了解坚持药物治疗的必要性，摒弃不良用药习惯，走出常见的用药误区。</div>
			<div class="img"><img src="images/pic_4.jpg" alt=""></div>
		</section>
		<section id="5" name="5">
			<div class="part">第五章  支架术后营养处方</div>
			<div class="indent">支架术后应坚持“三多三少”的营养原则。“三多”即多补充膳食纤维、多补充维生素、多补充微量元素；“三少”即少食、少脂、少盐。那么，支架术后饮食怎样做到“三多三少”？哪些食物有利于支架术后康复？营养专家会给出哪些饮食建议？看完本章，您会对健康饮食有更深入的了解，切实在生活中做个“健康饮食达人”。</div>
			<div class="img"><img src="images/pic_5.jpg" alt=""></div>
		</section>
		<section id="6" name="6">
			<div class="part">第六章  支架术后运动处方</div>
			<div class="indent">“生命在于运动”，运动康复同样也是心脏康复的基石。支架术后，科学运动既可控制冠心病进展、改善焦虑情绪，还可减少支架植入后再狭窄的概率，促进冠状动脉侧支循环形成，提高患者的运动能力与抗病能力。那么，支架术后应该何时开始运动？怎样把握运动强度？如何预防运动损伤？看完本章，您会掌握科学运动的方法，开启运动康复的旅程。</div>
			<div class="img"><img src="images/pic_6.jpg" alt=""></div>
		</section>
		<section id="7" name="7">
			<div class="part">第七章  支架术后心理处方</div>
			<div class="indent">焦虑、抑郁等不良情绪已经成为影响支架术后患者康复的突出问题，不仅影响到生活和工作，还可导致病情复发甚至加重。那么，如何判断自己是否得了焦虑症或抑郁症？怎样预防或改善焦虑抑郁？患者焦虑抑郁了，家属应该怎么办？看完本章，您会对抑郁、焦虑等心理疾病有一个大概认识，学会突破情绪障碍、做好性格保健、改善睡眠质量，为心脏康复把好心理关。</div>
			<div class="img"><img src="images/pic_7.jpg" alt=""></div>
		</section>
		<section id="8" name="8">
			<div class="part">第八章  支架术后戒烟限酒处方</div>
			<div class="indent">戒烟限酒对于术后康复至关重要。数据揭示，吸烟者死于冠心病的危险性是不吸烟者的2倍；过量饮酒也会增加患高血压、心脏病、卒中等疾病的危险。对于吸烟者而言，戒烟1年就可使患冠心病的危险性降低50%，并逐年降低，15年后其危险性能接近从不吸烟者。那么，支架术后该如何有效戒烟？戒烟后该如何面对伴发症状？运动后是否可以喝酒？看完本章，您会更深入地了解吸烟喝酒对冠心病的影响，逐步掌握戒烟限酒的方法，养成健康的生活习惯。</div>
			<div class="img"><img src="images/pic_8.jpg" alt=""></div>
		</section>
		<section id="9" name="9">
			<div class="part">第九章  心脏病家庭急救、自救方法</div>
			<div class="indent">我国心血管疾病的发病率和死亡率一直呈持续上升阶段，并且趋于年轻化。猝死，是近年来屡见于报端的一个名词。您可知道，心脏病发作时的危险信号有哪些？心脏病发作时该如何急救？如何把握心肌梗死的“自救10秒钟黄金时间”？看完本章，您将不会在危险到来时束手无策。</div>
			<div class="img"><img src="images/pic_9.jpg" alt=""></div>
		</section>
		<section id="10" name="10">
			<div class="part">第十章  支架术后身体活动评估</div>
			<div class="indent">回归正常生活，是每个支架术后人士的梦想。但由于每个人的病情不同、恢复各异，能否进行某一活动的能力也各不相同。那么，支架术后何时可以做家务？什么时候可以开车或乘坐飞机？什么时候可以恢复工作？看完本章，您会对以上问题做到心中有数。</div>
			<div class="img"><img src="images/pic_10.jpg" alt=""></div>
		</section>
		<section id="11" name="11">
			<div class="part">第十一章   冠心病危险因素指标防控</div>
			<div class="indent">心脏支架植入术后，您应在坚持药物治疗的基础上，定期复查，同时严格控制血压、血糖、血脂水平，改变不良生活方式，以免病痛卷土重来。那么，支架术后血压、血糖、血脂应控制在什么水平？运动强度及运动总量应该是多少？酒还能喝吗？相信本章会给您术后的健康生活带来帮助。</div>
			<div class="img"><img src="images/pic_11.jpg" alt=""></div>
		</section>
		<section id="12" name="12">
			<div class="part">第十二章  支架术后关心的问题</div>
			<div class="indent">心脏支架术后，您是否也有不同程度的担忧疑惑？担心支架会移动、脱落，担心会产生排斥反应，担心机场安检时体内的支架会引起金属探测器发出警报？担心支架术后感冒、发热、腹泻怎么办？……这些担心，将在本章得到解答。</div>
			<div class="img"><img src="images/pic_12.png" alt=""></div>
		</section>
		<section id="13" name="13">
			<div class="part">第十三章 未来健康辅助新技术</div>
			<div class="indent">移动医疗技术已经在为您服务了。为满足患者对术后康复知识的需求，给支架术后患者提供一个更为快捷的与医生交流的平台，国内首款专门针对支架术后患者使用的移动医疗App“同心管家”能够为患者提供术后天天知、在线咨询、电话咨询、医学讲座、讲座视频集粹、同心百科、用药提醒、健康档案、寻医问药、健康商城、陪诊服务、转诊服务、论坛、积分换礼等服务，陪伴您安全度过支架术后康复期。</div>
			<div class="img"><img src="images/pic_13_20161025.png" alt=""></div>
		</section>
		<section>
			<div class="part">【读者评价】</div>
			<div class="indent">“真是本好书，介绍了支架手术后的方方面面，包括饮食、运动、指标控制等等，很实用，值得看。”  </div>
			<div class="indent">----张先生，56岁，支架术后9个月</div>
			<div class="indent">“该书解决了我们支架术后患者的很多困惑，强烈建议一看。”</div>
			<div class="indent">----李女士，60岁,支架术后1年</div>
			<div class="indent">“书里介绍了心梗后的急救措施，浅显易懂，一看就会……保命的措施，随时都用得上，心里踏实多了。” </div>
			<div class="indent"> ----刘先生，65岁，患冠心病、高血压10年</div>
			<div class="indent">“五大处方介绍得很清楚，要是早看到这本书，就不会觉得冠心病那么可怕了。”</div>
			<div class="indent">----孙女士，63岁，支架术后2年</div>
			<div class="indent">“我平时经常加班熬夜，抽烟也多，饮食也不规律，身体早有不舒服的感觉，无意中看了这本书才有了答案，以后真得注意了！ </div>
			<div class="indent">----王先生，33岁，体检发现心律不齐、血脂超标</div>
		</section>
	</article>
	<div class="more"><a href="<%=basePath %>book/book1.jsp">返回首页</a></div>
	<div class="fixed">
		<a href="#top"><img src="<%=basePath %>book/images/top.png" alt=""></a>
	</div>
</body>
</html>
