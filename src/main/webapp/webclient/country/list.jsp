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
<table  cellpadding="0" cellspacing="0"  class="maintable mainTablecss">
    <tbody>
        <td class="mainTableComponentCss">记录标识</td>
        <td class="mainTableComponentCss">国家</td>
        <td class="mainTableComponentCss" width="250">更新时间</td>
        <td class="mainTableComponentCss">城市</td>
    </tbody>
        <c:forEach items="${countrys}" var="country">
            <tr>
                <td class="mainTableComponentCss">${country.country_id}</td>
                <td class="mainTableComponentCss">${country.country}</td>
                <td class="mainTableComponentCss">
					<fmt:formatDate value="${country.last_update}"  type="DATE" pattern="yyyy-MM-DD HH:mm:ss"/>
                </td>
                 <td  class="mainTableComponentCss"  cellspacing="0" cellpadding="0">
					<table  class="childTable" frame="void" style="width:100%;height:100%;">
						<c:forEach items="${country.cityList}" var="city">
							<tr>
								<td class="childTableComponentCss">${city.city}</td>	
							</tr>
						</c:forEach>
					</table>
                </td>
            </tr>
        </c:forEach>
</table>
</body>
</html>  