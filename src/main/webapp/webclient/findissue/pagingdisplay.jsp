<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	<!--手机打开字体小,加上这句即可-->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>问题搜索</title>
	<!--
	<script type="text/javascript" src="<%=basePath%>webclient/javascript/iscroll/iscroll.js"></script>
	-->
	<script type="text/javascript" src="<%=basePath%>webclient/javascript/shoukaiseki/logger-1.0.js"></script>
	<script type="text/javascript" src="<%=basePath%>webclient/javascript/jquerymobile/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath%>webclient/javascript/jquerymobile/jquery.mobile-1.4.5.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>webclient/javascript/jquerymobile/jquery.mobile-1.4.5.css">  

	<style type="text/css">
		/**列表li文字自动换行**/
		 .ui-listview > .ui-li-static {
			white-space:normal;
		}
	</style>
</head>  
<body>  
<!--
-->
<div data-role="page">
	<%@include file="../mobile/header.jsp"%>
  <div data-role="main" class="ui-content">
		<c:forEach items="${list}" var="issue" varStatus="issueStatus">
			<h2>
				  <table width="100%">
					<tr>
					  <td align="center" valign="top">(${((pagenum-1)*pagesize)+issueStatus.count})</td>
					  <td align="left">问题:${issue.question}
					  </td>
					</tr>
					<tr>
					  <td></td>
					  <td align="left">答案:${issue.answer}&nbsp;[${issue.answerdescription}]</td>
					</tr>
				  </table>
				  </h2>
				  <!--
			<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;答案:${issue.answer}&nbsp;[${issue.answerdescription}]</h2>
			-->
			<ul data-role="listview" data-inset="true">
			<c:forEach items="${issue.issueoptionList}" var="issueoption" varStatus="issueoptionStatus">
			  <li>${issueoption.option}、${issueoption.optiondescription}</li>
			</c:forEach>
			</ul>
		</c:forEach>
	</div>
	<div data-role="footer" class="ui-btn">
		<div data-role="controlgroup" data-type="horizontal">
			
			<c:choose>
				<c:when test="${pagenum<=1}">
			<a href="<%=basePath%>findissue/pagingdisplay/${pagesize}/${pagenum-1}" data-role="button" data-icon="carat-l"  rel="external" class="ui-disabled">上一页</a>
				</c:when>
				<c:otherwise>
			<a href="<%=basePath%>findissue/pagingdisplay/${pagesize}/${pagenum-1}" data-role="button" data-icon="carat-l"  rel="external">上一页</a>
				</c:otherwise>
			</c:choose>
			<a href="#" data-role="button" class="ui-disabled">第${pagenum}页</a>
			
			<c:choose>
				<c:when test="${list!= null && fn:length(list) ==pagesize}">
					<a href="<%=basePath%>findissue/pagingdisplay/${pagesize}/${pagenum+1}" data-role="button" rel="external"  class="ui-btn ui-icon-carat-r ui-btn-icon-right">下一页</a>
				</c:when>
				<c:otherwise>
					<a href="<%=basePath%>findissue/pagingdisplay/${pagesize}/${pagenum+1}" data-role="button" rel="external"  class="ui-btn ui-icon-carat-r ui-btn-icon-right ui-disabled">下一页</a>
				</c:otherwise>
			</c:choose>
		</div>
   </div>
</div>


</body>
</html>  