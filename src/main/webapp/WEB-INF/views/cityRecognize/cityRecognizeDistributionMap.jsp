<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
	.changemonitorCon { height: 75px; }
	.htmlsize { height: 800px; }
	.distop { margin-top:80px; }
	.mergemedia {
	          width:979px;
	          height:675px;
	          margin:0 auto;
	          margin-top:80px;
	          }	   
.monitorDiv{float:left;width:800px;height:601px;clear:both;overflow:hidden;margin-top:5px;position:relative;}
.ppBakDiv{position:absolute;top:0px;left:0px;}
.pointXinjiang{width:50px;height:70px;overflow:hidden;position:absolute;top:130px;left:230px;cursor:pointer;}
.pointXizang{width:32px;height:150px;overflow:hidden;position:absolute;top:276px;left:236px;cursor:pointer;text-align:center;}
.pointQinghai{width:50px;height:70px;overflow:hidden;position:absolute;top:240px;left:330px;cursor:pointer;}
.pointGansu{width:50px;height:70px;overflow:hidden;position:absolute;top:250px;left:425px;cursor:pointer;}
.pointNeimenggu{width:50px;height:70px;overflow:hidden;position:absolute;top:160px;left:450px;cursor:pointer;}
.pointNingxia{width:50px;height:70px;overflow:hidden;position:absolute;top:210px;left:448px;cursor:pointer;}
.pointShangxi{width:50px;height:70px;overflow:hidden;position:absolute;top:230px;left:487px;cursor:pointer;}
.pointHebei{width:50px;height:70px;overflow:hidden;position:absolute;top:200px;left:540px;cursor:pointer;}
.pointBeijing{width:50px;height:70px;overflow:hidden;position:absolute;top:170px;left:545px;cursor:pointer;}
.pointLiaoning{width:50px;height:70px;overflow:hidden;position:absolute;top:135px;left:610px;cursor:pointer;}
.pointJilin{width:50px;height:70px;overflow:hidden;position:absolute;top:100px;left:640px;cursor:pointer;}
.pointHeilongjiang{width:32px;height:150px;overflow:hidden;position:absolute;top:40px;left:650px;cursor:pointer;text-align:center;}
.pointSichuan{width:50px;height:70px;overflow:hidden;position:absolute;top:320px;left:395px;cursor:pointer;}
.pointShanxi{width:50px;height:70px;overflow:hidden;position:absolute;top:205px;left:505px;cursor:pointer;}
.pointTianjin{width:50px;height:70px;overflow:hidden;position:absolute;top:180px;left:573px;cursor:pointer;}
.pointYunnan{width:50px;height:70px;overflow:hidden;position:absolute;top:410px;left:385px;cursor:pointer;}
.pointFujian{width:50px;height:70px;overflow:hidden;position:absolute;top:370px;left:590px;cursor:pointer;}
.pointChongqing{width:50px;height:70px;overflow:hidden;position:absolute;top:330px;left:460px;cursor:pointer;}
.pointTaiwang{width:50px;height:70px;overflow:hidden;position:absolute;top:405px;left:627px;cursor:pointer;}
.pointShandong{width:50px;height:70px;overflow:hidden;position:absolute;top:220px;left:577px;cursor:pointer;}
.pointHunan{width:50px;height:70px;overflow:hidden;position:absolute;top:360px;left:510px;cursor:pointer;}
.pointHubei{width:50px;height:70px;overflow:hidden;position:absolute;top:305px;left:510px;cursor:pointer;}
.pointJiangsu{width:50px;height:70px;overflow:hidden;position:absolute;top:270px;left:600px;cursor:pointer;}
.pointJiangxi{width:50px;height:70px;overflow:hidden;position:absolute;top:350px;left:555px;cursor:pointer;}
.pointGuangdong{width:50px;height:70px;overflow:hidden;position:absolute;top:415px;left:540px;cursor:pointer;}
.pointGuangxi{width:50px;height:70px;overflow:hidden;position:absolute;top:420px;left:475px;cursor:pointer;}
.pointGuizhou{width:50px;height:70px;overflow:hidden;position:absolute;top:375px;left:455px;cursor:pointer;}
.pointHainan{width:50px;height:70px;overflow:hidden;position:absolute;top:485px;left:490px;cursor:pointer;}
.pointHenan{width:50px;height:70px;overflow:hidden;position:absolute;top:260px;left:520px;cursor:pointer;}
.pointAnhui{width:50px;height:70px;overflow:hidden;position:absolute;top:290px;left:570px;cursor:pointer;}
.pointShanghai{width:50px;height:70px;overflow:hidden;position:absolute;top:290px;left:620px;cursor:pointer;}
.pointZhejiang{width:50px;height:70px;overflow:hidden;position:absolute;top:325px;left:610px;cursor:pointer;}
</style>
		
				<!-- 页面内容 start -->
				
		    
					<!-- top start -->
					<div class="monitorCon changemonitorCon">
					<div class="monitorTopBox">
							<div class="monitorTitle">
								<span class="aTitle">城市形象与认识度</span>
								<span class="bTitle">涉穂报道分布图</span>
							</div>		
					    </div>
					 </div>
					<!-- top end -->
					<!-- content start -->

<div class = "htmlsize">
                <div class="mainstream marginTop">
						<div class="informationSourceTitle">
						<span class="sourceLeft" align = "left">全国各地涉穂报道分布图</span>
						</div>
				</div>									
		
<div class="monitorDiv">

		<div class="ppBoxLoding"></div>
		<div class="ppBakBox1">
			<div class="ppBakDiv"><img src="/static/images/distribution/ChinaMap0.jpg" /></div>
			<div class="ppBoxM">
			<div class="pointBeijing">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">北京</span>
			</div>
			<div class="pointAnhui">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">安徽</span>
			</div>
			<div class="pointFujian">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="act">福建</span>
			</div>
			<div class="pointGansu">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">甘肃</span>
			</div>
			<div class="pointGuangdong">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="act">广东</span>
			</div>
			<div class="pointGuangxi">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">广西</span>
			</div>
			<div class="pointGuizhou">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">贵州</span>
			</div>
			<div class="pointHainan">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">海南</span>
			</div>
			<div class="pointHebei">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">河北</span>
			</div>
			<div class="pointHenan">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">河南</span>
			</div>
			
			<div class="pointHeilongjiang">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">黑龙江</span>
			</div>
			<div class="pointHubei">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">湖北</span>
			</div>
			<div class="pointHunan">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">湖南</span>
			</div>
			<div class="pointJilin">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">吉林</span>
			</div>
			<div class="pointJiangsu">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">江苏</span>
			</div>
			<div class="pointJiangxi">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">江西</span>
			</div>
			<div class="pointLiaoning">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="act">辽宁</span>
			</div>
			<div class="pointNeimenggu">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">内蒙古</span>
			</div>
			<div class="pointNingxia">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">宁夏</span>
			</div>
			<div class="pointQinghai">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">青海</span>
			</div>	
			<div class="pointShandong">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">山东</span>
			</div>
			<div class="pointShanxi">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">山西</span>
			</div>	
			<div class="pointShangxi">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span style = "width:16px;height:30px;">陕西</span>
			</div>	
			<div class="pointShanghai">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">上海</span>
			</div>
			<div class="pointSichuan">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span style = "width:16px;height:30px;">四川</span>
			</div>
			<div class="pointTianjin">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">天津</span>
			</div>
			
			<div class="pointXizang">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">西藏</span>
			</div>
			<div class="pointXinjiang">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">新疆</span>
			</div>
			
			<div class="pointYunnan">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">云南</span>
			</div>
			<div class="pointZhejiang">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">浙江</span>
			</div>
			<div class="pointChongqing">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">重庆</span>
			</div>
			<div class="pointTaiwang">
				<p class="img"><img src="/static/images/yuq_77.gif" /></p>
				<span class="">台湾</span>
			</div>
	
			</div>
     </div>
<!-- --->
		
<!-- --->
</div>	
	<div class="centerImg" id="emotionColumnChart" style="top:150px;overflow:hidden;height:308px;"><img src="/static/images/loadingBig.gif" /></div>
		<div class="marginTop5 centerImg" id="noImg" style="display:none;"><img src="/static/images/nonum.jpg"/></div>	
		

<!-- 画报道的情感柱状图结束 -->						
						


<!-- content end -->
</div>
				
<!-- 页面内容  end -->
<input type="hidden" id="getReportEmotion" value="/cityRecognize/getReportDistributionEmotion" />
<!-- table content end -->



<!-- 画报道的情感柱状图用的 -->

<script type="text/javascript">
google.load("visualization", "1", {packages:["corechart"]});
var negative = "#FF0000";
var neutral = "#fcaf17";
var positive = "#00CD00";
var reportEmotionColumn = {

  width: 400,
  height: 308,
  legend: 
  {
	position: 'top',
	alignment: 'end'
  },
 


  pointSize: 5,

  chartArea:
  {
	width: 350,
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

</script>



<!-- 动态显示地图的不同省份，并获得相关省份的图标数据 -->


<script type="text/javascript">
$(function(){
	getMapData();
});
var i = 0;
var interval;
var clearTime;
var reportEmotionList = new Array();
/*
for(var i = 0; i < 12; i++) {
	reportEmotionList[i] = [];
};
*/
function getMapData() {
	clearInterval(interval);
	clearTimeout(clearTime);
	//请求数据,画柱状图
	$.ajax({
		type: 'post',
		  url: $("#getReportEmotion").val(),
		  data: {month:5},
		  dataType: 'json',
		  success: function(msg){
			
			  var result = msg;
			 /*
				for(var i = 0; i < 12; i++) {
					reportEmotionList[i] = new Map();
				};
				*/
				for (i in result) {

					reportEmotionList.push(result[i].data);
				}
			interval = setInterval("getMapData()",1000*3600);
			
		changeBox();
		}
	});

}

function changeBox() {
	if(i == 32) {
		i=0;
	}
	$.each($(".ppBakDiv"),function(i,obj){
		$(obj).find("img").attr("src","/static/images/distribution/ChinaMap0.jpg");
	});
	$(".ppBoxM").stop();
	$(".ppBoxM").children("div").stop();
	$(".ppBoxM").children("div").find("img").css("display","none");
	$(".ppBoxM").children("div").find("span").removeClass("act");
	$(".ppBoxM").stop();
	$(".ppBoxLoding").css({display:'none'});
	$(".ppBoxM").css({display:'block'});
	
	
	$(".ppBoxM").children("div").animate({opacity:1},100,function(){		
		$($(".ppBakDiv")[0]).find("img").attr("src",'/static/images/distribution/ChinaMap'+i+'.jpg');
		$($(".ppBoxM").children("div")[i-1]).find("img").css("display","block");
		$($(".ppBoxM").children("div")[i-1]).find("span").addClass("act");
	});
	drawEmotionColumn();
	i++;
	clearTime = setTimeout(changeBox, 4000);
}

//点鼠标移到区域
$(".ppBoxM").children("div").bind("mouseover", function() {
	clearTimeout(clearTime);
	$.each($(".ppBakDiv"),function(i,obj){
		$(obj).find("img").attr("src","/static/images/distribution/ChinaMap0.jpg");
	});
	$(".ppBoxM").children("div").stop();
	$(".ppBoxM").children("div").find("img").css("display", "none");
	$(".ppBoxM").children("div").find("span").removeClass("act");
	i = $(this).index();

	drawEmotionColumn();

	$($(".ppBakDiv")[0]).find("img").attr("src",'/static/images/distribution/ChinaMap'+(i+1)+'.jpg');
	$($(".ppBoxM").children("div")[i]).find("img").css("display", "block");
	$($(".ppBoxM").children("div")[i]).find("span").addClass("act");
	i = $(this).index() + 1;
	clearTime = setTimeout(changeBox, 10000);
});

function drawEmotionColumn(){

	var reportEmotionTable = new google.visualization.DataTable();
	var reportEmotionDateChart = new google.visualization.ColumnChart(document.getElementById('emotionColumnChart'));
	if (reportEmotionList[i].length > 0) {
		//默认加载生成图表
		var List = new Array();
		for(j in reportEmotionList[i]){
			List.push(new Array(reportEmotionList[i][j].name,parseInt(reportEmotionList[i][j].count)));
		}
		
		reportEmotionTable.addColumn('string', '名称');
		reportEmotionTable.addColumn('number', '总量');
		reportEmotionTable.addRows(List);
		
		reportEmotionDateChart.draw(reportEmotionTable ,reportEmotionColumn);

		$(".centerImg").show();
		$('#noImg').hide();

	} else {	
		$(".centerImg").hide();
		$('#noImg').show();
	}
}

//鼠标点击事件

$(".ppBoxM").children("div").bind("click", function() {

	if($(this).index() == 31){
		
		window.location.href = "/cityRecognize/cityRecognizeDistributionDetail?cityRegionId=" + ($(this).index() + 4);
	}
		
	else
		window.location.href = "/cityRecognize/cityRecognizeDistributionDetail?cityRegionId=" + ($(this).index() + 2);
});
</script>


<!-- 结束 -->




</body>
</html>
