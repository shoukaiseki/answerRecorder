<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--时间格式化

-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  <label for="content">单个上传:</label>
<!-- method必须为post 及enctype属性-->  
<form action="testupload/fileUpload" method="post" enctype="multipart/form-data">  
    <input type="file" name="file">  
    <input type="submit" value="上传">  
</form> 

  <label for="content">多个上传:</label>
<form action="testupload/fileUploadMultiple" method="post" enctype="multipart/form-data">  
    <input type="file" name="updateFiles" multiple="">  
    <input type="submit" value="上传">  
</form> 
</body>
</html>  