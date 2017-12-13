<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
    <base href="<%=basePath%>">
    <title>课程统计</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>Insert title here</title>
    <style>
        .mainTableComponentCss { 
			border:1px solid #0094ff;
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
<!-- frameborder 边框
-->
<frameset rows="50%,*"  >
	<frameset cols="480,*"  >
		<frame src="chapter/coursetitleStatistics" frameborder="1"/>
		<frame src=""   name="chapternameStatistics" frameborder="1"/>
	</frameset>
	<frame src=""  name="issueList" frameborder="1"/>
</frameset>
<!--
	<frameset cols="480,*" rows="30%,*">
		  <frame src="chapter/coursetitleStatistics">
			<frameset rows="30%,70%" frameborder="yes" framespacing="1">
		  <frame src="" name="chapternameStatistics">
		  <frame src="" name="issueList">
	-->
<!--
	<frameset rows="30%,*" cols="*" frameborder="yes" border="1" framespacing="1">
		<frame src="chapter/coursetitleStatistics"/>
		<frameset cols="30%,70%" frameborder="yes" framespacing="1">
		<frame src="3.html" name="chapternameStatistics">
		<frame src="4.html"></frame>
	-->
<!--
	<frameset   rows="80,*" cols="*" frameborder="NO" border="0" framespacing="0">
  <frame src="UntitledFrame-2.htm" name="topFrame" scrolling="NO" noresize >
  <frameset cols="50%,50%" frameborder="NO" border="0" framespacing="0">
    <frame src="UntitledFrame-3.htm" name="leftFrame" scrolling="NO" noresize>
    <frame src="Untitled-1.htm" name="mainFrame">
  </frameset>
</frameset>
	-->
</html>  