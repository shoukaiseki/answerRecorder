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
<form:form modelAttribute="chapter" method="post" action="chapter/save" >
	<table>
	
		<tr>
			<td>记录标识:</td>
			<td><form:input  size="35" readonly="true" path="chapterid" class="input_readonly"/></td>
		</tr>
	
		<tr>
			<td>创建时间:</td>
					<td><form:input readonly="true" path="createdate" class="input_readonly"/></td>
					<!--在 model 类里面添加 @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") 注释之后不用再设置-->
					<!--
				<td>
					<input  class="input_readonly" readonly="true" id="createdate" name="createdate" value="<fmt:formatDate value='${chapter.createdate}' type='date' pattern='yyyy-MM-dd HH:mm:ss'/>"/>
				</td>
					-->
		</tr>
		<tr>
			<td>课程名称:</td>
			<td><form:input path="coursetitle"/></td>
		</tr>
		<tr>  
			<td></td>
			<td><font color="red"><form:errors path="coursetitle"/></font></td>
		</tr>
		<tr>
			<td>培训名称:</td>
			<td><form:input path="trainingname"/></td>
		</tr>
		<tr>
			<td></td>
			<td><font color="red"><form:errors path="trainingname"/></font></td>
		</tr>
		<tr>
			<td>章节名称:</td>
			<td><form:input path="chaptername"/></td>
		</tr>
		<tr>
			<td></td>
			<td><font color="red"><form:errors path="chaptername"/></font></td>
		</tr>
		<tr>
            <td><input type="submit" value="保存"/></td>  
        </tr>  
	</table>
</form:form>
</body>
</html>  