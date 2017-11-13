<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path+"/" ;
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
    <base href="<%=basePath%>">
    
    <title>答案记录器</title>
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
        $(function(){
            $("#addtopic_dialog").dialog({
                title:"添加题目",
                iconCls:"icon-print",
                modal:true,  //是否将窗体显示为模式化窗口
                collapsible:true, //是否显示可折叠按钮
                minimizable:true, //是否显示最小化按钮
                buttons:[{
                    text:"提交",
                    iconCls:'icon-add',
                    handler:function(){
                        $.ajax({
                            url:"<%=request.getContextPath()%>/springanswerrecorder/addtopic",
                            type:"post",
                            data:$("#addtopicForm").serialize(),
                            dataType:"json",
                            success:function(data){
                                alert("success"+data.msg);
                                if(data.msg=="登录成功"){
                                    $("#dig").dialog("close");
                                }
                            },
                            error:function(data){
                                alert("error"+data.msg);
                            }
                        })
                    }
                },{
        text:'关闭',
            iconCls:'icon-cancel',
            handler:function(){ $('#addtopic_dialog').dialog('close');}}]
            });
        });

        //设置答案错误标识
        function logoWrongTopic(index,islogotopic) {
            Logger.log("logoWrongTopic."+index+",islogotopic="+islogotopic);
            $.ajax({
                type: 'post',
                url:'<%=basePath%>springanswerrecorder/logowrongtopic/'+index+'/'+islogotopic,
                dataType:'text',
                success:function(data){
                    Logger.log("data="+data);
                    if(data=='success'){
//                        $('body').offset()
                        location.reload();
                    }else {
                        alert(data);
                    }
                },
                error:function(data){
                }
            });
        }

        function logoTopic(index,islogotopic) {
            Logger.log("logoTopic."+index+",islogotopic="+islogotopic);
            $.ajax({
                type: 'post',
                url:'<%=basePath%>springanswerrecorder/logotopic/'+index+'/'+islogotopic,
                dataType:'text',
                success:function(data){
                    Logger.log("data="+data);
                    if(data=='success'){
                        location.reload();
                    }else {
                        alert(data);
					}
                },
                error:function(data){
                }
            });
        }

        function setAllLogoTopic(issetalllogotopic) {
            Logger.log("setalllogotopic="+issetalllogotopic);
            $.ajax({
                type: 'post',
                url:'<%=basePath%>springanswerrecorder/setalllogotopic/'+issetalllogotopic,
                dataType:'text',
                success:function(data){
                    Logger.log("data="+data);
                    if(data=='success'){
                        location.reload();
                    }else {
                        alert(data);
                    }
                },
                error:function(data){
                }
            });
        }


        //清空题目
        function clearTopic()
        {
//            $('#submitLogo_dialog').dialog('open');$('#datas_dialog').window('center');
            $.messager.defaults={ok:"确定",cancel:"取消"};
            $.messager.confirm('提示',"请确保已保存当前所以题目答案,清空之后将无法再恢复.",function(r){
                if (r){
                    $.ajax({
                        type: 'get',
                        url:'<%=basePath%>springanswerrecorder/cleartopic/',
                        dataType:'text',
                        success:function(data){
                            Logger.log("data="+data);
                            if(data=='success'){
                                window.location.href=window.location.href;
                            }else {
                                alert(data);
                            }
                        },
                        error:function(data){
                        }
                    });
                }
            });
        }

        //提交
        function submitLogo()
        {
//            $('#submitLogo_dialog').dialog('open');$('#datas_dialog').window('center');
            $.messager.defaults={ok:"确定",cancel:"取消"};
            $.messager.confirm('提示',"提交之后将自动生成'正确答案,推荐答案'以及'错误答案',无法再做修改!",function(r){
                if (r){
                    $.ajax({
                        type: 'post',
                        url:'<%=basePath%>springanswerrecorder/submitlogo/',
                        dataType:'text',
                        success:function(data){
                            Logger.log("data="+data);
                            if(data=='success'){
                                location.reload();
                            }else {
                                alert(data);
                            }
                        },
                        error:function(data){
                        }
                    });
                }
            });
        }

        function setTopicError() {
            Logger.log("setTopicError");
//            var from =  $("#addtopicForm");
            var from =  document.getElementById("addtopicForm");
            from.action="<%=basePath%>springanswerrecorder/settopicerror";
            from.submit();

        }

        function addtopic()
        {
            $('#addtopic_dialog').dialog('open');$('#datas_dialog').window('center');
        }

	</script>
	
</head>
<body  class="easyui-layout" style="overflow:auto;">
	<div  align="left" style="width:70%;margin:0 auto;">
		要添加的题目:
        <br>
		<textarea id="topictextarea" rows="10" cols="134" name="topic" form="addtopicForm" ></textarea>
		<form id="addtopicForm" align="right"   method="post">
			<!--
            <input name="topic" class="easyui-textbox" data-options="multiline:true" value="" style="width:100%;height:100%">
            -->
			<br>
			<input  type="submit" value="添加题目" />

			<button type="button" name="button" onclick="setTopicError()">提交错误题目</button>
		</form>
	</div>
	<br>
	<div style="width:800px;margin:0 auto;" align="right" >
		<input class="multilinetable_input_middle" type="button" name="setalllogotopictrue" value="本次题目标识(全选)"  onclick="setAllLogoTopic('true')"/>
		<input class="multilinetable_input_middle" type="button" name="setalllogotopicfalse" value="本次题目标识(取消全选)"  onclick="setAllLogoTopic('false')"/>
		&nbsp&nbsp
		<input class="multilinetable_input_middle" type="button" name="actionlogotopic" value="提交本次题目标识/回答错误标识"  onclick="submitLogo()"/>
		&nbsp&nbsp
		<input class="multilinetable_input_middle" type="button" name="actionclearTopic" value="清空题目"  onclick="clearTopic()"/>
	</div>

	<div style="width:800px;margin:0 auto;">
            推荐答案(${topicstemp.size()}):
		<c:forEach items="${topicstemp}" var="topic">
			${topic.answerrecommends};
		</c:forEach>
	</div>
	<div style="width:800px;margin:0 auto;">
		题目总计:${topics.size()};
		&nbsp&nbsp
		未有正确答案:${nocorrectscount};
		&nbsp&nbsp
		已选择:${logotopiccount};
		&nbsp&nbsp
		错误题目:${logowronganswercount}条;
		&nbsp&nbsp

	</div>
    <!--
	<div style="text-align:center;"><a onclick="addtopic();"class="easyui-linkbutton" iconCls="icon-add">添加题目</a></div>
	-->

	<div id="answerRecorder"  style="width:800px;margin:0 auto;">
    <c:forEach items="${topics}" var="topic">
		<div class="multilinetable_title" id="multilinetable_row_1">
			<div id="multilinetable_row_1_title" >
				<label id="multilinetable_row_1_title_sn">${topic.sn}</label>、<label class="multilinetable_title_name" id="multilinetable_row_1_title_name">${topic.title}</label>
			</div>
			<table class="multilinetable_title_answer" id="multilinetable_row_1_title_answer">
				<tbody>
				<tr>
					<td  style="color:#0000FF;">正确的答案:<label id="multilinetable_row_1_title_answer_correct">${topic.answercorrects}</label></td>
					<td  width="50"/>
					<td  style="color:#9400D3;">推荐的答案:<label>${topic.answerrecommends}</label></td>
					<td  width="50"></td>
					<td  style="color:#FF0000;">错误的答案:<label>${topic.answerwrongs}</label></td>
					<td  width="50"></td>
					<td>本次题目标识:
                        <c:choose>
							<c:when test="${topic.logotopic}">
                                <c:set var="logotopic" value="checked=\"checked\"" />
								<c:set var="logowronganswerdisabled" value="" />
							</c:when>
                            <c:otherwise>
								<c:set var="logotopic" value="" />
								<c:set var="logowronganswerdisabled" value="disabled=\"disabled\"" />
                            </c:otherwise>

						</c:choose>
						<input class="multilinetable_input_middle" type="checkbox" name="logotopic" value="thetitlelogo" ${logotopic} onclick="logoTopic('${topics.indexOf(topic)}',this.checked)"/>
					</td>
					<td>答案错误标识:
						<c:choose>
							<c:when test="${topic.logowronganswer}">
								<c:set var="logowronganswer" value="checked=\"checked\"" />
							</c:when>
							<c:otherwise>
								<c:set var="logowronganswer" value="" />
							</c:otherwise>

						</c:choose>
						<input class="multilinetable_input_middle" type="checkbox" ${logowronganswerdisabled}   name="logotopic" value="thetitlelogo" ${logowronganswer} onclick="logoWrongTopic('${topics.indexOf(topic)}',this.checked)"/>
					</td>
				</tr>
				</tbody>
			</table>
			<form class="multilinetable_from">
				<table class="multilinetable_selectanswer" >
					<tbody>
					<c:forEach items="${topic.options}" var="option">
						<tr><td><label><input name="answer" type="radio" disabled="true" value="${option.key}" class="multilinetable_input_middle"/>${option.value} </label> </td></tr>
					</c:forEach>
					<!--
					<tr><td ><label><input name="answer" type="radio" value="B" class="multilinetable_input_middle"/>B:讲课的过程当中，要经常和听众交流，让患听众感觉你在和他成为一个群体，或一个心情 </label> </td></tr>
					<tr><td><label><input name="answer" type="radio" value="C" class="multilinetable_input_middle"/>C:嗓音的运用也要阴阳顿挫，适当调节说话的语音，让人听起来比较舒服，有兴奋的作用 </label> </td></tr>
					<tr><td><label><input name="answer" type="radio" value="D" class="multilinetable_input_middle"/>D:每次专业的讲课和临床的讲课都要留30分钟或者是20分钟给学生提问题的机会 </label> </td></tr>
					-->
					</tbody>

				</table>
			</form>
		</div>
	</c:forEach>
	</div>

	<!--
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
					</td>
					</tr>
				</tbody>
				</table>
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
		<div class="multilinetable_title">
			关于讲课中动作和眼神交流的运用，叙述不正确的一项是
			<form class="multilinetable_from">
				<table class="multilinetable_selectanswer" >
				<tbody>
					<tr><td><label><input name="answer" type="radio" value="A" />A:如果肢体语言过于频繁，会让学生感觉很累，或者影响思路 </label> </td></tr>
					<tr><td><label><input name="answer" type="radio" value="B" />B:动作不规范，对讲课效果不大，但还是应该避免此类情况 </label> </td></tr>
					<tr><td><label><input name="answer" type="radio" value="C" />C:要适当和学生有眼神交流，让学生感觉到教师在关注他 </label> </td></tr>
					<tr><td><label><input name="answer" type="radio" value="D" />D:眼神交流要适度，不要只盯着一个方向 </label> </td></tr>

				</tbody>
				</table>
			</form>
		</div>
	</div>
	-->

    <!--

	<div id="addtopic_dialog" class="easyui-dialog" title="添加题目" style="width:600px;height:400px;"
		 data-options="iconCls:'icon-print',closed:true,resizable:true,modal:false,maximizable:true,buttons: [{
					text:'关闭',
					iconCls:'icon-cancel',
					handler:function(){ $('#addtopic_dialog').dialog('close');}}]">
			<div  data-options="fit:true,border:false,plain:true" style="width:100%;height:100%">
			<form id="addtopicForm"  style="width:100%;height:100%">
				<input name="topic" class="easyui-textbox" data-options="multiline:true" value="" style="width:100%;height:100%">
			</form>
			<br>
		</div>
	</div>
	-->
	<!--
	<button type="button" name="button" onclick="asus()">测试滚动条位置</button>
	-->
</body>

<script type="text/javascript">

	$(function() {
        Logger.log("asas啊啊");

        $('#topictextarea').change(function(){
            Logger.log("topictextarea.change");
            Logger.log($(this).val());
            var oldvalue=$(this).val();
            var newvalue=oldvalue.replace(/ /g,' ');
            $(this).val(newvalue);
        });
    });



</script>


<script type="text/javascript">
     function asus() {
         Logger.log("onbeforeunload");
         var scrollPos;
         if (typeof window.pageYOffset != 'undefined') {
             Logger.log("onbeforeunload.1");
             scrollPos = window.pageYOffset;
         }
         else if (typeof document.compatMode != 'undefined' &&
             document.compatMode != 'BackCompat') {
             Logger.log("onbeforeunload.2");
             scrollPos = document.documentElement.scrollTop;
         }
         else if (typeof document.body != 'undefined') {
             Logger.log("onbeforeunload.3");
             scrollPos = document.body.scrollTop;
         }
         Logger.log("asus--------");
         Logger.log(window.pageYOffset);
         Logger.log(document.body.scrollTop);
         document.cookie = "scrollTop=" + scrollPos; //存储滚动条位置到cookies中
         Logger.log(document.cookie);
//         alert(document.cookie)
    }
    //重载页面前记录滚动条位置
    window.onbeforeunload = function () {
        scrollPos = document.body.scrollTop;
        document.cookie = "scrollTop=" + scrollPos; //存储滚动条位置到cookies中
    }

     //重载页面后滚动条回到当前位置
    window.onload = function () {
        Logger.log("onload");
        Logger.log(document.cookie);
        if (document.cookie.match(/scrollTop=([^;]+)(;|$)/) != null) {
            var arr = document.cookie.match(/scrollTop=([^;]+)(;|$)/); //cookies中不为空，则读取滚动条位置
            document.documentElement.scrollTop = parseInt(arr[1]);
            document.body.scrollTop = parseInt(arr[1]);

            Logger.log("set scrollTop");
            Logger.log(document.body.scrollTop);
        }
    }

</script>
</html>