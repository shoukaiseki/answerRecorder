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
<title>题目分析</title>
    <style>
        .mainTableComponentCss { border:1px solid #0094ff; 
		}
		.mainTablecss table {
			border-top-width: 0px;
			border-right-width: 0px;
			border-bottom-width: 0px;
			border-left-width: 0px;
		}
        .maintable {  min-height: 25px; line-height: 25px; text-align: center; border-collapse: collapse;}
		.maintableChildTableTD{}
        .childTableComponentCss { border:1px solid #0094ff; }
        .childTable {  min-height: 25px; line-height: 25px; text-align: center; border-collapse: collapse;}
    </style>
</head>  
<body>  
<a href="springanswerrecorder" target="_blank">答案记录器</a>
<br>
  <label for="content">抓包获取题目:</label>
<form id="addtopicForm" method="post" action="springanswerrecorder/capturehtmlaction">
	<table>
		<tr>
			<td>url地址:</td>
			<td><textarea id="topictextarea" rows="3" cols="134" name="url" form="addtopicForm">${url}</textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right" style="padding-right:100px;"><input type="submit" value="分析题目答案"></td>
		</tr>
		
		 
	</table>
</form>
	${msg}

</body>
</html>  