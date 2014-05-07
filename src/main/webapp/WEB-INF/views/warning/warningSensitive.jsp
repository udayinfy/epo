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
<script type="text/javascript" src="${ctx }/static/js/warningHot.js"></script>
<script type="text/javascript" src="${ctx }/static/js/datepicker.js"></script>
<script type="text/javascript" src="${ctx }/static/js/eye.js"></script>
<script type="text/javascript" src="${ctx }/static/js/chooseDate.js"></script>
<script type="text/javascript" src="${ctx }/static/js/jsapi"></script>
<script type="text/javascript" src="${ctx }/static/js/format+zh_CN,default,corechart.I.js"></script>
</head>
<body>
<div class="con">
<!-- topNav start -->
	<div class="topNav">
		<c:forEach items="${menuList}" var="one_menu">
				<c:if test="${one_menu.status eq 1}">
					<div <c:choose>
					       <c:when test="${one_menu.id eq pMenuId}">
					       	class="navDiv act"
					       </c:when>
					       <c:otherwise>
					       	class="navDiv"
					       </c:otherwise>
						</c:choose>
					>
					<a href="${one_menu.menuUrl}/${one_menu.id}" >${one_menu.menuName}</a>
					</div>
				</c:if>
		</c:forEach>
	</div>
<!-- topNav end -->

<!-- table content start -->
	<div class="tableContent">
	<table cellpadding="0" cellspacing="0">
		<tr>
			<td valign="top">
				<div class="tableContentLeft">
					<c:forEach items="${menu.subMenuList}" var="fir_menu">
						<c:if test="${fir_menu.status eq 1}">
							<div class="navSubTitle">
								<a <c:choose>
								       <c:when test="${fir_menu.id eq sMenuId}">
								       	class="act"
								       </c:when>
								       <c:otherwise>
								       	class=""
								       </c:otherwise>
									</c:choose>
								href="${fir_menu.menuUrl}/${fir_menu.id}" >
								${fir_menu.menuName}
								</a>
							</div>
							<c:forEach items="${fir_menu.subMenuList}" var="sec_menu">
								<c:if test="${sec_menu.status eq 1}">
									<div class="navSupTitle">
										<a <c:choose>
										       <c:when test="${sec_menu.id eq sMenuId}">
										       	class="act"
										       </c:when>
										       <c:otherwise>
										       	class=""
										       </c:otherwise>
											</c:choose>
										href="${sec_menu.menuUrl}/${sec_menu.id}" >
										${sec_menu.menuName}
										</a>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</c:forEach>
				</div>
			</td>
			<td class="tdBak" valign="top">
				<div class="tableContentRight">
					<div class="currentPosition">
					&nbsp;&nbsp;&nbsp;&nbsp;当前位置：&nbsp;&nbsp;<a href="${fUrl }" >${fMenu }</a>
					&nbsp;>&nbsp;<a href="${sUrl }" >${sMenu }</a>
					<c:if test="${not empty tMenu}">&nbsp;>&nbsp;<a href="${tUrl }" >${tMenu }</a></c:if>
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

			<div class="lineXX">系统记录将纠错信息，提高反洗准确度</div>

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
							<span class="sourceLeft">当前舆情预警</span>
						</div>
						<div class="clumnTBox">
							<div class="Choice">
								<div class="">
									<span class="systemSearchRight marginLeft" id="selectType" style="padding:0 10px 0 35px;">
										<span class="chbox"><input type="checkbox" checked="checked" value="News" name="new" />新闻</span>
										<span class="chbox"><input type="checkbox" checked="checked" value="Comment" name="comment" />评论</span>
										<span class="chbox"><input type="checkbox" checked="checked" value="Weibo" name="weibo" />微博</span>
										<span class="chbox"><input type="checkbox" checked="checked" value="Forum" name="forum" />论坛</span>
										<span class="chbox"><input type="checkbox" checked="checked" value="Blog" name="blog" />博客</span>
									</span>

									<span class="systemSearchRight marginLeft">
										<select id="tableDate" class="select">
											<option value="7">最近7天</option>
											<option value="14">最近14天</option>
											<option value="30">最近30天</option>
										</select>
									</span>
								</div>
								<div class="clear"></div>
							</div>
							<!--<div class="marginTop2" id="columnChart1"></div>-->
							<div class="centerImg" id="columnChart1" style="overflow:hidden;height:328px;"><img src="/static/images/loadingBig.gif" /></div>
							<div class="loading"></div>
						</div>

						<!-- table list start -->
						
						<div class="tableListBox">
						<div class="Choice" style="padding:10px 20px 0 42px;">
							<span>时间：</span>
							<span class="inputDiv2" style="padding-right:10px;">
							<form action="/sensitive/sensitiveIndex" method="post">
								<select name="day" onchange="getData()" id="day" >
									<option value="7">7天</option>
									<option value="14">14天</option>
									<option value="30">30天</option>
								</select>
								<input type="hidden" id="statistics" value="/warning/statistics" />
							</form>
							</span>

							<span>来源：</span>
							<span class="inputDiv2">
								<form action="/sensitive/sensitiveIndex" method="post">
									<select name="type" id="type" onchange="getData()" >
										<option value="">全部</option>
										<option value="3">微博</option>
										<option value="4">论坛</option>
										<option value="1">新闻</option>
										<option value="2">评论</option>
										<option value="5">博客</option>
									</select>
									<input type="hidden" id="statistics" value="/warning/statistics" />
								</form>
							</span>
							<div class="clear"></div>
						</div>

							<div class="tableListLeftBox" id="tableListLeftBox">

							
							</div>
							

							<div class="tableListRightBox" id="tableListRightBox">
							
							</div>
						</div>
<!-- table list end -->
<!-- 线性图表 end -->

						<div class="clear"></div>
<!-- 9大涉穗新闻网站列表 start -->
						
						<div class="mainstream">
							<div class="informationSourceTitle marginTop">
							<span class="sourceLeft">预警舆情列表</span>
							</div>

						<form action="/sensitive/sensitiveList" id="warningForm" method="post">
							<div class="systemSearch mainstreamW">
								<span>来源：</span>
								<span class="systemSearchLeft">
									<select id="wsmId" class="select" name="wsmId">
										<option value="">--</option>
										<option value="1">新闻</option>
										<option value="2">评论</option>
										<option value="3">微博</option>
										<option value="4">论坛</option>
										<option value="5">博客</option>
									</select>
								</span>
								<span class="space1">时间：</span>
								
								<span id="widget">
									<div id="widgetField">
										<span>${ startTime}&nbsp;至&nbsp;${ endTime} </span>
										<a href="#">Select date range</a>
									</div>
									<div id="widgetCalendar">
									</div>
								</span>
								
								<span class="input"><input id="content" onkeydown="if(event.keyCode==13){return false;}" type="text" name="content" /></span>
								<span class="img" onclick="getItemVal(1)"><a href="###">&nbsp;</a></span>
							</div>
					
							<div class="clear"></div>
<!-- table list start -->
						<div class="tableListDiv marginTop1">
						<div class="tableListDivNav">
							<div class="tableListDivNavLeft" id="pageInfo" ></div>
							<div class="tableListDivNavRight tableListwidth">
								
								<select onchange="getItemList(1)" name="sortOrder" id="sortOrder" class="select">
									<option value="0">按时间排序</option>
									<option value="1">按敏感指数排序</option>
								</select>
								
							</div>
						</div>
						</form>
						<div class="tableListDivTable mainstreamB" id="tableListDivTable">
							<table id="tableContainer" cellpadding="0" cellspacing="0"></table>
<!-- 分页 start -->
							<div class="tablePage" id="pageContainer">
								
							</div>
<!-- 分页 end -->
						</div>
						</div>
<!-- table list end -->
						</div>
						
<!-- 9大涉穗新闻网站列表 end -->

					</div>

					<input type="hidden" value="/sensitive/sensitiveList" id="warningList" />


<script type="text/javascript">
var URL=$("#url").val();//目录链接
$(function()
{
	//点击展开
	$(".aImg").live("click",function()
	{
		$(this).attr("class","aImgOpen");
		$(this).parent().siblings(".warningInput").css("display","block");
	})
	//点击关闭
	$(".aImgOpen").live("click",function()
	{
		$(this).attr("class","aImg");
		$(this).parent().siblings(".warningInput").css("display","none");
	});
});
</script>


<!--搜索分页列表start-->
<script type="text/javascript">

var statis=$($(".newsDocket")[0]).next().val();//筛选数据关键字，默认为第一个

</script>
<!--搜索分页列表end-->

<script type="text/javascript">

function getData(){

	$(".tableListLeftBox").html("<div class=\"centerImg\"><img src=\"/static/images/loadingBig.gif\" /></div>");
	$(".tableListRightBox").html("<div class=\"centerImg\"><img src=\"/static/images/loadingBig.gif\" /></div>");
	$.ajax({
		  type: 'post',
		  url: $("form").attr("action"),
		  data: {
					day:$("#day").val(),
					type:$("#type").val()
				},
		  dataType: 'json',
		  success: function(msg){

				if(msg.data1=="" && msg.data2=="" ){
					nonum('tableListLeftBox');
					nonum('tableListRightBox');
					return false;
				}

				if(msg.data1==""){
					nonum('tableListLeftBox');
					return false;
				}

				html1="";
				
				for(j in msg.data1){
					html1+='<div class="tableList space3">';
					html1+='<table cellpadding="0" cellspacing="0">';
					html1+='<tr>';
					var mycount1 = Number(j)+Number(1);
					html1+='<td valign="bottom"><div class="newsCount newsCount4">'+mycount1+'</div></td>';
					html1+='<td class="PeopleBorder2">';
					html1+='<div class="newsDocket PeopleDocket2">';
					switch(parseInt(msg.data1[j].jslSourceType)){
						case 1:
						html1+='<span class="forumLabel newsLabel">新闻</span>';
						break;

						case 2:
						html1+='<span class="forumLabel commentLabel">评论</span>';
						break;

						case 3:
						html1+='<span class="forumLabel weiboLabel">微博</span>';
						break;

						case 4:
						html1+='<span class="forumLabel">帖子</span>';
						break;

						case 5:
						html1+='<span class="forumLabel bokeLabel">博客</span>';
						break;
					}
					
					html1+='<a class="aTitle" href="'+msg.data1[j].jslSourceUrl+'" target="_blank" title="'+msg.data1[j].jslTitle+'" style="width:230px">'+msg.data1[j].jslTitle+'</a><a class="aImg" href="###"></a></div>';
					html1+='<input type="hidden" name="keys[]" value="'+msg.data1[j].jslKeywords+'" />';
					html1+='<div class="sumTime">';

					switch(parseInt(msg.data1[j].jslSourceType)){
						case 1:
						html1+='<span class="detailReprint PeopleTimeMT">转载量：<tt>'+msg.data1[j].jslReserved+'</tt></span>';
						break;

						case 2:
						html1+='<span class="detailReprint PeopleTimeMT">转载量：<tt>'+msg.data1[j].jslReserved+'</tt></span>';
						break;

						case 3:
						html1+='<span class="detailReprint PeopleTimeMT">评论：<tt>'+msg.data1[j].jslCommentTotal+'</tt></span>';
						html1+='<span class="soucre detailsoucreMT">转发：<tt>'+msg.data1[j].jslReservedTotal+'</tt></span>';
						break;

						case 4:
						html1+='<span class="detailReprint PeopleTimeMT">回复：<tt>'+msg.data1[j].jslReplyTotal+'</tt></span>';
						html1+='<span class="soucre detailsoucreMT">查看：<tt>'+msg.data1[j].jslViewTotal+'</tt></span>';
						break;

						case 5:
						html1+='<span class="detailReprint PeopleTimeMT">评论：<tt>'+msg.data1[j].jslCommentTotal+'</tt></span>';
						html1+='<span class="soucre detailsoucreMT">查看：<tt>'+msg.data1[j].jslViewTotal+'</tt></span>';
						break;
					}
					html1+='<div class="clear"></div>';
					html1+='<span class="soucre PeopleTimeM">网站：'+msg.data1[j].wsmName+'</span>';
					html1+='<span class="time PeopleTime">时间：'+msg.data1[j].jslTimestamp+'<tt></tt></span>';

					html1+=	'</div>';
					html1+=	'<div class="warningInput">';
					html1+= '<form class="update" action="'+msg.data1[j].url+'" method="post">';
					html1+=	'<input class="myid" type="hidden" value="'+msg.data1[j].id+'" name="id" />';
					html1+=	'<span>性质：</span>';
					html1+=	'<span>';
					html1+=	'<select class="warningSelect" name="nature[]" id="nature">';
					for(k in msg.nature){
						if(msg.data1[j].jslNature==k){
							html1+=	'<option value="'+k+'" selected="selected">'+msg.nature[k]+'</option>';
						}else{
							html1+=	'<option value="'+k+'">'+msg.nature[k]+'</option>';
						}
					}
					html1+=	'</select>';
					html1+=	'</span>';
					html1+=	'<span class="space2">级别：</span>';
					html1+=	'<span>';
					html1+= '<select class="warningSelect" name="level[]" id="level">';
					for(l in msg.level){
						if(msg.data1[j].jslLevel==l){
							html1+=	'<option value="'+l+'" selected="selected">'+msg.level[l]+'</option>';
						}else{
							html1+=	'<option value="'+l+'">'+msg.level[l]+'</option>';
						}
					}
					html1+=	'</select>';
					html1+=	'</span>';
					html1+=	'<div class="clear"></div>';
					html1+=	'<span class="opinion">值班<br />意见：</span>';
					html1+=	'<span class="opinionArea"><textarea name="jslProposal[]" id="jslProposal">'+msg.data1[j].jslProposal+'</textarea></span>';
					html1+= '</form>';
					html1+=	'</div>';
					html1+=	'</td>';
					html1+=	'</tr>';
					html1+=	'</table>';
					html1+=	'</div>';
				}
				
				$(".tableListLeftBox").html(html1);

			    //默认展现第一个
				$($(".aImg")[0]).click();

				if(msg.data2==""){
					nonum('tableListRightBox');
					return false;
				}

				html2="";

				for(i in msg.data2){
					html2+='<div class="tableList space3">';
					html2+='<table cellpadding="0" cellspacing="0">';
					html2+='<tr>';
					var mycount2 = Number(i)+Number(6);
					html2+='<td valign="bottom"><div class="newsCount newsCount4">'+mycount2+'</div></td>';
					html2+='<td class="PeopleBorder2">';
					html2+='<div class="newsDocket PeopleDocket2">';
					switch(parseInt(msg.data2[i].jslSourceType)){
						case 1:
						html2+='<span class="forumLabel newsLabel">新闻</span>';
						break;

						case 2:
						html2+='<span class="forumLabel commentLabel">评论</span>';
						break;

						case 3:
						html2+='<span class="forumLabel weiboLabel">微博</span>';
						break;

						case 4:
						html2+='<span class="forumLabel">帖子</span>';
						break;

						case 5:
						html2+='<span class="forumLabel bokeLabel">博客</span>';
						break;
					}
					
					html2+='<a class="aTitle" href="'+msg.data2[i].jslSourceUrl+'" target="_blank" title="'+msg.data2[i].jslTitle+'" style="width:230px">'+msg.data2[i].jslTitle+'</a><a class="aImg" href="###"></a></div>';
					html2+='<input type="hidden" name="keys[]" value="'+msg.data2[i].jslKeywords+'" />';
					html2+='<div class="sumTime">';

					switch(parseInt(msg.data2[i].jslSourceType)){
						case 1:
						html2+='<span class="detailReprint PeopleTimeMT">转载量：<tt>'+msg.data2[i].jslReserved+'</tt></span>';
						break;

						case 2:
						html2+='<span class="detailReprint PeopleTimeMT">转载量：<tt>'+msg.data2[i].jslReserved+'</tt></span>';
						break;

						case 3:
						html2+='<span class="detailReprint PeopleTimeMT">评论：<tt>'+msg.data2[i].jslCommentTotal+'</tt></span>';
						html2+='<span class="soucre detailsoucreMT">转发：<tt>'+msg.data2[i].jslReservedTotal+'</tt></span>';
						break;

						case 4:
						html2+='<span class="detailReprint PeopleTimeMT">回复：<tt>'+msg.data2[i].jslReplyTotal+'</tt></span>';
						html2+='<span class="soucre detailsoucreMT">查看：<tt>'+msg.data2[i].jslViewTotal+'</tt></span>';
						break;

						case 5:
						html2+='<span class="detailReprint PeopleTimeMT">评论：<tt>'+msg.data2[i].jslCommentTotal+'</tt></span>';
						html2+='<span class="soucre detailsoucreMT">查看：<tt>'+msg.data2[i].jslViewTotal+'</tt></span>';
						break;
					}

					
					html2+='<div class="clear"></div>';
					html2+='<span class="soucre PeopleTimeM">网站：'+msg.data2[i].wsmName+'</span>';
					html2+='<span class="time PeopleTime">时间：'+msg.data2[i].jslTimestamp+'<tt></tt></span>';
					html2+=	'</div>';
					html2+=	'<div class="warningInput">';
					html2+= '<form class="update" action="'+msg.data2[i].url+'" method="post">';
					html2+=	'<input class="myid" type="hidden" value="'+msg.data2[i].id+'" name="id" />';
					html2+=	'<span>性质：</span>';
					html2+=	'<span>';
					html2+=	'<select class="warningSelect" name="nature[]" id="nature">';
					for(m in msg.nature){
						if(msg.data2[i].jslNature==m){
							html2+=	'<option value="'+m+'" selected="selected">'+msg.nature[m]+'</option>';
						}else{
							html2+=	'<option value="'+m+'">'+msg.nature[m]+'</option>';
						}
					}
					html2+=	'</select>';
					html2+=	'</span>';
					html2+=	'<span class="space2">级别：</span>';
					html2+=	'<span>';
					html2+= '<select class="warningSelect" name="level[]" id="level">';
					for(n in msg.level){
						if(msg.data2[i].jslLevel==l){
							html2+=	'<option value="'+n+'" selected="selected">'+msg.level[n]+'</option>';
						}else{
							html2+=	'<option value="'+n+'">'+msg.level[n]+'</option>';
						}
					}
					html2+=	'</select>';
					html2+=	'</span>';
					html2+=	'<div class="clear"></div>';
					html2+=	'<span class="opinion">值班<br />意见：</span>';
					html2+=	'<span class="opinionArea"><textarea name="jslProposal[]" id="jslProposal">'+msg.data2[i].jslProposal+'</textarea></span>';
					html2+= '</form>';
					html2+=	'</div>';
					html2+=	'</td>';
					html2+=	'</tr>';
					html2+=	'</table>';
					html2+=	'</div>';
				}
				
				$(".tableListRightBox").html(html2);

				//更新列表表单数据
				$.each($(".update"),function(i,obj){
					//alert(i)
					$(obj).find("select").bind("change",function(){	
						updateMsg(obj);
					});

					$(obj).find("textarea").bind("blur",function(){	
						updateMsg(obj);
					});
				});

		   }
	});

}
</script>


<script type="text/javascript">
	$(function()
	{	//初始化分页数据页面
		getData();
		getItemVal(1);
		//默认展现第一个
		$($(".aImg")[0]).click();

		//将弹框层转移到遮罩层后
		$(".popupBoxXX").insertAfter(".popupBoxCove");
		$(".popupBox").insertAfter(".popupBoxCove");
	});

  google.load("visualization", "1", {packages:["corechart"]});
  google.setOnLoadCallback(drawChart);
  
  function drawChart() {

  }

</script>

<script type="text/javascript">
var chart = new google.visualization.LineChart(document.getElementById('columnChart1'));//定义图表类型与位置

var options = {

	  width: 790,
	  height: 328,
	  
	  legend: 
	  {
		position: 'top',
		alignment: 'end'
	  },
	  color: '#f00',
	  pointSize: 5,
	  chartArea:
	  {
		width: 690,
		height: 269,
		top:40
	  },

	  series: {0:{color: '#AE5DA2', visibleInLegend: true}, 1:{color: '#1586CC', visibleInLegend: true}, 2:{color: '#12B5B0', visibleInLegend: true}, 3:{color: '#21AC37', visibleInLegend: true}},
	  tooltip:
	  {
		showColorCode: true
		
	  },

	  bar:
	  {
		groupWidth: 10
	  },
	  hAxis:
	  {
		format:"MM-dd",
		gridlines:
		{
			count:7
		}

	  },
	  vAxis:
	  {
		gridlines:
		{
			count:8
		},
		minValue:8
	  },

	  animation:
	  {
      duration: 1000,
      easing: 'in'
	  },
	  curveType: 'none'
	};


function showData(keys){

	statis = keys;//保存全局变量 “关键词”

	$.ajax({
	  type: 'post',
	  url: $("#statistics").val(),
	  data: {day:$("#tableDate").val(),keys:keys},
	  dataType: 'json',
	  success: function(msg){
			createTable_nodata(msg);//生成图表,无数据	
			createTable(msg);//生成图表
	  }
  });

}


//组装数据，渲染图表
function createTable(msg)
{
	var DataTable = new google.visualization.DataTable();	
	var chartData = [];//定义要渲染的数据数组
	
	var checkedTypes=$("#selectType input:checked");//单选框对象
	
	//组装已选中的类型数组数据
	for(i in msg.weibos){
		
		chartData[i] = [new Date(msg.weibos[i].date.replace(/-/g,'\/'))];
		
		for (j=0;j<checkedTypes.length;j++) {

			switch(checkedTypes[j].value){
				case 'News':
					chartData[i].push(parseInt(msg.news[i].count));
					options.series[j] = {color: '#12B5B0', visibleInLegend: true};
					break;
				case 'Comment':
					chartData[i].push(parseInt(msg.comments[i].count));
					options.series[j] = {color: '#21AC37', visibleInLegend: true};
					break;
				case 'Weibo':
					chartData[i].push(parseInt(msg.weibos[i].count));
					options.series[j] = {color: '#AE5DA2', visibleInLegend: true};
					break;
				case 'Forum':
					chartData[i].push(parseInt(msg.forums[i].count));
					options.series[j] = {color: '#1586CC', visibleInLegend: true};
					break;
				case 'Blog':
					chartData[i].push(parseInt(msg.blogs[i].count));
					options.series[j] = {color: '#FF5555', visibleInLegend: true};
					break;
			}
		}
			
		//如果没有选中的类型就默认赋值0
		if (checkedTypes.length == 0) {
			chartData[i].push(0);
		}		
	}
	
	//组装舆情类型
	DataTable.addColumn('date', '日期');
	for (j=0;j<checkedTypes.length;j++) {
		
		switch(checkedTypes[j].value){
			case 'News':
				DataTable.addColumn('number', '新闻');
				break;
			case 'Comment':
				DataTable.addColumn('number', '评论');
				break;
			case 'Weibo':
				DataTable.addColumn('number', '微博');
				break;
			case 'Forum':
				DataTable.addColumn('number', '论坛');
				break;
			case 'Blog':
				DataTable.addColumn('number', '博客');
				break;
		}
	}

	if (checkedTypes.length == 0) {
		DataTable.addColumn('number', '--');
	}

	//alert(chartData);
	
	DataTable.addRows(chartData);//加载数据
	chart.draw(DataTable, options);//生成图表
	
	//如果类型改变，则改变筛选数据重新渲染
	$("#selectType input").unbind();
	$("#selectType input").bind('change',function(){
		createTable(msg);
	});
}


//生成图表,无数据
function createTable_nodata(msg){
	//data_all=[[new Date("1970-00-00"),0,0,0,0]];
	
	google.visualization.events.removeAllListeners(chart);
	var firstTable = new google.visualization.DataTable();	
	checkedTypes=$("#selectType input:checked");//单选框对象

	var data_all=new Array();
	firstTable.addColumn('date', '日期');
	data_all.push(new Date("1970-00-00"));
	
	//组装舆情类型
	for (j=0;j<checkedTypes.length;j++) {
		data_all.push(0);
		switch(checkedTypes[j].value){
			case 'News':
				firstTable.addColumn('number', '新闻');
				break;
			case 'Comment':
				firstTable.addColumn('number', '评论');
				break;
			case 'Weibo':
				firstTable.addColumn('number', '微博');
				break;
			case 'Forum':
				firstTable.addColumn('number', '论坛');
				break;
			case 'Blog':
				firstTable.addColumn('number', '博客');
				break;
		}
	}

	firstTable.addRows([data_all]);//加载数据
	chart.draw(firstTable, options);//生成图表
}

//更改图表类型时，重新访问新数据
$("#tableDate").live("change",function(){
	showData(statis);
});

//更新的表单数据
function updateMsg(obj){
	$.ajax({
	  type: 'post',
	  url: $(obj).attr("action"),
	  data: 'jslNature='+$($(obj).find(".warningSelect")[0]).val()+'&jslLevel='+$($(obj).find(".warningSelect")[1]).val()+'&id='+$($(obj).find(".myid")).val()+'&jslProposal='+$(obj).find("textarea").val()
			,
	  dataType: 'json',
	  success: function(msg){
			
	  }
  });

}

//更新列表表单数据
$.each($(".update"),function(i,obj){
	
	$(obj).find("select").bind("change",function(){	
		updateMsg(obj);
	});

	$(obj).find("textarea").bind("blur",function(){	
		updateMsg(obj);
	});
});

//点击展开
$(".aImg").live("click",function()
{
	showData($(this).parent().next().val());
	$(".tableList").css("background","#fff");
	$(".warningInput").css("display","none");
	$(".aImgOpen").attr("class","aImg");
	$(this).attr("class","aImgOpen");
	$(this).parent().siblings(".warningInput").css("display","block");
	$(this).parent().parent().parent().parent().parent().parent().css("background","#dde9f0");
	return false;
});
//点击关闭
$(".aImgOpen").live("click",function()
{
	$(this).attr("class","aImg");
	$(this).parent().siblings(".warningInput").css("display","none");
	return false;
});

//点击标题
$(".aTitle").live("click",function()
{
	//$(this).next().click();
});

$(".tableList").live("click",function()
{
	//$(this).find(".aTitle").next().click();
});


//弹出框居中
function coveDiv(e){
	$(".popupBoxCove").css({opacity:'0.5',width:$(document).width(),height:$(document).height(),display:'block'});
	$(".popupBoxXX").css({left:($(window).width()-308)/2+'px',top:($(window).height()-310)/2+$(document).scrollTop()+'px',display:'block'});	
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
