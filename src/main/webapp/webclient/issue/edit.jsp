<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--时间格式化

-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
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
    </style>
</head>  
<body>  
<form:form modelAttribute="issue" method="post" action="add" >
	<table>
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
			<td>问题:</td>
			<td><form:input path="question"/></td>
		</tr>
		<tr>
			<td></td>
			<td><font color="red"><form:errors path="question"/></font></td>
		</tr>
		<tr>
			<td>问题答案:</td>
			<td><form:input path="answer"/></td>
		</tr>
		<tr>
			<td></td>
			<td><font color="red"><form:errors path="answer"/></font></td>
		</tr>
		<tr>
			<td>问题答案描述:</td>
			<td><form:input path="answerdescription"/></td>
		</tr>
		<tr>
			<td></td>
			<td><font color="red"><form:errors path="answerdescription"/></font></td>
		</tr>
		<tr>
            <td><input type="submit" value="保存"/></td>  
        </tr>  
	</table>
</form:form>
</body>
</html>  