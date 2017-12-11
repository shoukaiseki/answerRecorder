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
    <base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
	<title>Insert title here</title>
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
		
		
		.input_readonly{
			border:1px solid #DDD;
			background-color:#F5F5F5;
			color:#ACA899;
			}
    </style>
</head>  
<body>  
	<table>
	
		<tr>
			<td>标识:</td>
			<td>${model.id}</td>
		</tr>
	
		<tr>
			<td>时间:</td>
			<td><fmt:formatDate value='${model.time}' type='date' pattern='yyyy-MM-dd HH:mm:ss'/></td>
					<!--在 model 类里面添加 @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") 注释之后不用再设置-->
					<!--
				<td>
					<input  class="input_readonly" readonly="true" id="createdate" name="createdate" value="<fmt:formatDate value='${chapter.createdate}' type='date' pattern='yyyy-MM-dd HH:mm:ss'/>"/>
				</td>
					-->
		</tr>
		<tr>
			<td>用户:</td>
			<td>${model.user}</td>
		</tr>
		<tr>
			<td>名称:</td>
			<td>${model.name}</td>
		</tr>
		
		<tr>
			<td>更新计数:</td>
			<td>${count}</td>
		</tr>
	</table>
</body>
</html>  