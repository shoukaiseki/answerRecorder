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

  <label for="content">多个上传导入:</label>
<form:form modelAttribute="chapter" method="post" action="impfiles/fileUploadMultiple"  enctype="multipart/form-data">
	<table>
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
			<td>培训名称:</td>
			<td><form:input path="trainingname" size="100"/></td>
		</tr>
		<tr>
			<td>课程名称:</td>
			<td><form:input path="coursetitle" size="100"/></td>
		</tr>
		<tr>
			<td colspan="2"><input type="file" name="updateFiles" multiple=""></td>
		</tr>
		<tr>
			<td colspan="2" align="right" style="padding-right:100px;"><input type="submit" value="上传"></td>
		</tr>
		
		 
	</table>
</form:form>
	${msg}
<!--
						<%
						  String stringjson=com.alibaba.fastjson.JSONObject.toJSONString( request.getAttribute("chapters"));
						%>
						<%=stringjson%>
						-->
    <c:forEach items="${chapters}" var="chapterTemp">
		<table  cellpadding="0" cellspacing="0"  class="maintable mainTablecss">
		<tbody>
			<td class="mainTableComponentCss">培训名称</td>
			<td class="mainTableComponentCss">课程名称</td>
			<td class="mainTableComponentCss">章节名称</td>
			<td class="mainTableComponentCss">创建时间</td>
		</tbody>
				<tr>
					<td class="mainTableComponentCss">${chapterTemp.trainingname}</td>
					<td class="mainTableComponentCss">${chapterTemp.coursetitle}</td>
					<td class="mainTableComponentCss">${chapterTemp.chaptername}</td>
					<td class="mainTableComponentCss">
						<fmt:formatDate value="${chapterTemp.createdate}"  type="DATE" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
				</tr>
				<tr>
					 <td colspan="4" class="mainTableComponentCss"  cellspacing="0" cellpadding="0">
						<table  class="childTable" frame="void" style="width:100%;height:100%;">
							<c:forEach items="${chapterTemp.issueList}" var="issue" varStatus="status">
								<tr>
									<td >${status.count}
									</td>
									<td>
										问题:${issue.question}
									</td>
								</tr>
								<tr>
									<td>
									</td>
									<td>
										答案:${issue.answer}&nbsp;&nbsp;答案描述:${issue.answerdescription}
									</td>
								</tr>
								<tr>
									<td>
									</td>
									 <td colspan="1" class="mainTableComponentCss"  cellspacing="0" cellpadding="0">
										<table  class="childTable" frame="void" style="width:100%;height:100%;">
											<c:forEach items="${issue.issueoptionList}" var="issueoption">
												<tr>
													<td class="childTableComponentCss">${issueoption.option}</td>	
													<td class="childTableComponentCss">${issueoption.optiondescription}</td>	
												</tr>
											</c:forEach>
										</table>
									</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
	</table>
	</c:forEach>

</body>
</html>  