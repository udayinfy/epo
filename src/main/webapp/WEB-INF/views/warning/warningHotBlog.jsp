<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../top.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>广州广报</title>
<link type="text/css"  href="${ctx }/static/style/datepicker.css" rel="stylesheet"/>
<script type="text/javascript" src="${ctx }/static/js/blog.js"></script>
<script type="text/javascript" src="${ctx }/static/js/datepicker.js"></script>
<script type="text/javascript" src="${ctx }/static/js/eye.js"></script>
<script type="text/javascript" src="${ctx }/static/js/chooseDate.js"></script>

</head>
<body>
<div class="con">
<!-- topNav start -->
	<div class="topNav">
		<div class="navDiv"><a href="/mainMedia/index" >主流媒体舆情</a></div>
		<div class="navDiv  act"><a href="/warning/index" >舆情预警</a></div> 
		<div class="navDiv"><a href="/cityRecognize/index" >城市形象与认知度</a></div>
		<div class="navDiv"><a href="/leaderRecognition/index" >舆论领袖识别</a></div>
		<div class="navDiv"><a href="/knowledgeDictLibManage/index" >知识库管理</a></div>
		<div class="navDiv"><a href="/systemManage/index" >系统管理</a></div>
	</div>
<!-- topNav end -->

<!-- table content start -->
	<div class="tableContent">
	<table cellpadding="0" cellspacing="0">
		<tr>
			<td valign="top">
				<div class="tableContentLeft">
					<div class="navTitle"><a href="/warning/index" >舆情预警概况</a></div>
					<div class="navSubTitle"><a href="/warning/warningHotWeibo" >热点涉穂微博</a></div>
					<div class="navSubTitle"><a href="/warning/warningHotPost" >热点涉穂帖子</a></div>
					<div class="navSubTitle"><a class="act" href="/warning/warningHotBlog" >热点涉穂博客</a></div>
					<!-- 
					<div class="navSubTitle"><a href="/warning/warningDepartment" >部门关注度</a></div>
					 -->
					<div class="navSubTitle"><a href="/warning/warningSensitive" >敏感舆情预警</a></div>
					<div class="navSubTitle"><a href="/warning/warningNow" >实时预警舆情</a></div>
				</div>
			</td>
			<td class="tdBak" valign="top">
				<div class="tableContentRight">
					<div class="currentPosition">
					&nbsp;&nbsp;&nbsp;&nbsp;当前位置：&nbsp;&nbsp;舆情预警&nbsp;>&nbsp;热点涉穂博客
					</div>
					
				<!-- 页面内容 start -->
				
							
<!-- 弹出框 start -->

	<div class="popupBoxXX">
		<div class="popupBoxTitle popupBoxTitleXX">信息纠错</div>
		<div class="popupBoxCon popupBoxConXX">
			<div class="popupBoxConXXSpan">
				<span class="popupBoxConXXSpanL">错误类型：</span>
				<span class="popupBoxConXXSpanR">
					<select>
						<option value="1">信息过滤</option>
						<option value="2">区县分析</option>
						<option value="3">部门分析</option>
						<option value="0">其他</option>
					</select>
				</span>
			</div>

			<div class="popupBoxConXXSpanT">
				<span class="popupBoxConXXSpanL">纠错备注：</span>
				<span class="popupBoxConXXSpanRT">
					<textarea></textarea>
				</span>
			</div>

			<div class="lineXX">系统记录将纠错信息，提高分析准确度</div>

		</div>
		<div class="popupBoxBntXX">
			<a href="###" class="bntLeft"></a>
			<a href="###" onclick="return coveColse()" class="bntRight"></a>
		</div>
	</div>
<!-- 弹出框 end -->

<!-- 弹出框 start -->
	<div class="popupBox">
		<div class="popupBoxTitle">系统提示</div>
		<div class="popupBoxCon">
			成功添加到舆情研判
		</div>
		<div class="popupBoxBnt">
			<a href="###" onclick="return coveColse()" class="bntClose bntCloseML"></a>
		</div>
	</div>
<!-- 弹出框 end -->

<div class="mainstream marginTop">

<!-- 线性图表 start -->
	<div class="informationSourceTitle">
		<span class="sourceLeft">热点涉穂博客</span>
	</div>
	<div class="clumnTBox">
		<div class="Choice" id='Choice'>
			
			<span>来源网站：</span>
			<span class="inputDiv2">
			<select id="site" class="select" name="site" width="18">
			<option value="">所有</option>
			<c:forEach items="${webSiteNameList}" var="types">
					<option value="${types.key}">${types.value}</option>
			</c:forEach>
			</select>
			</span>
			
			<span  class="space2">时间：</span>
			<span class="inputDiv2">
				<select name='day' id='day'>
					<option value=1>1天</option>
					<option value=7>7天</option>
					<option value=14>14天</option>
					<option value=30>30天</option>
				</select>
			</span>
			<span  class="space2">排序：</span>
			<span class="inputDiv2">
				<select name='TopPage' id='TopPage'>
					<option value=1>1-10</option>
					<option value=2>11-20</option>
				</select>
			</span>
			<span class="amplification"><a href="/blog/monitorBlog" target="_blank"></a></span>
			<div class="clear"></div>
		</div>
	</div>

	<!-- table list start -->	
	<div class="tableListBox tableListBoxHHHH" id='tableListBox'>
		
	</div>
<!-- table list end -->
<!-- 线性图表 end -->

	<div class="clear"></div>
<!-- 微博信息列表 start -->
	<div class="mainstream">
		<div class="informationSourceTitle marginTop">
		<span class="sourceLeft">博客信息列表</span>
		</div>
	
		<form action="/blog/blogSearch" id="weiboSearch" method="post">
			<div class="systemSearch mainstreamW1" id='newsSearch'>
				<span>来源网站：</span>
				<span class="inputDiv2 inputDiv4">
				<select id="wsmId" class="select" name="wsmId" style="width:120px">
				<option value="">所有</option>
				<c:forEach items="${webSiteNameList}" var="types">
					<option value="${types.key}">${types.value}</option>
				</c:forEach>
				</select>
				</span>
				
				<span class="space1">时间：</span>
				
				<span id="widget">
					<div id="widgetField">
						<span> ${ startTime}&nbsp;至&nbsp;${ endTime} </span>
						<a href="#">Select date range</a>
					</div>
					<div id="widgetCalendar">
					</div>
				</span>
				
				<span class="input"><input type="text" name='content' style="position: relative; width: 230px; height: 24px; margin-left: 0px; left: 8px;"/></span>
				<span class="img" onclick="getItemVal(1)"><a href="###">&nbsp;</a></span>
			</div>
		</form>
		
		<div class="clear"></div>
		
		<!-- table list start -->
		<div class="tableListDiv  marginTop1" id='newsList'>
			<div class="tableListDivNav">
				<div id="pageInfo" class="tableListDivNavLeft"></div>
				
				<div class="tableListDivNavRight tableListwidth">
					<select onchange="getItemList(1)" class="select" name='sortOrder' id='sortOrder' >
						<option value='0'>时间排序</option>
						<option value='1'>热度排序</option>
					</select>
				</div>
			</div>
			<div class="tableListDivTable mainstreamB">
				<div id="loading" class="centerImg" style="height:328px;"><img src="/static/images/loadingBig.gif" /></div>
				<!-- 列表内容 start -->
				<table id="tableContainer" cellpadding="0" cellspacing="0"></table>
				<!-- 列表内容 end -->
				
				<!-- 分页 start -->
				<div class="tablePage" id="pageContainer"></div>
				<!-- 分页 end -->
			</div>
		</div>
		<!-- table list end -->
	</div>
<!-- 微博信息列表 end -->

</div>

<script type="text/javascript">
$(function()
{
//执行返回顶部效果
setInterval("backToTop()",100);
});

//返回顶部效果
function backToTop()
{
	var top = ($(window).height() - $(".backTop").height())/2 + $(document).scrollTop() +'px';
	$(".backTop").css({top:top,display:'block'});
}
</script>
<script>
	//TOP20排序JS
	$('#TopPage').live("change",function(){
		if($('#TopPage').attr('value')==1){
			$('#Top1').show();
			$('#Top2').hide();
		}else{
			$('#Top1').hide();
			$('#Top2').show();
		}
	});

//TOP20 ajax
loading('#tableListBox');
$.ajax({
	type: "post",
	url: "/blog/blogIndex",
	data: 'day=1',
	dataType:"json",
	success: function(json){
		putWeibo(json);
	},
	error: function(){
		alert("请求错误");
	}
});	

	//TOP20ajax
	$('[name=site],#day').live("change",function() {
		var ajaxData='';
		if($('#Choice input:checked').attr('value')!==''){
			ajaxData+=("&"+'site' +"="+$('[name=site]').attr('value'));
		}
		ajaxData+="&"+'day' +"="+$('[name=day]').attr('value');
		ajaxData=ajaxData.substr(1);
		//排序效果
		loading('#tableListBox');
		$.ajax({
				type: "post",
				url: "/blog/blogIndex",
				data: ajaxData,
				dataType:"json",
				success: function(json){
					putWeibo(json);
				},
				error: function(){
					alert("请求错误");
				}
			});
	});
	
	function loading(id){
		var loading='<div class="centerImg" style="margin-top:140px"><img src="/static/images/loadingBig.gif" /></div>';
		$(id).html(loading);
	}

</script>

<script type="text/javascript">
//初始化请求
$(function(){
	getItemVal(1);
});

//弹出框居中
function coveDiv(e){
	$('.popupBoxCove').css({opacity:'0.5',width:$(window).width(),height:$(document).height(),display:'block'});
	$('.popupBoxXX').css({left:($(window).width()-573)/2+'px',top:($(window).height()-310)/2+$(document).scrollTop()+'px',display:'block'});	
	$('.popupBoxConXXSpanRT textarea').val('');
	$('.popupBoxBntXX .bntLeft').unbind('click');
	$('.popupBoxBntXX .bntLeft').bind('click',function(){
		return coveSubmit(e);
	});
	return false;
}

//关闭弹出框
function coveColse(){
	$(".popupBoxCove").css({opacity:'0',display:'none'});
	$(".popupBox").css({display:'none'});	
	$(".popupBoxXX").css({display:'none'});
	$('.popupBoxConXXSpanR select option').attr("selected", false);
	$('.popupBoxConXXSpanR select option[value=1]').attr("selected", true);
	return false;
}

//提交
function coveSubmit(e){
	var url  = e.href;
	var icmUUID = $(e).parent().siblings('input').val();
	var objParams = {};
	objParams['InfoCorrectionManage'] = {};
	objParams['InfoCorrectionManage']['ietId'] = $('.popupBoxConXXSpanR select').val();			//错误类型ID
	objParams['InfoCorrectionManage']['icmRemarks'] = $('.popupBoxConXXSpanRT textarea').val();	//纠错备注

	$.ajax({
		type : 'post',
		url : url,
		data : objParams,
		dataType : 'json',
		error:function(){return false;},
		success : function(response) {
			if (response != null) {
				coveChange(response);
			}
		}
	});
	return false;
}


//提交后反馈
function coveChange(response){
	if(response[0] == '1'){
		$(".popupBox").find(".popupBoxCon").html("成功添加到舆情研判");
		$(".popupBoxCove").css({opacity:'0.5',width:$(document).width(),height:$(document).height(),display:'block'});
		$(".popupBox").css({left:($(window).width()-308)/2+'px',top:($(window).height()-280)/2+$(document).scrollTop()+'px',display:'block'});	
		$(".popupBoxXX").css({display:'none'});
	}else if(response[0] == '0'){
		$(".popupBox").find(".popupBoxCon").html("该信息已存在，不能重复添加");
		$(".popupBoxCove").css({opacity:'0.5',width:$(document).width(),height:$(document).height(),display:'block'});
		$(".popupBox").css({left:($(window).width()-308)/2+'px',top:($(window).height()-280)/2+$(document).scrollTop()+'px',display:'block'});	
		$(".popupBoxXX").css({display:'none'});
	}		
}

function putWeibo(data){
	
	loading('#tableListBox');
	if(data==''){
		setTimeout(function(){nonum('tableListBox')},500);
	}else{
		var weiboList='';
		weiboList+='<div id="Top1">';
		for(e in data){
			var num=parseInt(e)+1;
			if(e==10){
				weiboList+='</div>';
				weiboList+='<div id="Top2">';
			}
			weiboList+='<div class="tableList tableListHei">';
			weiboList+='<table cellpadding="0" cellspacing="0">';
			weiboList+='<tr>';
			if(num<=4){
				weiboList+='<td valign="bottom"><div class="newsCount newsCount4">'+num+'</div></td>';
				weiboList+='<td class="PeopleBorder2">';
			}else{
				weiboList+='<td valign="bottom"><div class="newsCount">'+num+'</div></td>';
				weiboList+='<td class="PeopleBorder1 PeopleBorder1C">';
			}	
			weiboList+='<div class="newsDocket PeopleDocket2"><a href="'+data[e].url+'" title="'+data[e].fullContent+'" target="_blank">';
				if(data[e].wsmId == $('#site_0').val()){
					//weiboList+='<img class="mbImg" src="/static/images/xinlang.gif" />';
				}else{
					//weiboList+='<img class="mbImg" src="/static/images/tx.gif" />';
				}
			weiboList+=data[e].content+'</a></div>';
			weiboList+='<div class="sumTime">';
			weiboList+='<span class="reprint clubReprint PeopleTimeMbnAdd">评论：<tt>'+data[e].comment+'</tt></span>';
			weiboList+='<span class="soucre clubsoucre PeopleTimeMbnAdd">转发：<tt>'+data[e].ftorwarding+'</tt></span>';
			weiboList+='<div class="clear"></div>';
			weiboList+='<span class="soucre PeopleTimeMbnLaiy">作者：<tt>'+data[e].author+'</tt></span>';
			weiboList+='<span class="time PeopleTimeMbnLaiy" >时间：<tt>'+data[e].date+'</tt></span>';
			weiboList+='</div>';
			weiboList+='</td>';
			weiboList+='</tr>';
			weiboList+='</table>';
			weiboList+='</div>';
		}
		weiboList+='</div>';

		setTimeout(function(){
			$('#tableListBox').html(weiboList)
			$('#Top1').show();
			$('#Top2').hide();
			$('#TopPage').val(1);
			if(data=='' || e<10){
				$('#TopPage option:last').hide();
			}else{
				$('#TopPage option:last').show();
			}
		},500);
		
	}
}

function nonum(boxid)
{
	$("#"+boxid).html('<div class="centerImg" style="margin-top:140px"> <img class="nonum" src="/static/images/nonum.jpg" /> </div>');
}

</script>


				
				<!-- 页面内容  end -->
				
				</div>
			</td>
		</tr>
	</table>
	</div>
<!-- table content end -->
</div>

<%@include file="../bottom.jsp"%>
</body>
</html>