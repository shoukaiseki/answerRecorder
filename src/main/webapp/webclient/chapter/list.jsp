<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--时间格式化

-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
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
<body>  
<table    class="maintable mainTablecss" style="width:100%;">
    <tbody>
        <td class="mainTableComponentCss" nowrap>序号</td>
		<!--
        <td class="mainTableComponentCss" nowrap>记录标识</td>
		-->
        <td class="mainTableComponentCss" nowrap>培训名称</td>
        <td class="mainTableComponentCss" nowrap>课程名称</td>
        <td class="mainTableComponentCss" nowrap>章节名称</td>
        <td class="mainTableComponentCss" width="180">创建时间</td>
        <td class="mainTableComponentCss" nowrap>创建用户</td>
        <!--
        <td class="mainTableComponentCss">城市</td>
        -->
    </tbody>
        <c:forEach items="${datas}" var="obj" varStatus="objStatus">
            <tr>
                <td class="mainTableComponentCss" nowrap>${objStatus.count}</td>
		<!--
                <td cellpadding="5px" cellspacing="0px" class="mainTableComponentCss" nowrap>${obj.chapterid}</td>
		-->
                <td class="mainTableComponentCss">${obj.trainingname}</td>
                <td class="mainTableComponentCss">${obj.coursetitle}</td>
                <td class="mainTableComponentCss">${obj.chaptername}</td>
                <td class="mainTableComponentCss">
					<fmt:formatDate value="${obj.createdate}"  type="DATE" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td>
                <td class="mainTableComponentCss">${obj.createby}</td>
            </tr>
			<c:forEach items="${obj.issueList}" var="issue" varStatus="issueStatus">
				<tr> 
					<td  class="mainTableComponentCss">
					</td>
					<td colspan="6" class="mainTableComponentCss"  cellspacing="0" cellpadding="0">
						<table  class="childTable" frame="void" style="width:100%;height:100%;">
								<tr>
									<td width="50px" class="childTableComponentCss">${issueStatus.count}</td>	
									<td colspan="2" align="left" class="childTableComponentCss">问题:${issue.question}</td>	
								</tr>
								<tr>
									<td></td>
									<td align="left" colspan="2" class="childTableComponentCss">答案:${issue.answer}&nbsp;[${issue.answerdescription}]</td>	
								</tr>
								<c:forEach items="${issue.issueoptionList}" var="issueoption" varStatus="issueoptionStatus">
								<tr>
									<td></td>
									<td width="50px" class="childTableComponentCss">${issueoption.option}</td>	
									<td align="left" class="childTableComponentCss">${issueoption.optiondescription}</td>	
								</tr>
								</c:forEach>
						</table>
					</td>
				</tr>
			</c:forEach>
        </c:forEach>
</table>
</body>
</html>  