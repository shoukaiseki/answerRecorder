<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--时间格式化

-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
    <base href="<%=basePath%>">
	<title>复制问题答案</title>
	<style type="text/css">
		html,body{
			height:98%;
		}
	</style>
</head>  

<body >
<textarea style='width:99%;height:99%'>${answerrecorder}</textarea>
	
</body>
</html>  