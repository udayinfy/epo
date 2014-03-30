<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>广州广报</title>
<link type="text/css"  href="${ctx }/static/style/css.css" rel="stylesheet"/>
<script type="text/javascript" src="${ctx}/static/easyui/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${ctx }/static/js/datepicker.js"></script>
<script type="text/javascript" src="${ctx }/static/js/eye.js"></script>
<script type="text/javascript" src="${ctx }/static/js/chooseDate.js"></script>
<script type="text/javascript" src="${ctx }/static/js/jsapi"></script>
<script type="text/javascript" src="${ctx }/static/js/format+zh_CN,default,corechart.I.js"></script>
<style type="text/css">
	body{background:none;}
	.changemonitorCon { height: 2750px; }
	.distop { margin-top:80px; }
	.mergemedia {
	          width:979px;
	          height:675px;
	          margin:0 auto;
	          margin-top:80px;
	          }	   
	          
	
</style>
		
</head>
<body>

				<!-- 页面内容 start -->
				
		      <div class="monitorCon changemonitorCon">
					<!-- top start -->
						<div class="monitorTopBox">
							<div class="monitorTitle">
								<span class="aTitle">城市形象与认识度</span>
								<span class="bTitle">公众评价</span>
							</div>
							
					    </div>
					<!-- top end -->
					<!-- content start -->
				<center>
	

                        <div class="mainstream marginTop">
						<div class="informationSourceTitle marginTop2" id="9web_top">
						<span class="sourceLeft">公众的情感倾向或政治倾向变化图</span>
						</div>
<!--画折线图 开始 -->	
						<div class="clumnTBox">
							<div class="Choice">
								<div class="">
							      <span class = "space1">类型：</span>
									<span class="systemSearchRight marginLeft">
										<select id="publicEmoOrPoli" class="publicEmoOrPoli">
											<option value="emotion" selected="selected">情感倾向</option>
											<option value="political">政治倾向</option>
										</select>
									</span>
								<span class = "space2">时间：</span>
									<span class="systemSearchRight marginLeft">
										<select id="publicTimeChg" class="publicTimeChg">
											<option value="5" selected="selected">最近5个月</option>
											<option value="10">最近10个月</option>
											<option value="15">最近15个月</option>
										</select>
									</span>
								</div>
								<div class="clear"></div>
							</div>
							<!--<div class="marginTop2" id="columnChart1"></div>-->
							<div class="centerImg" id="publicEmotionLineChart" style="overflow:hidden;height:328px;"><img src="/static/images/loadingBig.gif" /></div>
							<div class="loading"></div>
						</div>
						</div>

<!-- 画折线图结束 -->

<!-- 画阶层的情感倾向柱状图开始 -->	
					<div class="mainstream marginTop">
						<div class="mainstream marginTop">
						<div class="informationSourceTitle marginTop2" id="9web_top">
						<span class="sourceLeft" align = "left">公众情感倾向或政治倾向柱状图</span>
						</div>
<!-- 线性图表 start -->
					<div class="clumnTBox">
						<div class="Choice">
						 <span class = "space1">类型：</span>
							<span class="systemSearchRight marginLeft">
								<select id="hierarchyEmoOrPoli" class="hierarchyEmoOrPoli">
										<option value="emotion" selected="selected">情感倾向</option>
										<option value="political">政治倾向</option>
								</select>
							</span>
								<span class = "space2">时间：</span>
								<span class="systemSearchRight marginLeft">
									<select name="publicEmotionTime" id="publicEmotionTime">
										<option value="5" selected="selected">最近5个月</option>
										<option value="10">最近10个月</option>
										<option value="15">最近15个月</option>	
									</select>
								</span>
						</div>
						<div class="centerImg" id="publicEmotionColumnChart" style="overflow:hidden;height:308px;"><img src="/static/images/loadingBig.gif" /></div>
						
						</div>
					</div>
<!-- 线性图表 end -->
						</div>

<!-- 画公众政治倾向柱状图结束 -->

		
				
					   <div class="mergemedia">
					     <div class = "mainstream marginTop" >
					        <div class="myclass" >
					           
					                 <c:forEach var="hierarchy" items="${hierarchyList }">
					                     <div class="addPointConBntDiv" id = "${hierarchy.id }"><input type="hidden" name="ss" value="${hierarchy.id }" />${hierarchy.mkey }</div>
					                 </c:forEach>
					           </div>
					         </div>
					         
<!-- 画阶层政治倾向开始--> 
					<div class="mainstream marginTop">
					<div class="informationSourceTitle marginTop2" id="9web_top">
						<span class="sourceLeft" align = "left">阶层政治倾向图</span>
					</div>
						<div class="clumnTBox">
							<div class="Choice">
								<span class = "space1">时间：</span>
								<span class="systemSearchRight marginLeft">
									<select name="hierarchyPoliticalTime" id="hierarchyPoliticalTime">
										<option value="3" selected="selected">3个月</option>
										<option value="5">5个月</option>	
										<option value="7">7个月</option>
										<option value="9">9个月</option>
										<option value="11">11个月</option>
										<option value="0">全部</option>
									</select>
								</span>
							</div>
						   <div class="centerImg" id="hierarchyPoliticalPie" style="overflow:hidden;height:308px;"><img src="/static/images/loadingBig.gif" /></div>
						</div>
  					</div>
<!--画阶层政治倾向结束 -->

<!-- 画阶层情感倾向开始--> 
				<div class="mainstream marginTop">
					<div class="informationSourceTitle marginTop2" id="9web_top">
						<span class="sourceLeft" align = "left">阶层情感倾向图</span>
					</div>
						<div class="clumnTBox">
						
						<div class="Choice">
								<span class = "space1">时间：</span>
								<span class="systemSearchRight marginLeft">
									<select name="hierarchyEmotionTime" id="hierarchyEmotionTime">
										<option value="3" selected="selected">3个月</option>
										<option value="5">5个月</option>	
										<option value="7">7个月</option>
										<option value="9">9个月</option>
										<option value="11">11个月</option>
										<option value="0">全部</option>
									</select>
								</span>
							</div>
						   <div class="centerImg" id="hierarchyEmotionPie" style="overflow:hidden;height:308px;"><img src="/static/images/loadingBig.gif" /></div>
						</div>
						</div>
  
<!--画阶层情感倾向结束 -->


<!-- 画学历分布开始-->
						<div class="mainstream marginTop">
						<div class="informationSourceTitle marginTop2" id="9web_top">
						<span class="sourceLeft" align = "left">影响人群学历分布</span>
						</div>
<!-- 线性图表 start -->
						<div class="clumnTBox">
							<div class="Choice">
								<span class = "space1">时间：</span>
								<span class="systemSearchRight marginLeft">
									<select name="educationTime" id="educationTime">
										<option value="3" selected="selected">3个月</option>
										<option value="5">5个月</option>	
										<option value="7">7个月</option>
										<option value="9">9个月</option>
										<option value="11">11个月</option>
										<option value="0">全部</option>
									</select>
								</span>
							</div>
							<div class="centerImg" id="educationColumn" style="overflow:hidden;height:308px;"><img src="/static/images/loadingBig.gif" /></div>
						</div>
<!-- 线性图表 end -->
						</div>

<!-- 画学历分布结束 -->

<!-- 画公众情感向变化 开始-->
                      <div class="mainstream marginTop">
						<div class="informationSourceTitle marginTop2" id="9web_top">
							 <span class="sourceLeft" align = "left">阶层情感倾向或政治倾向变化图</span>
						</div>
						<div class="clumnTBox">
							<div class="Choice">
							<span class = "space1">类型：</span>
								<span class="systemSearchRight marginLeft">
									<select name="emotionOrpolitical" id="emotionOrpolitical">
										<option value="emotion" selected="selected">情感倾向</option>
										<option value="political">政治倾向</option>	
									</select>
								</span>						
								<span class = "space2">时间：</span>
								<span class="systemSearchRight marginLeft">
									<select name="hierarchyChgTime" id="hierarchyChgTime">
										<option value="5" selected="selected">5个月</option>
										<option value="10">10个月</option>
										<option value="15">15个月</option>
									</select>
								</span>
								<div class="clear"></div>
							</div>

							<div class="centerImg" id="hierarchyChgLineChart" style="overflow:hidden;height:308px;"><img src="/static/images/loadingBig.gif" /></div>
							<div class="loading"></div>
						</div>

					</div>
<!-- 画公众情感向变化结束 -->

					           
					     </div>
				</center>
					<!-- content end -->
			</div>
				
				<!-- 页面内容  end -->
<input type="hidden" id="getpublicEmotionChgByTime" value="/cityRecognize/getpublicEmotionChgByTime" />
<input type="hidden" id="getHierarchyEmotionCountByTime" value="/cityRecognize/getHierarchyEmotionCountByTime" />
<input type="hidden" id="getHierarchyCountByTypeAndTime" value="/cityRecognize/getHierarchyCountByTypeAndTime" />
<input type="hidden" id="getHierarchyCountChgByTypeAndTime" value="/cityRecognize/getHierarchyCountChgByTypeAndTime" />
<input type="hidden" id="getEducationCountByhIdAndTime" value="/cityRecognize/getEducationCountByhIdAndTime" />
<input type = "hidden" id = "hierarchyId" value=""/>
<!-- table content end -->

<script type="text/javascript">
  google.load("visualization", "1", {packages:["corechart"]});
  google.setOnLoadCallback(drawChart);
  
  function drawChart() {

  }

</script>


<script type="text/javascript">

var negative = "#FF0000";
var neutral = "#fcaf17";
var positive = "#00CD00";
var pieChartOptions = {

		 slices: {
		  0:{color: positive,visibleInLegend: true},
		  1:{color: neutral,visibleInLegend: true},
		  2:{color: negative,visibleInLegend: true}

		},
				 
		   width: 315,
		  height: 250,
		  chartArea: 
		  {
			width: 315,
			height: 250,
			top:65
		  },
		  legend:
		  {
			alignment: 'center',
			textStyle:
			{
				fontSize: 16,
				fontFamily:'simsun'
			}
		  }
		 
		};
		
		
var hierarchyChgLineChart = new google.visualization.LineChart(document.getElementById('hierarchyChgLineChart'));//定义图表类型与位置

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
		width: 650,
		height: 239,
		top:40
	  },

	  series: {0:{color: positive, visibleInLegend: true}, 1:{color: neutral, visibleInLegend: true}, 2:{color: negative, visibleInLegend: true}},
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
		format:"yyyy-MM",
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
      easing: 'out'
	  },
	  curveType: 'none'
	};

var educationOption = {

		  width: 790,
		  height: 308,
		  legend: 
		  {
			position: 'top',
			alignment: 'end'
		  },
		 


		  pointSize: 5,

		  chartArea:
		  {
			width: 650,
			height: 249,
			top:10
		  },

		  tooltip:
		  {
			showColorCode: true
			
		  },

		  bar:
		  {
			groupWidth: 34
		  },
		  hAxis:
		  {
			gridlines:
			{
				count:4
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
		  easing: 'out'
		  },
		  curveType: 'function',
		  isStacked: true
		};
		
var educationDateChart = new google.visualization.ColumnChart(document.getElementById('educationColumn'));

$(function()
{
//执行按钮切换效果
   $('#hierarchyId').attr("value",$(this).find("input[type='hidden']").val());
   $("#"+$('#hierarchyId').val()).addClass("addPointConBntAct");
	changeBnt("addPointConBntDiv","basic", hierarchyId);	
	showDetail();
	$('#hierarchyPoliticalTime').change(function() {
		showPoliticalPieChart();	
	});
	
	$('#hierarchyEmotionTime').change(function() {

		showEmotionPieChart();	
	});
	$("#hierarchyChgTime").live("change",function(){
		
		showData();
	});
	$("#emotionOrpolitical").live("change",function(){
		
		showData();
	});
	$("#educationTime").live("change",function(){

		showEducationColumnChart();
	});
});


//按钮切换效果
function changeBnt(bnt,con,hierarchyId)
{
	$("."+bnt).click(function()
	{
		 $('#hierarchyId').attr("value",$(this).find("input[type='hidden']").val());
		$("."+bnt).removeClass("addPointConBntAct");
		$(this).addClass("addPointConBntAct");
		showDetail();
	}) ;
	

}


function showDetail(){

	/** 画阶层政治倾向饼图**/
	showPoliticalPieChart();	
	/**结束**/
	
	
	/**画阶层情感倾向饼图开始**/
		showEmotionPieChart();
	/**结束**/
	
	
	/**画公众情感倾向开始**/

      showData();

	/**结束**/
	
	
	/**画学历柱状图开始**/
	showEducationColumnChart();

	/**结束**/
}

function showEducationColumnChart(){

	$.ajax({
		type: 'post',
		  url: $("#getEducationCountByhIdAndTime").val(),
		  data: {month:$("#educationTime").val(), isAbout:1,hierarchyId:$("#hierarchyId").val()},
		  dataType: 'json',
		  success: function(msg){
			  var educationData = new google.visualization.DataTable();
			  var educationList = new Array();
			for(j in msg){
				educationList.push(new Array(msg[j].name,parseInt(msg[j].count)));
			}
			
			//默认加载生成图表
			educationData.addColumn('string', '学历');
			educationData.addColumn('number', '总量');
			educationData.addRows(educationList);
			educationDateChart.draw(educationData ,educationOption);
		}
			  
	});
}
function showEmotionPieChart(hierarchyId){
	
	$.ajax({
		type: 'post',
		url: $("#getHierarchyCountByTypeAndTime").val(),
		data: {type:"emotion", month:$("#hierarchyEmotionTime").val(), isAbout:1,hierarchyId:$("#hierarchyId").val()},
		dataType: 'json',
		success: function(msg){
			var webList = new Array();
			for(j in msg){
				webList.push(new Array(msg[j].name,parseInt(msg[j].count)));
			}
			
	
			webList.unshift(new Array('新闻', 'Hours per Day'));//添加一个设置项

			var HYdata = google.visualization.arrayToDataTable(webList);
			var HYchart = new google.visualization.PieChart(document.getElementById('hierarchyEmotionPie'));
			HYchart.draw(HYdata, pieChartOptions);
		}
			  
	});
}

function showPoliticalPieChart(hierarchyId){
	
	$.ajax({
		type: 'post',
		url: $("#getHierarchyCountByTypeAndTime").val(),
		 data: {type:"political", month:$("#hierarchyPoliticalTime").val(), isAbout:1,hierarchyId:$("#hierarchyId").val()},
		dataType: 'json',
		success: function(msg){
			var webList = new Array();
			for(j in msg){
				webList.push(new Array(msg[j].name,parseInt(msg[j].count)));
			}
			
	
			webList.unshift(new Array('新闻', 'Hours per Day'));//添加一个设置项
			var HYdata = google.visualization.arrayToDataTable(webList);
			var HYchart = new google.visualization.PieChart(document.getElementById('hierarchyPoliticalPie'));
			HYchart.draw(HYdata, pieChartOptions);
		}
			  
	});
}


function showData(hierarchyId){
	
	$.ajax({
	  type: 'post',
	  url: $("#getHierarchyCountChgByTypeAndTime").val(),
	  data: {type:$("#emotionOrpolitical").val(),month:$("#hierarchyChgTime").val(),isAbout: 1,hierarchyId:$("#hierarchyId").val()},
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
	//组装已选中的类型数组数据
	for(i in msg.time){
		
		chartData[i] = [new Date(msg.time[i].replace(/-/g,'\/'))];
		
	    chartData[i].push(parseInt(msg.positive[i]));
		
		chartData[i].push(parseInt(msg.neutral[i]));
	
		chartData[i].push(parseInt(msg.negative[i]));
		
		}

	//组装舆情类型
	if($("#emotionOrpolitical").val() == "emotion"){
		DataTable.addColumn('date', '日期');
		DataTable.addColumn('number', '正面');
		DataTable.addColumn('number', '中立');
		DataTable.addColumn('number', '负面');
	}
	else{
		DataTable.addColumn('date', '日期');
		DataTable.addColumn('number', '左倾');
		DataTable.addColumn('number', '中立');
		DataTable.addColumn('number', '右倾');
	}

	DataTable.addRows(chartData);//加载数据
	hierarchyChgLineChart.draw(DataTable, options);//生成图表
}


//生成图表,无数据
function createTable_nodata(msg){
	google.visualization.events.removeAllListeners(chart);
	var firstTable = new google.visualization.DataTable();	
	var data_all=new Array();
	firstTable.addColumn('date', '日期');
	data_all.push(new Date("1970-00-00"));
	data_all.push(0);
	data_all.push(0);
	data_all.push(0);
	firstTable.addColumn('number', '正面');
	firstTable.addColumn('number', '中立');
	firstTable.addColumn('number', '负面');

	firstTable.addRows([data_all]);//加载数据
	hierarchyChgLineChart.draw(firstTable, options);//生成图表
}


</script>



<!-- 画公众情感倾向变化开始 -->
<script type="text/javascript">

var chart = new google.visualization.LineChart(document.getElementById('publicEmotionLineChart'));//定义图表类型与位置

var publicEmotionLineChartOptions = {

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
		width: 650,
		height: 269,
		top:40
	  },

	  series: {0:{color: positive, visibleInLegend: true}, 1:{color: neutral, visibleInLegend: true}, 2:{color: negative, visibleInLegend: true}},
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
		format:"yyyy-MM",
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
      easing: 'out'
	  },
	  curveType: 'none'
	};
$.ajax({
	  type: 'post',
	  url: $("#getpublicEmotionChgByTime").val(),
	  data: {month:$("#publicTimeChg").val(), type:$("#publicEmoOrPoli").val(), isAbout:1},
	  dataType: 'json',
	  success: function(msg){
		  
			createTable_nodata_PublicEmotionLineChart(msg);//生成图表,无数据
			
			createTable_PublicEmotionLineChart(msg);//生成图表
			
			
	  }
});

function drawPublicEmotionLineChart(){

	$.ajax({
	  type: 'post',
	  url: $("#getpublicEmotionChgByTime").val(),
	  data: {month:$("#publicTimeChg").val(), type:$("#publicEmoOrPoli").val(), isAbout:1},
	  dataType: 'json',
	  success: function(msg){
			createTable_nodata_PublicEmotionLineChart(msg);//生成图表,无数据
			createTable_PublicEmotionLineChart(msg);//生成图表
	  }
  });

}


//组装数据，渲染图表
function createTable_PublicEmotionLineChart(msg)
{
	var DataTable = new google.visualization.DataTable();	
	var chartData = [];//定义要渲染的数据数组
	//组装已选中的类型数组数据
	for(i in msg.time){
		chartData[i] = [new Date(msg.time[i].replace(/-/g,'\/'))];
	    chartData[i].push(parseInt(msg.positive[i]));
		
		chartData[i].push(parseInt(msg.neutral[i]));
		
		chartData[i].push(parseInt(msg.negative[i]));
		
		}

	//组装舆情类型
	if($("#publicEmoOrPoli").val() == "emotion"){
		DataTable.addColumn('date', '日期');
		DataTable.addColumn('number', '正面');
		DataTable.addColumn('number', '中立');
		DataTable.addColumn('number', '负面');
	}else{
		DataTable.addColumn('date', '日期');
		DataTable.addColumn('number', '左倾');
		DataTable.addColumn('number', '中立');
		DataTable.addColumn('number', '右倾');
	}
	DataTable.addRows(chartData);//加载数据
	chart.draw(DataTable, publicEmotionLineChartOptions);//生成图表
}


//生成图表,无数据
function createTable_nodata_PublicEmotionLineChart(msg){
	google.visualization.events.removeAllListeners(chart);
	var firstTable = new google.visualization.DataTable();	
	var data_all=new Array();
	firstTable.addColumn('date', '日期');
	data_all.push(new Date("1970-00-00"));
	data_all.push(0);
	data_all.push(0);
	data_all.push(0);
	firstTable.addColumn('number', '正面');
	firstTable.addColumn('number', '中立');
	firstTable.addColumn('number', '负面');

	firstTable.addRows([data_all]);//加载数据
	chart.draw(firstTable, publicEmotionLineChartOptions);//生成图表
}

//更改图表类型时，重新访问新数据
$("#publicEmoOrPoli").live("change",function(){
	drawPublicEmotionLineChart();
});
$("#publicTimeChg").live("change",function(){
	drawPublicEmotionLineChart();
});
</script>
<!-- 画公众情感倾向变化结束 -->

<!--画公众情感倾向柱状图 -->
<script type="text/javascript">

var publicEmotionColumnOptions = {

  width: 790,
  height: 308,


  pointSize: 5,

  chartArea:
  {
	width: 650,
	height: 249,
	top:10
  },

  series: {
	  0:{color: positive, visibleInLegend: true},
	  1:{color: neutral, visibleInLegend: true},
	  2:{color: negative, visibleInLegend: true}

  },

  tooltip:
  {
	showColorCode: true
	
  },

  bar:
  {
	groupWidth: 34
  },
  hAxis:
  {
	gridlines:
	{
		count:4
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
  easing: 'out'
  },
  curveType: 'function',
  isStacked: true
};

var Data = new google.visualization.DataTable();
var publicPoliticalDateChart = new google.visualization.ColumnChart(document.getElementById('publicEmotionColumnChart'));
var publicPoliticalList = new Array();
$.ajax({
	  type: 'post',
	  url: $("#getHierarchyEmotionCountByTime").val(),
	  data: {month:$("#publicEmotionTime").val(), type :$("#hierarchyEmoOrPoli").val()},
	  dataType: 'json',
	  success: function(msg){
		
		for(j in msg){
			var array = new Array();
			array.push(msg[j][0]);
			array.push(msg[j][1]);
			array.push(msg[j][2]);
			array.push(msg[j][3]);
			publicPoliticalList.push(array);
		}
		//默认加载生成图表
	
		var publicPolitical = new google.visualization.DataTable();
		if($("#hierarchyEmoOrPoli").val() == "emotion"){
			publicPolitical.addColumn('string', '阶层');
			publicPolitical.addColumn('number', '正面');
			publicPolitical.addColumn('number', '中立');
			publicPolitical.addColumn('number', '负面');
		}else{
			publicPolitical.addColumn('string', '阶层');
			publicPolitical.addColumn('number', '左倾');
			publicPolitical.addColumn('number', '中立');
			publicPolitical.addColumn('number', '右倾');
		}
		
		publicPolitical.addRows(publicPoliticalList);
		publicPoliticalDateChart.draw(publicPolitical ,publicEmotionColumnOptions);
		//筛选天数
		$('#publicEmotionTime').change(function() {
			
			//筛选柱形
			$.ajax({
				  type: 'post',
				  url: $("#getHierarchyEmotionCountByTime").val(),
				  data: {month:$("#publicEmotionTime").val(), type :$("#hierarchyEmoOrPoli").val()},
				  dataType: 'json',
				  success: function(msg){

					  publicPoliticalList = []; 
					
					for(j in msg){
						var array = new Array();
						array.push(msg[j][0]);
						array.push(msg[j][1]);
						array.push(msg[j][2]);
						array.push(msg[j][3]);
						publicPoliticalList.push(array);
						
					}
				
					//重新加载生成柱形图表
					var publicPoliticalData = new google.visualization.DataTable();

					if($("#hierarchyEmoOrPoli").val() == "emotion"){
						publicPoliticalData.addColumn('string', '阶层');
						publicPoliticalData.addColumn('number', '正面');
						publicPoliticalData.addColumn('number', '中立');
						publicPoliticalData.addColumn('number', '负面');
					}else{
						publicPoliticalData.addColumn('string', '阶层');
						publicPoliticalData.addColumn('number', '左倾');
						publicPoliticalData.addColumn('number', '中立');
						publicPoliticalData.addColumn('number', '右倾');
					}
					publicPoliticalData.addRows(publicPoliticalList);
					publicPoliticalDateChart.draw(publicPoliticalData ,publicEmotionColumnOptions);
					
				  }
			 });

			
		});
		
		//筛选类型
		$('#hierarchyEmoOrPoli').change(function() {
			
			//筛选柱形
			$.ajax({
				  type: 'post',
				  url: $("#getHierarchyEmotionCountByTime").val(),
				  data: {month:$("#publicEmotionTime").val(), type :$("#hierarchyEmoOrPoli").val()},
				  dataType: 'json',
				  success: function(msg){

					  publicPoliticalList = []; 
					
					for(j in msg){
						var array = new Array();
						array.push(msg[j][0]);
						array.push(msg[j][1]);
						array.push(msg[j][2]);
						array.push(msg[j][3]);
						publicPoliticalList.push(array);
						
					}
				
					//重新加载生成柱形图表
					var publicPoliticalData = new google.visualization.DataTable();
					if($("#hierarchyEmoOrPoli").val() == "emotion"){
						publicPoliticalData.addColumn('string', '阶层');
						publicPoliticalData.addColumn('number', '正面');
						publicPoliticalData.addColumn('number', '中立');
						publicPoliticalData.addColumn('number', '负面');
					}else{
						publicPoliticalData.addColumn('string', '阶层');
						publicPoliticalData.addColumn('number', '左倾');
						publicPoliticalData.addColumn('number', '中立');
						publicPoliticalData.addColumn('number', '右倾');
					}
					
					publicPoliticalData.addRows(publicPoliticalList);
					publicPoliticalDateChart.draw(publicPoliticalData ,publicEmotionColumnOptions);
					
				  }
			 });

			
		});
	  }
});


</script>


</body>
</html>
