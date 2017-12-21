<%@ page language="java" import="java.util.*,java.net.URL" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page contentType="text/html;charset=UTF-8" autoFlush="true"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>答题练习</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
	<!--手机打开字体小,加上这句即可-->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script type="text/javascript" src="<%=basePath%>webclient/javascript/shoukaiseki/logger-1.0.js"></script>
	<script type="text/javascript" src="<%=basePath%>webclient/javascript/jquerymobile/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath%>webclient/javascript/jquerymobile/jquery.mobile-1.4.5.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>webclient/javascript/jquerymobile/jquery.mobile-1.4.5.css">  
  </head>
  
  <body>
<div data-role="page" id="pageone">
<%@include file="webclient/mobile/header.jsp"%>
  <div data-role="main" class="ui-content">
    <h2>导航</h2>
    <ol data-role="listview">
      <li><a href="findissue">查找题目</a></li>
	  <li><a href="findissue/pagingdisplay/10/1" rel="external">顺序查看题目</a></li>
	  <!--跳转之后不刷新页面,增加  rel="external" 即可-->
      <li><a href="webclient/chapter/statistics.jsp" rel="external">课程统计</a></li>
      <li><a href="webclient/chapter/issuelistindex.jsp"  rel="external">所有章节统计</a></li>
      <li><a href="chapter/list">章节列表</a></li>
    </ol>
  </div>
</div> 
  </body>
</html>
