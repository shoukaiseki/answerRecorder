<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--时间格式化

-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>  
    <base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>问题搜索</title>
	<!--
	<script type="text/javascript" src="<%=basePath%>webclient/javascript/iscroll/iscroll.js"></script>
	-->
	<script type="text/javascript" src="<%=basePath%>webclient/javascript/shoukaiseki/logger-1.0.js"></script>
	<script type="text/javascript" src="<%=basePath%>webclient/javascript/jquerymobile/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath%>webclient/javascript/jquerymobile/jquery.mobile-1.4.5.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>webclient/javascript/jquerymobile/jquery.mobile-1.4.5.css">  


</head>  
<body>  
<!--
-->
<div data-role="page" id="pageone">
  <div data-role="main" class="ui-content">
    <h2>有序列表：</h2>
    <ol data-role="listview">
      <li><a href="#">列表项</a></li>
      <li><a href="#">列表项</a></li>
      <li><a href="#">列表项</a></li>
    </ol>
    <h2>无序列表：</h2>
    <ul data-role="listview">
      <li><a href="#">列表项</a></li>
      <li><a href="#">列表项</a></li>
      <li><a href="#">列表项</a></li>
    </ul>
  </div>
</div> 

</body>
</html>  