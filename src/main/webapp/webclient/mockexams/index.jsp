<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--时间格式化

-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>  
    <base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
	<title>Insert title here</title>
	<script type="text/javascript" src="webclient/javascript/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="webclient/javascript/shoukaiseki/logger-1.0.js"></script>
    <style>
        
        table,table tr th, table tr td { border:1px solid #212121; }
		
		
		/** 未答题 **/
        .EOVWait { width:34px;height:34px; }
		/** 错误 **/
        .EOVError { width:34px;height:34px;background-color:#FF0000; }
		/** 正确 **/
        .EOVCorrect { width:34px;height:34px;background-color:#00B2EE; }
		/** 选中 **/
		.EOVHover {background-color:#33FF66;background-color:#93F0E4;cursor:default;}
		
        table {  min-height: 25px; line-height: 25px; text-align: center; border-collapse: collapse;}
		.fcc:after { content:"."; display:block; height:0; clear:both; visibility:hidden; }
		.fcc { display:inline-block; }
			/* Hide from IE Mac \*/
		.fcc { display:block; }
		.EOVHover		{background-color:#33FF66;background-color:#93F0E4;cursor:default;}
		
		.multilinetable_input_middle{
			vertical-align:-3px;
		}
		.selecttd{
			color: #808080;
			font-size: 12px;
		}
    </style>
</head>  
<body>  
	<br>
	<table width="50%">
		<tr>
			<td><font size="+2">第${rownum+1}题</font></td>
		</tr>
		<tr>
			<td>${model.question}</td>
		</tr>
		
		<tr>
			<td  align="left" class="selecttd">
						<c:forEach var="issueoption" items="${model.issueoptionList}">
							
						<c:choose>
							<c:when test="${mockexams.answer==issueoption.option}">
								<label><input name="answer" type="radio" value="${issueoption.option}" checked="checked" class="multilinetable_input_middle"/>${issueoption.option}:${issueoption.optiondescription} </label>
								<br>
							</c:when>
							 <c:otherwise>							
								<label><input name="answer" type="radio" value="${issueoption.option}" class="multilinetable_input_middle"/>${issueoption.option}:${issueoption.optiondescription} </label>
								<br>

							 </c:otherwise>
						</c:choose>
						</c:forEach>
			</td>
		</tr>
	</table>
	<br>
	<table  width="50%" style=" padding:0px; border-spacing:0px; border-style:none; border-collapse:collapse;">
		<tr>
			<td style="border:0px;" align="right">
				<div>
					<button  id="btnNext1">上一题</button>
					<button  id="btnNext2">下一题</button>
					<button  id="btnNext4">重 考</button>
				</div>
			</td>
		</tr>
		<c:choose>
			<c:when test="${(mockexams.answer!=model.answer)&&(mockexams.answer!='')}">
				<tr>
					<td style="border:0px;"   align="left">
						<font color="#FF0000">[回答错误]正确答案:${model.answer}[${model.answerdescription}]</font>
					</td>
				</tr>
			</c:when>
			<c:when test="${(mockexams.answer==model.answer)&&(mockexams.answer!='')}">
				<tr>
					<td style="border:0px;" align="left">
						<font color="#00B2EE">[回答正确]正确答案:${model.answer}[${model.answerdescription}]</font>
					</td>
				</tr>
			</c:when>
		</c:choose>
		<tr>
			<td  align="left" style="border:0px;">回答正确:[${fn:length(correctList)}]回答错误:[${fn:length(errorList)}]总共答题:[${fn:length(sizeList)}]</td>
		</tr>
	</table>
		<br>
		<br>
	<table id="ExamOrderView">
		<c:forEach var="exam" items="${exams}" varStatus="examStatus">
			<c:choose>
				<c:when test="${examStatus.count%25==1}">
					<tr>
						<td id="EOV${examStatus.count}" class="${exam.value.status}">${exam.key}<br>${exam.value.answer}</td>
				</c:when>
				<c:when test="${examStatus.count%25==0}">
						<td id="EOV${examStatus.count}" class="${exam.value.status}">${exam.key}<br>${exam.value.answer}</td>
					</tr>
				</c:when>
				 <c:otherwise>
					<td id="EOV${examStatus.count}" class="${exam.value.status}">${exam.key}<br>${exam.value.answer}</td>
				 </c:otherwise>
			</c:choose>
		</c:forEach>
	</table>
</body>
	<script type="text/javascript" language="JavaScript">
	$(function(){
		$("#ExamOrderView td").bind("click",function(){
			
			Logger.log("td 点击"); 
			Logger.log($(this).attr("id")); 
			location.href="<%=basePath%>mockexams/index/"+$(this).attr("id").slice(3);
			
		});
		$("#btnNext1").click(function(){
			var value=$("input[name='answer']:checked").val();
			Logger.log("上一题 点击"); 
			Logger.log("答案:"+value); 
			if (typeof value == "null"||typeof(value)=="undefined") 
			{ 
				location.href="<%=basePath%>mockexams/previous?answer=";
			} else{
				location.href="<%=basePath%>mockexams/previous?answer="+$("input[name='answer']:checked").val();
			}
			//$("input[name='answer']:checked").val();
		  });
		$("#btnNext2").click(function(){
			var value=$("input[name='answer']:checked").val();
			Logger.log("下一题 点击"); 
			Logger.log("答案:"+value); 
			if (typeof value == "null"||typeof(value)=="undefined") 
			{ 
				location.href="<%=basePath%>mockexams/next?answer=";
			} else{
				location.href="<%=basePath%>mockexams/next?answer="+$("input[name='answer']:checked").val();
			}
			//$("input[name='answer']:checked").val();
		  });
		$("#btnNext4").click(function(){
			Logger.log("重考 点击"); 
			location.href="<%=basePath%>mockexams/reset";
			//$("input[name='answer']:checked").val();
		  });
	});
	</script>
</html>  