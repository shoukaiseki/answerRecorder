<%@ page language="java" import="java.util.*,java.net.URL" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>答题练习</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta property="qc:admins" content="4746776325477164510063757" >
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  <a href="test/hello" target="_blank">/test/hello</a>
	<br>
  <a href="test/asus" target="_blank">/test/asus</a>
  <br>
  <a href="test/json" target="_blank">/test/json</a>
  <br>
  <a href="mobileversion/list" target="_blank">/mobileversion/list</a>
  <br>
  <h1>重复提交测试</h1>
  <a href="repeatpost/index" target="_blank">/repeatpost/index</a>
  <br>
  <h1>文件上传</h1>
  <a href="webclient/testupload/index.jsp" target="_blank">文件上传</a>
  <h1>city</h1>
  <a href="city/list" target="_blank">/city/list</a>
  <%--<a href="webclient/answerrecorder/index.jsp" target="_blank">/webclient/answerrecorder/index.jsp</a>--%>
  <h1>country</h1>
  <a href="country/list" target="_blank">国家记录列表</a>
  <br>
  <a href="country/randomlist" target="_blank">国家随机50条记录列表</a>

  <h1>答案记录器</h1>
  <a href="springanswerrecorder/capturehtml" target="_blank">题目答案分析</a>
  <br>
  <a href="springanswerrecorder" target="_blank">答案记录器</a>
  <br>
  <a href="springanswerrecorder/cleartopic/" target="_blank">清空答案记录器内容</a>
  <h2>新版</h2>
  <a href="findissue" target="_blank">查找题目</a>
  <br>
  <a href="webclient/chapter/statistics.jsp" target="_blank">课程统计</a>
	<br>
  <a href="webclient/chapter/issuelistindex.jsp" target="_blank">所有章节统计</a>
	<br>
	<!--
  <a href="chapter/chapternameStatistics" target="_blank">所有章节统计</a>
	<br>
	-->
  <a href="chapter/list" target="_blank">章节列表</a>
	<br>
  <a href="chapter/add/0" target="_blank">章节添加</a>
	<br>
  <a href="impfiles/import/0" target="_blank">导入文件</a>
	<br>
  <a href="mockexams/index/0" target="_blank">模拟考试</a>
  <!--
  <a href="issue/list" target="_blank">章节列表</a>
	<br>
  <a href="issue/add" target="_blank">章节添加</a>
  -->
  <br>
	<br>
    Hello World <br>
    JVM版本= <%=System.getProperty("java.version", "not specified")%><br>
    JVM缺省路径=<%=System.getProperty("java.home", "not specified")%>
	<br>
	java.version=<%=System.getProperty("java.version")%>
	<br>
	java.class.version=<%=System.getProperty("java.class.version")%>
	<br>
	Java 虚拟机中的内存总量=<%=Runtime.getRuntime().totalMemory()/1024/1024%>MB
	<br>
	Java 虚拟机试图使用的最大内存量=<%=Runtime.getRuntime().maxMemory()/1024/1024%>MB
	<br>
	Java 虚拟机中的空闲内存量=<%=Runtime.getRuntime().freeMemory()/1024/1024%>MB

	<br>
    Kotlin version=<%=test.TestKotlin.Companion.showString()%>

  </body>
</html>
