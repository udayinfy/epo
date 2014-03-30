<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>广州广报</title>
<link type="text/css"  href="${ctx }/static/style/css.css" rel="stylesheet"/>
<link rel="shortcut icon" href="${ctx }/favicon.ico" />
<script type="text/javascript" src="${ctx }/static/js/base/base.js"></script>
<script type="text/javascript" src="${ctx}/static/easyui/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${ctx }/static/js/datepicker.js"></script>
<script type="text/javascript" src="${ctx }/static/js/eye.js"></script>
<script type="text/javascript" src="${ctx }/static/js/chooseDate.js"></script>
<script type="text/javascript" src="${ctx }/static/js/jsapi"></script>
<script type="text/javascript" src="${ctx }/static/js/format+zh_CN,default,corechart.I.js"></script>
</head>
<body>
<style type="text/css">
	body{background:none;}
	.changemonitorCon { height: 1200px; }
	.distop { margin-top:80px; }
	.mergemedia {
	          width:979px;
	          height:675px;
	          margin:0 auto;
	          margin-top:80px;
	          }	   
	          
	
</style>
		
				<!-- 页面内容 start -->
				
		      <div class="monitorCon changemonitorCon">
					<!-- top start -->
						<div class="monitorTopBox">
							<div class="monitorTitle">
								<span class="aTitle">城市形象与认识度</span>
								<span class="bTitle">印象关键词</span>
							</div>
							
					    </div>
					<!-- top end -->
					<!-- content start -->
				<center>
	
                        <div class="mainstream marginTop">
						<div class="informationSourceTitle" align = "center">
						<span class="sourceLeft" align = "left">媒体或公众影响关键字</span>
						</div>
<!--画折线图 开始 -->	
			<div class="clumnTBox">
			<div class="Choice">
				<span class="space1">类型：</span>
				<span class="systemSearchRight marginLeft">
					<select name="keyWordType" id="keyWordType">
						<option value="1" selected="selected">公众</option>
						<option value="2">媒体</option>	
					</select>
				</span>
				<span class="space2">时间：</span>
				<span class="systemSearchRight marginLeft">
					<select id="TimeChg" class="TimeChg">
						<option value="5" selected="selected">最近5个月</option>
						<option value="10">最近10个月</option>
						<option value="15">最近15个月</option>
					</select>
				</span>
				<span class="space2">个数：</span>
				<span class="systemSearchRight marginLeft">
					<select id="number" class="number">
						<option value="10" selected="selected">前10个</option>
						<option value="15">前15个</option>
						<option value="20">前20个</option>
					</select>
				</span>
			</div>
			<div class="clear"></div>
            <div class="centerImg" id="keyworkBubbleChart" style="overflow:hidden;height:600px;"><img src="/static/images/loadingBig.gif" /></div>
			<div class="loading"></div>
		</div>
		<div class="roleBox" style="height:130px"></div>
	</div>
<!-- 画折线图结束 -->

				</center>
<!-- content end -->
			</div>
				
<!-- 页面内容  end -->
<input type="hidden" id="keyworkChart" value="/cityRecognize/getkeyWords" />
<!-- table content end -->



<!-- 关键字用的 -->

<script type="text/javascript">	
  google.load("visualization", "1", {packages:["corechart"]});
  google.setOnLoadCallback(drawChart);

  function drawChart() {
	  var Bubble = new Array(); 

		//气泡图图标属性数据
		var options1 = {
			width:790,
			height:600,
			chartArea:{left:0,top:0,width:790,height:600},

			hAxis:{textStyle:{color:'red'},baselineColor:'#fff',gridlines:{color:'#fff'},maxValue:90,minValue:10},

			vAxis: {textStyle:{color:'red'},baselineColor: '#fff',gridlines:{color:'#fff'},maxValue:90,minValue:10},
			animation:{duration: 1000,easing: 'in'},
				//enableInteractivity: true,
			sizeAxis:{maxSize:75,minSize:30},
			legend: {position: 'none'},
			bubble:{opacity: 1,textStyle:{color: 'black',fontName:"黑体",fontSize: "16"}},	
			colorAxis:{colors:[
				'#30BFBD',
				'#F2914A',
				'#F29C9F',
				'#F39B77',
				'#5698D5',
				'#C490C0',
				'#A172B8',
				'#9EC745',
				'#EB6876',
				'#546FB4'

			]}
		};
		//环形图图标属性数据
		var options = {
			pieSliceText:'none',
			width: 75,
			height: 130,
			chartArea:{width: 60,height: 110,top:0},
			tooltip:{color: 'black', fontName: 'simsun', fontSize: 6,showColorCode:'false',trigger:'none'},
			legend:{position: 'bottom',alignment: 'center',textStyle:{color:'#000',fontSize: 12,fontFamily:'simsun'}},
			slices: {
			 0: {color: '#D9D9D9'},
			 1: {color: '#30BFBD'}
			},
			tooltip:{trigger:'none'}
		};

		var chart = new google.visualization.BubbleChart(document.getElementById('keyworkBubbleChart'));

		var first =new Array();
		
		//生成和组装数据
		$.ajax({
			type: 'post',
			url: $("#keyworkChart").val(),
			data:{type:$("#keyWordType").val(), month:$("#TimeChg").val(),number:$("#number").val()},
			dataType: 'json',
			success: function(msg){
			/*	if(msg.data==false){
					alert();
					 nonum('keyworkChart');
					return false;
				} */
				Bubble = msg.data;
				
				//list = msg.data;
				//组装第一次的数据
				for(e in msg.data){
					first.push([msg.data[e][0].toString(),50,50,0,0]);
				}
				
				//第一次的气泡画图（数据为空）
				drawBubble(first);
				//气泡画图
				drawBubble(Bubble);
				//环形图画图
				drawPieChart(msg.data);
			}
		});		
		//加载气泡图
		function drawBubble(arr){
			if(arr){
				var clor = new Array();
				options1.colorAxis.colors= ['#30BFBD','#F2914A','#F29C9F','#F39B77','#5698D5','#C490C0','#A172B8','#9EC745','#EB6876','#546FB4'];
				if(arr.length>0){
					for(j in arr){
						clor[j]=options1.colorAxis.colors[j];
					}
					options1.colorAxis.colors=clor;
				}
				var data = new google.visualization.DataTable();
				data.addColumn('string', 'Month');
				data.addColumn('number');
				data.addColumn('number');
				data.addColumn('number');
				data.addColumn('number', '出现次数');
				data.addRows(arr);
				chart.draw(data, options1);
			}else{
				
				setTimeout(function(){nonumid('keyworkChart');},500);
			}
		}
		//加载环形图
		function drawPieChart(data){
			//重新定义数据

			var count=new Array(); //气泡数据总数（已过滤）
			var total_found=new Array(); //气泡数据总数
			var name =new Array();//气泡数据名称
			var colorData=new Array();//气泡颜色数组
			var percentage=new Array();//气泡数据百分比
			var departmentName=new Array();   //保存部门名称
			colorData=options1.colorAxis.colors;
			var getData=data;
			$(".roleBox").html('');
			if(getData.length>0){
				for(j in getData){
					departmentName[j]=getData[j][0];
				}		
			}
			//控制图大小不要小于10大于90
			for(var j=0;j<getData.length;j++){

				total_found=Number(total_found+getData[j][4]);	
				
				count=Number(count+getData[j][4]);

				name.push('chart'+j);
			}
			
			for(var i=0;i<getData.length;i++){

				percentage.push(getData[i][4]/total_found);//百分比组装

				//数据名称填充
				var topsum = percentage[i].toFixed(3)*1000/10;
				
				if(topsum == 0)
				{
					topsum = 1;
				}
				
				//生成百分比的html
				var html='';
				html+='<div class="roleDiv">';
				html+='<div class="centerImg marginTop2" style="overflow:hidden;width:70px;height:100px;" id="role'+i+'"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/loadingBig.gif" /></div>';
				html+='<p>'+departmentName[i]+'</p>';//数据名称填充
				html+='<div class="circle_div">'+topsum+'%'+'</div>';//百分比填充
				html+='</div>';

				$(".roleBox").append(html);	//百分比填充
				
				
				//生成百分比环形图
				name[i] = new google.visualization.PieChart(document.getElementById('role'+Number(i)));
				var data = google.visualization.arrayToDataTable([
				  ['新闻', 'Hours per Day'],
				  ['总共', count-getData[i][4]],
				  ['', getData[i][4]]
				]);
				options.slices = {0:{color: '#D9D9D9'},1:{color: colorData[i]}};
				 name[i].draw(data, options);
				google.visualization.events.addListener(name[i], 'onmouseover', selectHandler);
			}
			
		}	
		 
	}
	//去掉onmouseover的效果
	function selectHandler() {
		$.each($(".roleBox").find("g"),function(i,obj)
		{
			$($(obj).find("path")[1]).css("display","none");
		});
		return false;
	}
	
	$("#TimeChg").live("change",function(){
		drawChart();
	});
	
	$("#keyWordType").live("change",function(){
		drawChart();
	});
	$("#number").live("change",function(){
		drawChart();
	});
	
</script>


</body>
</html>
