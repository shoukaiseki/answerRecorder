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
        table,table tr th, table tr td { border:1px solid #0094ff; }
        table {  min-height: 25px; line-height: 25px; text-align: center; border-collapse: collapse;}
    </style>
</head>  
<body>  
<table >
    <tbody>
        <td  >记录标识</td>
        <td  >城市</td>
        <td  width="250">更新时间</td>
        <td  >国家信息</td>
    </tbody>
        <c:forEach items="${citys}" var="city">
            <tr>
                <td>${city.city_id}</td>
                <td>${city.city}</td>

                <td>
                    <fmt:formatDate value="${city.last_update}"  type="DATE" pattern="yyyy-MM-DD HH:mm:ss"/>
                </td>
                <td>
                        国家:${city.country}
                        <br>
                        更新时间:<fmt:formatDate value="${city.country_last_update}"  type="DATE" pattern="yyyy-MM-DD HH:mm:ss"/>
                </td>
            </tr>
        </c:forEach>
</table>
</body>
</html>  