<%@page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<% 
//----------------------------------------------------------------
 //Project: SPM System (Client SubSystem) 
// JSP Name  : footer.jsp 
// PURPOSE : 左边菜单栏显示
// HISTORY：
//	Create：
//	Modify：Han Xinyu Xue yifei    2015.10.24
//  Modify：Xue yifei    2015.11.07
//  Copyright  : BUPTSSE   
//----------------------------------------------------------------- %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>文件管理系统</title>
		<!--左侧导航栏的style-->
		<link href="../css/topanv.v1.0.css" rel="stylesheet" type="text/css" />
		<%--<script src="http://www.lanrenzhijia.com/ajaxjs/jquery.min.js"></script> --%>
		
		<script src="../js/topanv.js"></script>
		<link href="../css/leftGuide.css" rel="stylesheet" type="text/css" />
		
	</head>
	<body id="bg" margin="0">
		<!--左侧导航栏-->
		<div class="container">
			<div class="leftsidebar_box">
				<dl class="channel" style="margin-top: 20px">
					<hr style="border: 1px solid #0099f0;" align="right"></hr>
					<dt onClick="changeImage()">
						课程介绍
						<img src="../images/left/select_xl01.png">
					</dt>
					<dd class="first_dd">
						<a href="${ctx}/enterintro.do?name=kechengjianjie" target="right">&nbsp;&nbsp;&nbsp;&nbsp;课程简介</a>
					</dd>
					<dd>
						<a href="${ctx}/enterintro.do?name=jiaoxuedagang" target="right">&nbsp;&nbsp;&nbsp;&nbsp;教学大纲</a>
					</dd>
					<dd>
						<a href="${ctx}/enterintro.do?name=keshianpai" target="right">&nbsp;&nbsp;&nbsp;&nbsp;课时安排</a>
					</dd>
					<dd>
						<a href="${ctx}/enterintro.do?name=kechengtese" target="right">&nbsp;&nbsp;&nbsp;&nbsp;课程特色</a>
					</dd>
					<dd>
						<a href="${ctx}/enterintro.do?name=kaopingfangshi" target="right">&nbsp;&nbsp;&nbsp;&nbsp;考评方式</a>
					</dd>
					<dd>
						<a href="${ctx}/enterintro.do?name=cankaoshumu" target="right">&nbsp;&nbsp;&nbsp;&nbsp;参考书目</a>
					</dd>

				</dl>
				<dl class="system_log">
					<div
						style="width: 240px; border-bottom: 1px solid #b6d9e8; margin-left: 100px"></div>
					<dt onClick="changeImage()">
						课程内容
						<img src="../images/left/select_xl01.png">
					</dt>
					<dd class="first_dd">
						<a href="${ctx}/listTeachingPlan.do" target="right">&nbsp;&nbsp;&nbsp;&nbsp;授课教案</a>
					</dd>
					<dd>
							<a href="${ctx}/listSpChapter.do" target="right">&nbsp;&nbsp;&nbsp;&nbsp;教学视频</a>
					</dd>
					<dd>
						<a href="${ctx}/jsp/exercise/mainView.jsp" target="hehe">&nbsp;&nbsp;&nbsp;&nbsp;练习题</a>
					</dd>
					<dd>
						<a href="${ctx}/enterintro.do?name=zhishidiansuoyin" target="right">&nbsp;&nbsp;&nbsp;&nbsp;知识点索引</a>
					</dd>
					<dd>
						<a href="${ctx}/enterintro.do?name=kaoshidagang" target="right">&nbsp;&nbsp;&nbsp;&nbsp;考试大纲</a>
					</dd>
					<dd>
						<a href="../Exercise/test.htm" target="right">&nbsp;&nbsp;&nbsp;&nbsp;模拟试卷</a>
					</dd>
				</dl>
				<dl class="custom">
					<div
						style="width: 240px; border-bottom: 1px solid #b6d9e8; margin-left: 100px"></div>
					<dt onClick="changeImage()">
						实验与实践
						<img src="../images/left/select_xl01.png">
					</dt>
					<dd class="first_dd">
						<a href="${ctx}/jsp/exercise/ex_instruct.htm" target="right">&nbsp;&nbsp;&nbsp;&nbsp;实验指导书</a>
					</dd>
					<dd>
						<a href="${ctx}/jsp/exercise/practice_instruct.htm" target="right">&nbsp;&nbsp;&nbsp;&nbsp;实践指导书</a>
					</dd>
					<dd>
						<a href="${ctx}/jsp/exercise/caseAnalyse.jsp" target="right">&nbsp;&nbsp;&nbsp;&nbsp;案例分析</a>
					</dd>
				</dl>
				<dl class="system_log">
					<div
						style="width: 240px; border-bottom: 1px solid #b6d9e8; margin-left: 100px"></div>
					<dt onClick="changeImage()">
						教学团队
						<img src="../images/left/select_xl01.png">
					</dt>
					<dd class="first_dd">
						<a href="${ctx}/enterintro.do?name=jiaoshiduiwu" target="right">&nbsp;&nbsp;&nbsp;&nbsp;教师队伍</a>
					</dd>
					<dd>
						<a href="${ctx}/enterintro.do?name=xueshushuiping" target="right">&nbsp;&nbsp;&nbsp;&nbsp;学术水平</a>
					</dd>
					<dd>
						<a href="${ctx}/enterintro.do?name=xiaoqihezuo" target="right">&nbsp;&nbsp;&nbsp;&nbsp;校企合作</a>
					</dd>
						</dl>
						<div
						style="width: 240px; border-bottom: 1px solid #b6d9e8; margin-left: 100px"></div>
			
			</div>
		</div>

		 <script type="text/javascript" src="${ctx}/js/jquery.js"></script>
		<script type="text/javascript">
		
$(".leftsidebar_box dt").css({"background-color":"#ffffff"});
$(this).css({"color": "#00a1f1"});
$(".leftsidebar_box dt img").attr("src","../images/left/select_xl01.png");
$(function(){
	$(".leftsidebar_box dd").hide();
	$(".leftsidebar_box dt").click(function(){
		
		$(".leftsidebar_box dt").css({"color": "#00a1f1"})
		$(".leftsidebar_box dt").css({"background-color":"#ffffff"})
		$(this).css({"color": "#FFD848"});
		$(this).parent().find('dd').removeClass("menu_chioce");
		$(".leftsidebar_box dt img").attr("src","../images/left/select_xl01.png");
		$(this).parent().find('img').attr("src","../images/left/select_xl.png");
		$(".menu_chioce").slideUp(); 
		$(this).parent().find('dd').slideToggle();
		$(this).parent().find('dd').addClass("menu_chioce");
	});
	$(".leftsidebar_box dd a").click(function(){
		$(".leftsidebar_box dd a").css({"color": "#00a1f1"})
		$(this).css({"color": "#FFD848"})
	});
})

</script>
	</body>
</html>
