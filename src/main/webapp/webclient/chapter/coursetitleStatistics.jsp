<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--时间格式化

-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <td class="mainTableComponentCss" nowrap>培训名称/课程名称</td>
        <td class="mainTableComponentCss" nowrap>章节数量</td>
        <td class="mainTableComponentCss" nowrap></td>
        <!--
        <td class="mainTableComponentCss">城市</td>
        -->
    </tbody>
        <c:forEach items="${datas}" var="obj" varStatus="objStatus">
            <tr>
                <td class="mainTableComponentCss" rowspan="2" nowrap>${objStatus.count}</td>
		<!--
                <td cellpadding="5px" cellspacing="0px" class="mainTableComponentCss" nowrap>${obj.chapterid}</td>
		-->
                <td class="mainTableComponentCss">${obj.trainingname}</td>
                <td class="mainTableComponentCss" rowspan="2">${obj.chapternamecount}</td>
                <td class="mainTableComponentCss" rowspan="2">
					<a href="chapter/chapternameStatisticsByTC/${obj.chapterid}" target="chapternameStatistics"><img src="<%=basePath%>webclient/javascript/imgs/properties.gif"  alt="查看详情" /></a>
				</td>
				
		
               
            </tr>
            <tr>
                <td class="mainTableComponentCss">${obj.coursetitle}</td>
            </tr>
        </c:forEach>
</table>
</body>
</html>  