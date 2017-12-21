<%@ page language="java" import="java.util.*,java.net.URL" pageEncoding="UTF-8"%>

	<script type="text/javascript" src="<%=basePath%>webclient/javascript/shoukaiseki/logger-1.0.js"></script>
<div data-role="header" id="header">
	<a href="<%=basePath%>" data-role="button" data-icon="home"  rel="external">首页</a>
	<h1>答题练习</h1>
    <button  onclick="navbarHideOrShow(this)">显示导航</button>
	<div id="navbar" data-role="navbar" data-position="fixed" data-tap-toggle="false" style="display:none;">
	  <ul>
		  <li><a href="findissue" rel="external">查找题目</a></li>
		  <li><a href="findissue/pagingdisplay/10/1" rel="external">顺序查看题目</a></li>
		  <li><a href="mockexams/index/0" rel="external">模拟考试</a></li>
		  <!--跳转之后不刷新页面,增加  rel="external" 即可-->
		  <li><a href="webclient/chapter/statistics.jsp" rel="external">课程统计</a></li>
		  <li><a href="webclient/chapter/issuelistindex.jsp"  rel="external">所有章节统计</a></li>
		  <li></li>
		  <!--
		  <li><a href="chapter/list">章节列表</a></li>
		  -->
	  </ul>
	</div>
</div>

<script type="text/javascript">
	  function navbarHideOrShow(obj){
	     Logger.log("header 被点击");
		 $('div[id="navbar"]').each(function(){
				Logger.log("navbar !$(this).is(':visible')="+!$(this).is(':visible'));
				if(!$(this).is(':visible')){　
				Logger.log("navbar 显示");
					$(this).show(); 
					$(obj).text("隐藏导航");
					
				}else{
					$(this).hide(); 
				Logger.log("navbar 隐藏");
					$(obj).text("显示导航");
				}
			});  
	  }
</script>