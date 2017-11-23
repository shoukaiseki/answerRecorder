<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path ;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page contentType="text/html;charset=UTF-8" buffer="128kb" autoFlush="true" import="java.util.*" %><%
	//response.setHeader("Access-Control-Allow-Origin", "*");
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");

	java.util.Calendar cal=java.util.Calendar.getInstance();
	Date date=new Date();
	cal.setTime(date);
	cal.add(java.util.Calendar.DAY_OF_YEAR, -1);
	String startDate=new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	String endDate=new SimpleDateFormat("yyyy-MM-dd").format(date);

	String sql=null;
	String SelectTemplateSession=new Date().getTime()+"";
	response.setHeader("Access-Control-Allow-Origin", "*");
	%>

  <head>
    <base href="<%=basePath%>/">
    
    <title>testclient</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="webclient/javascript/easyui/themes/gray/easyui.css">
	<link rel="stylesheet" type="text/css" href="webclient/javascript/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="webclient/javascript/easyui/themes/snow_icon.css">
	<script type="text/javascript" src="webclient/javascript/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="webclient/javascript/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="webclient/javascript/shoukaiseki/logger-1.0.js"></script>
	<!--
	<script type="text/javascript" src="webclient/javascript/shoukaiseki/jquery-plugin/multilinetable-1.0.js"></script>
	-->
	<style type="text/css">
		.multilinetable_title {
			color:#333333;
			font-size: 12px;
			font-family: Arial, Helvetica, sans-serif;
		}
		.multilinetable_title > .multilinetable_from {
			
		}
		.multilinetable_title_name {
			
		}
		/**
			必须要tbody
		**/
		.multilinetable_title > .multilinetable_from > .multilinetable_selectanswer > tbody >  tr > td {
			color: #808080;
			font-size: 12px;
		}
		.multilinetable_input_middle{
			vertical-align:-3px;
		}
		
		.multilinetable_title_answer{
			font-size:12px;
		}
		.multilinetable_title_answer > tbody > tr >td {
			text-align:center;
			vertical-align:middle;
			white-space: nowrap;
		}
		
	</style>
	
	<script type="text/javascript">
	(function($) {
		var multilinetabledatas=[];
		var multilinetableobj;
		var getDefaults = function() {
			return {
				"datas": []
			};
		};
	
	/* JavaScript Widgets */
	$.fn.multilinetable = function(options) {
		 multilinetableobj=this;
		var defaults = getDefaults();
		var settings = $.extend({},defaults, options);//将一个空对象做为第一个参数
		this.multilinetabledatas=settings.datas
		Logger.log("multilinetable"); 
		var rowCount=12;
		return this.each(function(i) {
			
		});
	};

	$.fn.multilinetable_reload=function(datas){
		//清空数组需要使用 multilinetableobj 对象进行操作
		multilinetableobj.multilinetable_clear();
		Logger.log("multilinetable_reload"); 
		$.each(datas.datas,function(key,values){     
			console.log(key);     
			$(values).each(function(){     
				Logger.log(this);    
				Logger.log(multilinetableobj); 
				multilinetableobj.multilinetable_addrow(this)
			});     
		 });   
	};
	
	//
	$.fn.multilinetable_clear=function(){
		//Logger.log(this.multilinetabledatas); 
		/**
		if((this.multilinetabledatas instanceof Array)){
			this.multilinetabledatas.splice(0,Object.keys(this.multilinetabledatas).length);
		}
		**/
		this.multilinetabledatas=[];
	};

	$.fn.multilinetable_addrow=function(rowdata){
			Logger.log("multilinetable_addrow"); 
			this.multilinetabledatas.push(rowdata);
			rownum=Object.keys(this.multilinetabledatas).length;
			Logger.log(this.multilinetabledatas); 
			Logger.log("length="+Object.keys(this.multilinetabledatas).length); 
			//Logger.log(rowdata); 
			rowdata.title=$.trim(rowdata.title);//去首尾空
			var indexPosition=rowdata.title.indexOf("、");
			if(indexPosition>-1){
				var xuhao=rowdata.title.substring(0,indexPosition);
				Logger.log("序号="+xuhao);
				if(!isNaN(xuhao)){
					rowdata.title=rowdata.title.substring(indexPosition+1,rowdata.title.length );
					Logger.log("数字="+xuhao);
				}
			}
			indexPosition=rowdata.title.indexOf(".");
			if(indexPosition>-1){
				var xuhao=rowdata.title.substring(0,indexPosition);
				Logger.log("序号="+xuhao);
				if(!isNaN(xuhao)){
					rowdata.title=rowdata.title.substring(indexPosition+1,rowdata.title.length );
					Logger.log("数字="+xuhao);
				}
			}
			rowdata.multilinetabledatasrownum=rownum
			Logger.log("rowdata.title="+rowdata.title);
			var $row = $('<div>');
			$row.attr('id','multilinetable_row_'+rownum);
			$row.addClass("multilinetable_title")
			var $title = $('<div>');
			$title.attr('id','multilinetable_row_'+rownum+"_title");
			$title.addClass("multilinetable_title")
			
			var $titlesn = $('<label>');
			$titlesn.attr('id','multilinetable_row_'+rownum+"_title_sn");
			$titlesn.addClass("multilinetable_title_name")
			$titlesn.append(rownum);
			$title.append($titlesn);
			$title.append("、");
			var $titlename = $('<label>');
			$titlename.attr('id','multilinetable_row_'+rownum+"_title_name");
			$titlename.addClass("multilinetable_title_name")
			$titlename.append(rowdata.title);
			$title.append($titlename);
			
			var $answertable = $('<table>');
			$answertable.attr('id','multilinetable_row_'+rownum+"_title_answer");
			$answertable.addClass("multilinetable_title_answer")
			var $answertablebody=$('<tbody>');
			var $answertablebodytr = $('<tr>');
			
			//正确答案 td
			var multilinetabledatas_answercorrect=rowdata.answer_correct;
			if(!multilinetabledatas_answercorrect){
				multilinetabledatas_answercorrect="(未知)";
			}
			var $answer_correct=createMultilinetableAnswerTd("正确的答案:",'multilinetable_row_'+rownum+"_title_answer_correct",multilinetabledatas_answercorrect);
			$answer_correct.css("color","#0000FF");
			
			//添加正确答案 td
			$answertablebodytr.append($answer_correct);
			//添加分隔符
			$answertablebodytr.append('<td  width="50"/>');
			
			//推荐答案 td
			var multilinetabledatas_answerrecommend=rowdata.answer_recommend;
			if(!multilinetabledatas_answerrecommend){
				multilinetabledatas_answerrecommend="(无)";
			}
			var $answer_recommend=createMultilinetableAnswerTd("推荐的答案:",'multilinetable_row_'+rownum+"_title_answer_recommend",multilinetabledatas_answerrecommend);
			$answer_recommend.css("color","#9400D3");
			//添加推荐答案 td
			$answertablebodytr.append($answer_recommend);
			//添加分隔符
			$answertablebodytr.append('<td  width="50"/>');
			
			
			//错误答案 td
			var multilinetabledatas_answerwrong=rowdata.answer_wrong;
			if(!multilinetabledatas_answerwrong){
				multilinetabledatas_answerwrong="(无)";
			}
			var $answer_wrong=createMultilinetableAnswerTd("错误的答案:",'multilinetable_row_'+rownum+"_title_answer_wrong",multilinetabledatas_answerwrong);
			$answer_wrong.css("color","#FF0000");
			//添加错误答案 td
			$answertablebodytr.append($answer_wrong);
			//添加分隔符
			$answertablebodytr.append('<td  width="50"/>');
			
			//本次题目标识 td
			var $answerlogotd=$('<td>');
			$answerlogotd.append("本次题目标识:");
			var $answerlogotd_input=$('<input>');
			$answerlogotd_input.addClass("multilinetable_input_middle");
			$answerlogotd_input.attr("id",'multilinetable_row_'+rownum+"_title_answer_logo");
			$answerlogotd_input.attr("type","checkbox");
			$answerlogotd_input.attr("name","vehicle");
			$answerlogotd_input.attr("value","thetitlelogo");
			$answerlogotd.append($answerlogotd_input);
			//添加本次题目标识 td
			$answertablebodytr.append($answerlogotd);
			

			$answertablebody.append($answertablebodytr);
			$answertable.append($answertablebody);
			$title.append($answertable);
			
			$row.append($title);
			multilinetableobj.append($row);
			
			//添加选项 ABCD
			var selectfrom=$('<from>');
			selectfrom.addClass("multilinetable_from");
			multilinetableobj.append(selectfrom);
		
	};
	
	function createMultilinetableAnswerTd(labelname,lavelvalueid,lavelvalue){
			//答案 td
			var $answertd=$('<td>');
			$answertd.append(labelname);
			//答案 label,字段为 rowdata.answer_wrong ,如果为空则设置默认值为'未知'
			var $answer_label=$('<label>');
			$answer_label.attr('id', lavelvalueid);
			$answer_label.append(lavelvalue);
			$answertd.append($answer_label);
			return $answertd;
	}
	
	
	function createMultilinetableSelectAnswerTd(labelname,lavelvalueid,lavelvalue){
			//答案 td
			var $answertd=$('<td>');
			$answertd.append(labelname);
			//答案 label,字段为 rowdata.answer_wrong ,如果为空则设置默认值为'未知'
			var $answer_label=$('<label>');
			$answer_label.attr('id', lavelvalueid);
			$answer_label.append(lavelvalue);
			$answertd.append($answer_label);
			return $answertd;
	}
	
	
})(jQuery);
	</script>
	
</head>
<body  class="easyui-layout" >

	<input class="easyui-textbox" data-options="multiline:true" value="This TextBox will allow the user to enter multiple lines of text." style="width:300px;height:100px">
	<br>
	<div id="answerRecorder"  style="width:800px;margin:0 auto;">
	</div>
	
	<div style="width:800px;margin:0 auto;" >
		<div class="multilinetable_title" id="multilinetable_row_1">
			<div id="multilinetable_row_1_title" >
			<label id="multilinetable_row_1_title_sn">1</label>、<label class="multilinetable_title_name" id="multilinetable_row_1_title_name">下列讲课中的礼仪修养，不恰当的一项是</label>
			</div>
			<table class="multilinetable_title_answer" id="multilinetable_row_1_title_answer">
				<tbody>
					<tr>
					<td  style="color:#0000FF;">正确的答案:<label id="multilinetable_row_1_title_answer_correct">未知</label></td>
					<td  width="50"/>
					<td  style="color:#9400D3;">推荐的答案:<label>B</label></td>
					<td  width="50"></td>
					<td  style="color:#FF0000;">错误的答案:<label>A</label></td>
					<td  width="50"></td>
					<td>本次题目标识:
					<input class="multilinetable_input_middle" type="checkbox" name="vehicle" value="thetitlelogo"/>
				</tbody>
				
			</td>
			</tr></table>
			<form class="multilinetable_from">
				<table class="multilinetable_selectanswer" >
				<tbody>
					<tr><td><label><input name="answer" type="radio" value="A" class="multilinetable_input_middle"/>A:为引起学生的关注，讲课时声音要大 </label> </td></tr>
					<tr><td ><label><input name="answer" type="radio" value="B" class="multilinetable_input_middle"/>B:讲课的过程当中，要经常和听众交流，让患听众感觉你在和他成为一个群体，或一个心情 </label> </td></tr>
					<tr><td><label><input name="answer" type="radio" value="C" class="multilinetable_input_middle"/>C:嗓音的运用也要阴阳顿挫，适当调节说话的语音，让人听起来比较舒服，有兴奋的作用 </label> </td></tr>
					<tr><td><label><input name="answer" type="radio" value="D" class="multilinetable_input_middle"/>D:每次专业的讲课和临床的讲课都要留30分钟或者是20分钟给学生提问题的机会 </label> </td></tr>
				</tbody>

				</table>
			</form>
		</div>
		<div class="multilinetable_title" id="multilinetable_row_1">
			<div id="multilinetable_row_1_title" >
			<label id="multilinetable_row_1_title_sn">1</label>、<label class="multilinetable_title_name" id="multilinetable_row_1_title_name">下列讲课中的礼仪修养，不恰当的一项是</label>
			</div>
			<table class="multilinetable_title_answer" id="multilinetable_row_1_title_answer">
				<tbody>
					<tr>
					<td  style="color:#0000FF;">正确的答案:<label id="multilinetable_row_1_title_answer_correct">未知</label></td>
					<td  width="50"/>
					<td  style="color:#9400D3;">推荐的答案:<label>B</label></td>
					<td  width="50"></td>
					<td  style="color:#FF0000;">错误的答案:<label>A</label></td>
					<td  width="50"></td>
					<td>本次题目标识:
					<input class="multilinetable_input_middle" type="checkbox" name="vehicle" value="thetitlelogo"/>
				</tbody>
				
			</td>
			</tr></table>
			<form class="multilinetable_from">
				<table class="multilinetable_selectanswer" >
				<tbody>
					<tr><td><label><input name="answer" type="radio" value="A" class="multilinetable_input_middle"/>A:为引起学生的关注，讲课时声音要大 </label> </td></tr>
					<tr><td ><label><input name="answer" type="radio" value="B" class="multilinetable_input_middle"/>B:讲课的过程当中，要经常和听众交流，让患听众感觉你在和他成为一个群体，或一个心情 </label> </td></tr>
					<tr><td><label><input name="answer" type="radio" value="C" class="multilinetable_input_middle"/>C:嗓音的运用也要阴阳顿挫，适当调节说话的语音，让人听起来比较舒服，有兴奋的作用 </label> </td></tr>
					<tr><td><label><input name="answer" type="radio" value="D" class="multilinetable_input_middle"/>D:每次专业的讲课和临床的讲课都要留30分钟或者是20分钟给学生提问题的机会 </label> </td></tr>
				</tbody>

				</table>
			</form>
		</div>
		<div class="multilinetable_title" id="multilinetable_row_1">
			<div id="multilinetable_row_1_title" >
			<label id="multilinetable_row_1_title_sn">1</label>、<label class="multilinetable_title_name" id="multilinetable_row_1_title_name">下列讲课中的礼仪修养，不恰当的一项是</label>
			</div>
			<table class="multilinetable_title_answer" id="multilinetable_row_1_title_answer">
				<tbody>
					<tr>
					<td  style="color:#0000FF;">正确的答案:<label id="multilinetable_row_1_title_answer_correct">未知</label></td>
					<td  width="50"/>
					<td  style="color:#9400D3;">推荐的答案:<label>B</label></td>
					<td  width="50"></td>
					<td  style="color:#FF0000;">错误的答案:<label>A</label></td>
					<td  width="50"></td>
					<td>本次题目标识:
					<input class="multilinetable_input_middle" type="checkbox" name="vehicle" value="thetitlelogo"/>
				</tbody>
				
			</td>
			</tr></table>
			<form class="multilinetable_from">
				<table class="multilinetable_selectanswer" >
				<tbody>
					<tr><td><label><input name="answer" type="radio" value="A" class="multilinetable_input_middle"/>A:为引起学生的关注，讲课时声音要大 </label> </td></tr>
					<tr><td ><label><input name="answer" type="radio" value="B" class="multilinetable_input_middle"/>B:讲课的过程当中，要经常和听众交流，让患听众感觉你在和他成为一个群体，或一个心情 </label> </td></tr>
					<tr><td><label><input name="answer" type="radio" value="C" class="multilinetable_input_middle"/>C:嗓音的运用也要阴阳顿挫，适当调节说话的语音，让人听起来比较舒服，有兴奋的作用 </label> </td></tr>
					<tr><td><label><input name="answer" type="radio" value="D" class="multilinetable_input_middle"/>D:每次专业的讲课和临床的讲课都要留30分钟或者是20分钟给学生提问题的机会 </label> </td></tr>
				</tbody>

				</table>
			</form>
		</div>
		<div class="multilinetable_title" id="multilinetable_row_1">
			<div id="multilinetable_row_1_title" >
			<label id="multilinetable_row_1_title_sn">1</label>、<label class="multilinetable_title_name" id="multilinetable_row_1_title_name">下列讲课中的礼仪修养，不恰当的一项是</label>
			</div>
			<table class="multilinetable_title_answer" id="multilinetable_row_1_title_answer">
				<tbody>
					<tr>
					<td  style="color:#0000FF;">正确的答案:<label id="multilinetable_row_1_title_answer_correct">未知</label></td>
					<td  width="50"/>
					<td  style="color:#9400D3;">推荐的答案:<label>B</label></td>
					<td  width="50"></td>
					<td  style="color:#FF0000;">错误的答案:<label>A</label></td>
					<td  width="50"></td>
					<td>本次题目标识:
					<input class="multilinetable_input_middle" type="checkbox" name="vehicle" value="thetitlelogo"/>
				</tbody>
				
			</td>
			</tr></table>
			<form class="multilinetable_from">
				<table class="multilinetable_selectanswer" >
				<tbody>
					<tr><td><label><input name="answer" type="radio" value="A" class="multilinetable_input_middle"/>A:为引起学生的关注，讲课时声音要大 </label> </td></tr>
					<tr><td ><label><input name="answer" type="radio" value="B" class="multilinetable_input_middle"/>B:讲课的过程当中，要经常和听众交流，让患听众感觉你在和他成为一个群体，或一个心情 </label> </td></tr>
					<tr><td><label><input name="answer" type="radio" value="C" class="multilinetable_input_middle"/>C:嗓音的运用也要阴阳顿挫，适当调节说话的语音，让人听起来比较舒服，有兴奋的作用 </label> </td></tr>
					<tr><td><label><input name="answer" type="radio" value="D" class="multilinetable_input_middle"/>D:每次专业的讲课和临床的讲课都要留30分钟或者是20分钟给学生提问题的机会 </label> </td></tr>
				</tbody>

				</table>
			</form>
		</div>
		<div class="multilinetable_title" id="multilinetable_row_1">
			<div id="multilinetable_row_1_title" >
			<label id="multilinetable_row_1_title_sn">1</label>、<label class="multilinetable_title_name" id="multilinetable_row_1_title_name">下列讲课中的礼仪修养，不恰当的一项是</label>
			</div>
			<table class="multilinetable_title_answer" id="multilinetable_row_1_title_answer">
				<tbody>
					<tr>
					<td  style="color:#0000FF;">正确的答案:<label id="multilinetable_row_1_title_answer_correct">未知</label></td>
					<td  width="50"/>
					<td  style="color:#9400D3;">推荐的答案:<label>B</label></td>
					<td  width="50"></td>
					<td  style="color:#FF0000;">错误的答案:<label>A</label></td>
					<td  width="50"></td>
					<td>本次题目标识:
					<input class="multilinetable_input_middle" type="checkbox" name="vehicle" value="thetitlelogo"/>
				</tbody>
				
			</td>
			</tr></table>
			<form class="multilinetable_from">
				<table class="multilinetable_selectanswer" >
				<tbody>
					<tr><td><label><input name="answer" type="radio" value="A" class="multilinetable_input_middle"/>A:为引起学生的关注，讲课时声音要大 </label> </td></tr>
					<tr><td ><label><input name="answer" type="radio" value="B" class="multilinetable_input_middle"/>B:讲课的过程当中，要经常和听众交流，让患听众感觉你在和他成为一个群体，或一个心情 </label> </td></tr>
					<tr><td><label><input name="answer" type="radio" value="C" class="multilinetable_input_middle"/>C:嗓音的运用也要阴阳顿挫，适当调节说话的语音，让人听起来比较舒服，有兴奋的作用 </label> </td></tr>
					<tr><td><label><input name="answer" type="radio" value="D" class="multilinetable_input_middle"/>D:每次专业的讲课和临床的讲课都要留30分钟或者是20分钟给学生提问题的机会 </label> </td></tr>
				</tbody>

				</table>
			</form>
		</div>
		<div class="multilinetable_title" id="multilinetable_row_1">
			<div id="multilinetable_row_1_title" >
			<label id="multilinetable_row_1_title_sn">1</label>、<label class="multilinetable_title_name" id="multilinetable_row_1_title_name">下列讲课中的礼仪修养，不恰当的一项是</label>
			</div>
			<table class="multilinetable_title_answer" id="multilinetable_row_1_title_answer">
				<tbody>
					<tr>
					<td  style="color:#0000FF;">正确的答案:<label id="multilinetable_row_1_title_answer_correct">未知</label></td>
					<td  width="50"/>
					<td  style="color:#9400D3;">推荐的答案:<label>B</label></td>
					<td  width="50"></td>
					<td  style="color:#FF0000;">错误的答案:<label>A</label></td>
					<td  width="50"></td>
					<td>本次题目标识:
					<input class="multilinetable_input_middle" type="checkbox" name="vehicle" value="thetitlelogo"/>
				</tbody>
				
			</td>
			</tr></table>
			<form class="multilinetable_from">
				<table class="multilinetable_selectanswer" >
				<tbody>
					<tr><td><label><input name="answer" type="radio" value="A" class="multilinetable_input_middle"/>A:为引起学生的关注，讲课时声音要大 </label> </td></tr>
					<tr><td ><label><input name="answer" type="radio" value="B" class="multilinetable_input_middle"/>B:讲课的过程当中，要经常和听众交流，让患听众感觉你在和他成为一个群体，或一个心情 </label> </td></tr>
					<tr><td><label><input name="answer" type="radio" value="C" class="multilinetable_input_middle"/>C:嗓音的运用也要阴阳顿挫，适当调节说话的语音，让人听起来比较舒服，有兴奋的作用 </label> </td></tr>
					<tr><td><label><input name="answer" type="radio" value="D" class="multilinetable_input_middle"/>D:每次专业的讲课和临床的讲课都要留30分钟或者是20分钟给学生提问题的机会 </label> </td></tr>
				</tbody>

				</table>
			</form>
		</div>
	</div>
	
</body>

<script type="text/javascript">

	$(function(){
		Logger.log("asas啊啊");
		$('#answerRecorder').multilinetable({
		'datas': [{title:"1、下列讲课中的礼仪修养，不恰当的一项是", A:"为引起学生的关注，讲课时声音要大",
B:"讲课的过程当中，要经常和听众交流，让患听众感觉你在和他成为一个群体，或一个心情"
,C:"嗓音的运用也要阴阳顿挫，适当调节说话的语音，让人听起来比较舒服，有兴奋的作用"
,D:"每次专业的讲课和临床的讲课都要留30分钟或者是20分钟给学生提问题的机会"},{title:"2、关于讲课中动作和眼神交流的运用，叙述不正确的一项是（ B[答案正确]）"
,A:"如果肢体语言过于频繁，会让学生感觉很累，或者影响思路",
B:"动作不规范，对讲课效果不大，但还是应该避免此类情况",
C:"要适当和学生有眼神交流，让学生感觉到教师在关注他",
D:"眼神交流要适度，不要只盯着一个方向"}]
	});
	$('#answerRecorder').multilinetable_reload({
		'datas': [{title:"1.下列讲课中的礼仪修养，不恰当的一项是", A:"为引起学生的关注，讲课时声音要大",
B:"讲课的过程当中，要经常和听众交流，让患听众感觉你在和他成为一个群体，或一个心情"
,C:"嗓音的运用也要阴阳顿挫，适当调节说话的语音，让人听起来比较舒服，有兴奋的作用"
,D:"每次专业的讲课和临床的讲课都要留30分钟或者是20分钟给学生提问题的机会"},{title:"2、关于讲课中动作和眼神交流的运用，叙述不正确的一项是（ B[答案正确]）"
,A:"如果肢体语言过于频繁，会让学生感觉很累，或者影响思路",
B:"动作不规范，对讲课效果不大，但还是应该避免此类情况",
C:"要适当和学生有眼神交流，让学生感觉到教师在关注他",
D:"眼神交流要适度，不要只盯着一个方向"}]
	});
	
    $("body").css("overflow","auto"); 
	});
	</script>
</html>