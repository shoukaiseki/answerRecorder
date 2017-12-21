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
		<!--
		<h2>支持模糊搜索,但是搜索的关键字顺序必须与题目一致</h2>
		<h2>例如搜索问题(以下哪个属于病理性钙化的光镜学特点)</h2>
		<ul data-role="listview" >
		  <li><a href="#">可以输入(哪个 病理 光镜学)进行搜索(搜索时不含括号)</a></li>
		  <li><a href="#">但是可以输入(病理 哪个 光镜学)不按顺序进行搜索是无效的</a></li>
		  <li><a href="#">列表项</a></li>
		</ul>
		-->
		<div data-role="collapsible">
			<h1 sytle="white-space:normal:nowrap">搜索说明</h1>
			<ul data-role="listview">
			  <li >支持模糊搜索,但是搜索的关键字顺序必须与题目一致</li>
			  <li>例如搜索问题(以下哪个属于病理性钙化的光镜学特点)</li>
			  <li>可以输入(哪个 病理 光镜学)进行搜索(搜索时不含括号)<button class="ui-btn  ui-corner-all" onclick="testfind01()" id="testfind01">测试搜索</button></li>
			  <li>但是可以输入(病理 哪个 光镜学)不按顺序进行搜索是无效的<button class="ui-btn  ui-corner-all" onclick="testfind02()" id="testfind02">测试搜索</button></li>
			</ul>
		</div>
		<form action="findissue" method="get">
			<div data-role="fieldcontain">
				  <table width="100%">
					<tr>
					  <td width="80px" align="right">
						<label >模糊查询:</label>
					  </td>
					  <td>
						<input  type="text" name="keyword" id="keyword" value="${keyword}">
					  </td>
					  <td>
						<input  type="submit" value="查找" />
					  </td>
					</tr>
				  </table>
			</div>
		</form>
		<c:if test="${list!= null && fn:length(list) > 0}">
			<p>为您搜索到记录数${fn:length(list)}条</p>
		</c:if>
		<c:forEach items="${list}" var="issue" varStatus="issueStatus">
			<h2>
				  <table width="100%">
					<tr>
					  <td align="center" valign="top">(${issueStatus.count})</td>
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
</div>
<!--jquery在同一页面提交表单时,会有缓存,提交表单之后导致$("#keyword").val("病理 哪个 光镜学"); 方法失效-->
<!--解决方法一:更改所有 id="keyword" 的值(因为当时缓存中有多个input)-->
<!--
-->
<script type="text/javascript">
  function testfind01(){
	Logger.log("function testfind01 按下");
	Logger.log($("#keyword"));
	Logger.log("keyword..");
	 $('input[id="keyword"]').each(function(){ 
                $(this).val("哪个 病理 光镜学"); 
	}); 
  };
  function testfind02(){
	Logger.log("function testfind02 按下");
	Logger.log($("#keyword"));
	Logger.log("keyword..");
	 $('input[id="keyword"]').each(function(){ 
                $(this).val("病理 哪个 光镜学"); 
	}); 
  };
</script>


</body>
</html>  