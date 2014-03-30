<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../top.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>广州广报</title>
<link type="text/css"  href="${ctx }/static/style/datepicker.css" rel="stylesheet"/>
<script type="text/javascript" src="${ctx }/static/js/datepicker.js"></script>
<script type="text/javascript" src="${ctx }/static/js/eye.js"></script>
<script type="text/javascript" src="${ctx }/static/js/chooseDate.js"></script>
<script type="text/javascript" src="${ctx }/static/js/jsapi"></script>
<script type="text/javascript" src="${ctx }/static/js/format+zh_CN,default,corechart.I.js"></script>

<style>
.detail{width:50px;float:right;display:inline;height:40px;line-height:48px;font-size:14px;text-indent:5px;letter-spacing:3px}
</style>

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
.ppBakDiv{position:absolute;top:0px;left:30px;}
.pointXinjiang{width:50px;height:70px;overflow:hidden;position:absolute;top:130px;left:288px;cursor:pointer;}
.pointXizang{width:32px;height:150px;overflow:hidden;position:absolute;top:276px;left:294px;cursor:pointer;text-align:center;}
.pointQinghai{width:50px;height:70px;overflow:hidden;position:absolute;top:240px;left:388px;cursor:pointer;}
.pointGansu{width:50px;height:70px;overflow:hidden;position:absolute;top:250px;left:483px;cursor:pointer;}
.pointNeimenggu{width:50px;height:70px;overflow:hidden;position:absolute;top:160px;left:508px;cursor:pointer;}
.pointNingxia{width:50px;height:70px;overflow:hidden;position:absolute;top:210px;left:506px;cursor:pointer;}
.pointShangxi{width:50px;height:70px;overflow:hidden;position:absolute;top:230px;left:546px;cursor:pointer;}
.pointHebei{width:50px;height:70px;overflow:hidden;position:absolute;top:200px;left:598px;cursor:pointer;}
.pointBeijing{width:50px;height:70px;overflow:hidden;position:absolute;top:170px;left:603px;cursor:pointer;}
.pointLiaoning{width:50px;height:70px;overflow:hidden;position:absolute;top:135px;left:668px;cursor:pointer;}
.pointJilin{width:50px;height:70px;overflow:hidden;position:absolute;top:100px;left:698px;cursor:pointer;}
.pointHeilongjiang{width:32px;height:150px;overflow:hidden;position:absolute;top:40px;left:708px;cursor:pointer;text-align:center;}
.pointSichuan{width:50px;height:70px;overflow:hidden;position:absolute;top:320px;left:453px;cursor:pointer;}
.pointShanxi{width:50px;height:70px;overflow:hidden;position:absolute;top:205px;left:563px;cursor:pointer;}
.pointTianjin{width:50px;height:70px;overflow:hidden;position:absolute;top:180px;left:631px;cursor:pointer;}
.pointYunnan{width:50px;height:70px;overflow:hidden;position:absolute;top:410px;left:443px;cursor:pointer;}
.pointFujian{width:50px;height:70px;overflow:hidden;position:absolute;top:370px;left:658px;cursor:pointer;}
.pointChongqing{width:50px;height:70px;overflow:hidden;position:absolute;top:330px;left:528px;cursor:pointer;}
.pointTaiwang{width:50px;height:70px;overflow:hidden;position:absolute;top:405px;left:685px;cursor:pointer;}
.pointShandong{width:50px;height:70px;overflow:hidden;position:absolute;top:220px;left:638px;cursor:pointer;}
.pointHunan{width:50px;height:70px;overflow:hidden;position:absolute;top:360px;left:568px;cursor:pointer;}
.pointHubei{width:50px;height:70px;overflow:hidden;position:absolute;top:305px;left:568px;cursor:pointer;}
.pointJiangsu{width:50px;height:70px;overflow:hidden;position:absolute;top:270px;left:658px;cursor:pointer;}
.pointJiangxi{width:50px;height:70px;overflow:hidden;position:absolute;top:350px;left:613px;cursor:pointer;}
.pointGuangdong{width:50px;height:70px;overflow:hidden;position:absolute;top:415px;left:598px;cursor:pointer;}
.pointGuangxi{width:50px;height:70px;overflow:hidden;position:absolute;top:420px;left:533px;cursor:pointer;}
.pointGuizhou{width:50px;height:70px;overflow:hidden;position:absolute;top:375px;left:513px;cursor:pointer;}
.pointHainan{width:50px;height:70px;overflow:hidden;position:absolute;top:485px;left:548px;cursor:pointer;}
.pointHenan{width:50px;height:70px;overflow:hidden;position:absolute;top:260px;left:578px;cursor:pointer;}
.pointAnhui{width:50px;height:70px;overflow:hidden;position:absolute;top:290px;left:628px;cursor:pointer;}
.pointShanghai{width:50px;height:70px;overflow:hidden;position:absolute;top:290px;left:678px;cursor:pointer;}
.pointZhejiang{width:50px;height:70px;overflow:hidden;position:absolute;top:325px;left:668px;cursor:pointer;}
</style>
		
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
				


<!-- right nav start -->
<div class="rightNavBox">
	<shiro:user>
		<shiro:hasPermission name="19">
			<span><a href="#emotion_top">情感分析</a></span>
		</shiro:hasPermission>
	</shiro:user>
		<shiro:user>
		<shiro:hasPermission name="20">
			<span><a href="#keys_top">印象关键词</a></span>
		</shiro:hasPermission>
	</shiro:user>
		<shiro:user>
		<shiro:hasPermission name="21">
			<span><a href="#report_top">涉穗报道分布图</a></span>
		</shiro:hasPermission>
	</shiro:user>
		<shiro:user>
		<shiro:hasPermission name="22">
			<span><a href="#media_top">主流媒体关注度</a></span>
		</shiro:hasPermission>
	</shiro:user>
		<shiro:user>
		<shiro:hasPermission name="23">
			<span><a href="#pub_top">公众评价</a></span>
		</shiro:hasPermission>
	</shiro:user>
	
	<div class="hoverTop"><a href="#top">&nbsp;</a></div>
</div>
<!-- right nav end -->


<!-- 画媒体或公众的情感倾向柱状图开始 -->
	<shiro:user>
		<shiro:hasPermission name="19">
						<div class="mainstream marginTop" id="emotion_top">
						<div class="informationSourceTitle">
						<span class="sourceLeft">媒体或公众的情感倾向柱状图</span>
						<span class="detail" ><a href="/cityRecognize/cityRecognizeSentimentAnalysis" target="_blank">详细</a></span>
						</div>
						
<!-- 线性图表 start -->
						<div class="clumnTBox">
							<div class="Choice">
								<span class = "space1">类型：</span>
								<span class="systemSearchRight marginLeft">
									<select name="publicOrmedia" id="publicOrmedia">
										<option value="1" selected="selected">公众</option>
										<option value="2">媒体</option>	
									</select>
								</span>
								<span class = "space2">时间：</span>
								<span class="systemSearchRight marginLeft">
									<select name="pmTime" id="pmTime">
										<option value="3" selected="selected">3个月</option>
										<option value="5">5个月</option>	
										<option value="7">7个月</option>
										<option value="9">9个月</option>
										<option value="11">11个月</option>
										<option value="0">全部</option>
									</select>
								</span>
							</div>

							<div class="centerImg" id="emotionColumnChart" style="overflow:hidden;height:308px;"><img src="/static/images/loadingBig.gif" /></div>

						</div>
<!-- 线性图表 end -->
						</div>

<!-- 画媒体或公众的情感倾向柱状图结束 -->				
		</shiro:hasPermission>
	</shiro:user>

<shiro:user>
		<shiro:hasPermission name="20">
                       <div class="mainstream marginTop">
						<div class="informationSourceTitle">
						<span class="sourceLeft">媒体或公众的情感倾向变化</span>
						<span class="detail" ><a href="/cityRecognize/cityRecognizeSentimentAnalysis" target="_blank">详细</a></span>
						</div>
<!--画折线图 开始 -->	
						<div class="clumnTBox">
							<div class="Choice">
								<span class = "space1">类型：</span>
								<span class="systemSearchRight marginLeft">
									<select name="publicOrmediaChg" id="publicOrmediaChg">
										<option value="1" selected="selected">公众</option>
										<option value="2">媒体</option>	
									</select>
								</span>
								<span class = "space2">时间：</span>
									<span class="systemSearchRight marginLeft">
										<select id="pmTimeChg" class="pmTimeChg">
											<option value="5" selected="selected">最近5个月</option>
											<option value="10">最近10个月</option>
											<option value="15">最近15个月</option>
										</select>
									</span>
								</div>
								<div class="clear"></div>
							</div>
							<!--<div class="marginTop2" id="columnChart1"></div>-->
							<div class="centerImg" id="emotionLineChart" style="overflow:hidden;height:328px;"><img src="/static/images/loadingBig.gif" /></div>
							<div class="loading"></div>
						</div>
		</shiro:hasPermission>
	</shiro:user>
<!-- 画折线图结束 -->

	
<!-- 画关键字开始 -->
		<shiro:user>
		<shiro:hasPermission name="20">
			<div class="mainstream marginTop" id="keys_top">
		<div class="informationSourceTitle">
				<span class="sourceLeft">媒体或公众印象关键字</span>
				<span class="detail" ><a href="/cityRecognize/cityRecognizeImpressionKey" target="_blank">详细</a></span>
		</div>
		<div class="clumnTBox">
            <div class="centerImg" id="keyworkBubbleChart" style="overflow:hidden;height:500px;"><img src="/static/images/loadingBig.gif" /></div>
			
		</div>
		<div class="roleBox" style="height:180px"></div>
	</div>
			</shiro:hasPermission>
	</shiro:user>
<!-- 画关键字结束-->			
				




<!-- 涉穂分布图开始 -->
					
	<shiro:user>
		<shiro:hasPermission name="21">
						<div class="mainstream marginTop" id="report_top" >
		
						<div class="informationSourceTitle">
						<span class="sourceLeft">涉穂报道分布图</span>
						<span class="detail" ><a href="/cityRecognize/cityRecognizeDistributionMap" target="_blank">详细</a></span>
						</div>
						
						
<!-- 线性图表 start -->
						
<div class="monitorDiv" style="height:690px">
   
		<div class="ppBoxLoding"></div>		
		<div class="ppBakBox1" >
			<div class="ppBakDiv" style="left:60px;top:0px"><img src="/static/images/distribution/ChinaMap0.jpg" /></div>
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
		<div class="mapContent" style="display:block;opacity:1;left:0px;top:350px">
			<div class="centerImg" id="DistributeMapemotionColumnChart" style="overflow:hidden;height:308px;"><img src="/static/images/loadingBig.gif" /></div>
			<div class="marginTop5 centerImg" id="noImg" style="display:none;"><img src="/static/images/nonum.jpg"/></div>	
	</div>
<!-- --->
</div>	
	
	
		
		
<!-- 画报道的情感柱状图结束 -->	
<!-- 线性图表 end -->
						</div>
		</shiro:hasPermission>
	</shiro:user>
<!-- 涉穂分布图结束 -->





				
				
<!-- 画主流媒体关注度柱状图开始 -->
		<shiro:user>
		<shiro:hasPermission name="22">
						<div class="mainstream marginTop" id="media_top">
						<div class="informationSourceTitle">
						<span class="sourceLeft">主流媒体关注度柱状图</span>
						<span class="detail" ><a href="/cityRecognize/cityRecognizeMainMediaConcern" target="_blank">详细</a></span>
						</div>
<!-- 线性图表 start -->
						<div class="clumnTBox">
						<div class="centerImg" id="mainmediaColumnChart" style="overflow:hidden;height:308px;"><img src="/static/images/loadingBig.gif" /></div>

						</div>
<!-- 线性图表 end -->
						</div>
		</shiro:hasPermission>
	</shiro:user>		
<!-- 画主流媒体关注度柱状图结束 -->


<!-- 画公众政治倾向柱状图开始 -->
		<shiro:user>
		<shiro:hasPermission name="23">
						<div class="mainstream marginTop">
						<div class="informationSourceTitle">
						<span class="sourceLeft" id="pub_top">公众政治倾向柱状图</span>
						<span class="detail" ><a href="/cityRecognize/cityRecognizePublicOpinion" target="_blank">详细</a></span>
						</div>
<!-- 线性图表 start -->
					<div class="clumnTBox">
						<div class="Choice">
								<span class = "space1">类型：</span>
								<span class="systemSearchRight marginLeft">
									<select name="publicPolitical" id="publicPolitical">
										<option value="hierarchy" selected="selected">阶层</option>
										<option value="education">学历</option>		
									</select>
								</span>
						</div>
						<div class="centerImg" id="publicPoliticalColumnChart" style="overflow:hidden;height:308px;"><img src="/static/images/loadingBig.gif" /></div>

					</div>
<!-- 线性图表 end -->
						</div>
		</shiro:hasPermission>
	</shiro:user>		

<!-- 画公众政治倾向柱状图结束 -->


				<!-- 页面内容  end -->
				
			</div>
			</td>
		</tr>
	</table>
	</div>
	</div>
	 <input type="hidden" id="emotionColumn" value="/cityRecognize/getemotionCountByTypeAndTime" />
	 <input type="hidden" id="emotionLine" value="/cityRecognize/getemotionChgByType" />
	 <input type="hidden" id="keyworkChart" value="/cityRecognize/getkeyWords" />
	 <input type="hidden" id="mainmediaChart" value="/cityRecognize/getmainmediaAttention" />
	 <input type="hidden" id="publicPoliticalCount" value="/cityRecognize/getpublicPoliticalByType" />
	 <input type="hidden" id="getReportEmotion" value="/cityRecognize/getReportDistributionEmotion" />
<!-- table content end -->


<!--画媒体或公众的情感倾向柱状图 -->
<script type="text/javascript">
//移除“回到顶部”样式
$(".backTop").removeClass();
//返回顶部效果
function rightToTop()
{
	var top = ($(window).height() - $(".rightNavBox").height())/2 + $(document).scrollTop() +'px';
	$(".rightNavBox").css({top:top,display:'block'});
}

//执行返回顶部效果
setInterval("rightToTop()",100);

var negative = "#FF0000";
var neutral = "#fcaf17";
var positive = "#00CD00";
var mediaOrPublicEmotion = {

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
	width: 690,
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

var reprinted = new google.visualization.DataTable();
var reprintedDateChart = new google.visualization.ColumnChart(document.getElementById('emotionColumnChart'));
var reprintedList = new Array();
$.ajax({
	  type: 'post',
	  url: $("#emotionColumn").val(),
	  data: {type:$("#publicOrmedia").val(),month:$("#pmTime").val()},
	  dataType: 'json',
	  success: function(msg){
		
		for(j in msg){
			reprintedList.push(new Array(msg[j].name,parseInt(msg[j].count)));
		}
		//默认加载生成图表
		reprinted.addColumn('string', 'Date1');
		reprinted.addColumn('number', '总量');
		reprinted.addRows(reprintedList);
		reprintedDateChart.draw(reprinted ,mediaOrPublicEmotion);
		//筛选天数
		$('#publicOrmedia').change(function() {
			
			//筛选柱形
			$.ajax({
				  type: 'post',
				  url: $("#emotionColumn").val(),
				  data: {type:$("#publicOrmedia").val(),month:$("#pmTime").val()},
				  dataType: 'json',
				  success: function(msg){

					  reprintedList = []; 
					
					for(j in msg){
						reprintedList.push(new Array(msg[j].name,parseInt(msg[j].count)));
						
					}

					//重新加载生成柱形图表
					var reprintedData = new google.visualization.DataTable();

					reprintedData.addColumn('string', 'Date1');
					reprintedData.addColumn('number', '总量');
					reprintedData.addRows(reprintedList);
					reprintedDateChart.draw(reprintedData ,mediaOrPublicEmotion);
					
				  }
			 });

			
		});
		
		//筛选天数
		$('#pmTime').change(function() {
			
			//筛选柱形
			$.ajax({
				  type: 'post',
				  url: $("#emotionColumn").val(),
				  data: {type:$("#publicOrmedia").val(),month:$("#pmTime").val()},
				  dataType: 'json',
				  success: function(msg){

					  reprintedList = []; 
					
					for(j in msg){
						reprintedList.push(new Array(msg[j].name,parseInt(msg[j].count)));
						
					}

					//重新加载生成柱形图表
					var reprintedData = new google.visualization.DataTable();

					reprintedData.addColumn('string', 'Date1');
					reprintedData.addColumn('number', '总量');
					reprintedData.addRows(reprintedList);
					reprintedDateChart.draw(reprintedData ,mediaOrPublicEmotion);
					
				  }
			 });

			
		});
	  }
});
</script>



<!-- 画折线图用的 -->
<script type="text/javascript">

var chart = new google.visualization.LineChart(document.getElementById('emotionLineChart'));//定义图表类型与位置

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
	  url: $("#emotionLine").val(),
	  data: {type:$("#publicOrmediaChg").val(),month:$("#pmTimeChg").val()},
	  dataType: 'json',
	  success: function(msg){
			createTable_nodata(msg);//生成图表,无数据
			createTable(msg);//生成图表
			
	  }
});

function showData(){

	$.ajax({
	  type: 'post',
	  url: $("#emotionLine").val(),
	  data: {type:$("#publicOrmediaChg").val(),month:$("#pmTimeChg").val()},
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
	DataTable.addColumn('date', '日期');
	DataTable.addColumn('number', '正面');
	DataTable.addColumn('number', '中立');
	DataTable.addColumn('number', '负面');
	DataTable.addRows(chartData);//加载数据
	chart.draw(DataTable, options);//生成图表
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
	chart.draw(firstTable, options);//生成图表
}

//更改图表类型时，重新访问新数据
$("#publicOrmediaChg").live("change",function(){
	showData();
});
$("#pmTimeChg").live("change",function(){
	showData();
});
</script>


<!-- 关键字用的 -->

<script type="text/javascript">	

  var getData=new Array();//气泡数据
  var count=new Array(); //气泡数据总数（已过滤）
  var total_found=new Array(); //气泡数据总数
  var name =new Array();//气泡数据名称
  var colorData=new Array();//气泡颜色数组
  var percentage=new Array();//气泡数据百分比
  var contSum = new Array();
  var Bubble = new Array(); 
  var DbiName;
  var chart;
  var departmentName=new Array();   //保存部门名称
  
  google.load("visualization", "1", {packages:["corechart"]});
  google.setOnLoadCallback(drawChart);

  function drawChart() {
		//气泡图图标属性数据
		var options1 = {
			width:790,
			height:450,
			chartArea:{left:0,top:0,width:790,height:450},

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

		var first =new Array();;
		//生成和组装数据
		$.ajax({
			type: 'post',
			url: $("#keyworkChart").val(),
			dataType: 'json',
			success: function(msg){
				if(msg.data==false){
					 nonum('keyworkChart');
					return false;
				}
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
				drawChart(msg.data);
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
		function drawChart(data){
			//重新定义数据
			var getData=new Array();//气泡数据
			var count=new Array(); //气泡数据总数（已过滤）
			var total_found=new Array(); //气泡数据总数
			var name =new Array();//气泡数据名称
			var colorData=new Array();//气泡颜色数组
			var percentage=new Array();//气泡数据百分比
			var contSum = new Array();
			var departmentName=new Array();   //保存部门名称
			colorData=options1.colorAxis.colors;
			var getData=data;
			var contSum=data;

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
				html+='<div class="centerImg marginTop2" style="overflow:hidden;width:70px;height:100px;" id="role'+i+'"><img src="${ctx}/static/images/loadingBig.gif" /></div>';
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
	
//$(function(){
//	drawChart();
//});
	
</script>



<!--画主流媒体关注度柱状图 -->
<script type="text/javascript">

var options2 = {

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

var publicOrmedia = new google.visualization.DataTable();
var publicOrmediaDateChart = new google.visualization.ColumnChart(document.getElementById('mainmediaColumnChart'));
var publicOrmediaList = new Array();

$.ajax({
	  type: 'post',
	  url: $("#mainmediaChart").val(),
	  data: {},
	  dataType: 'json',
	  success: function(msg){
		for(j in msg){
			var array = new Array();
			array.push(msg[j][0]);
			array.push(msg[j][1]);
			array.push(msg[j][2]);
			array.push(msg[j][3]);
			publicOrmediaList.push(array);
		}
		
		//默认加载生成图表
		publicOrmedia.addColumn('string', '媒体名称');
		publicOrmedia.addColumn('number', '左倾');
		publicOrmedia.addColumn('number', '中立');
		publicOrmedia.addColumn('number', '右倾');
		publicOrmedia.addRows(publicOrmediaList);
		publicOrmediaDateChart.draw(publicOrmedia ,options2);
	  }
			

}); 
</script>


<!--画公众政治倾向柱状图 -->
<script type="text/javascript">

var optionsPublic = {

  width: 790,
  height: 328,



  pointSize: 5,

  chartArea:
  {
	width: 650,
	height: 269,
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

var publicPolitical = new google.visualization.DataTable();
var publicPoliticalDateChart = new google.visualization.ColumnChart(document.getElementById('publicPoliticalColumnChart'));
var publicPoliticalList = new Array();
$.ajax({
	  type: 'post',
	  url: $("#publicPoliticalCount").val(),
	  data: {type:$("#publicPolitical").val()},
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
	
		publicPolitical.addColumn('string', 'Date1');
		publicPolitical.addColumn('number', '左倾');
		publicPolitical.addColumn('number', '中立');
		publicPolitical.addColumn('number', '右倾');
		publicPolitical.addRows(publicPoliticalList);
		publicPoliticalDateChart.draw(publicPolitical ,optionsPublic);
		//筛选天数
		$('#publicPolitical').change(function() {
			
			//筛选柱形
			$.ajax({
				  type: 'post',
				  url: $("#publicPoliticalCount").val(),
				  data: {type:$("#publicPolitical").val()},
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
					publicPoliticalData.addColumn('string', 'Date1');
					publicPoliticalData.addColumn('number', '左倾');
					publicPoliticalData.addColumn('number', '中立');
					publicPoliticalData.addColumn('number', '右倾');
					publicPoliticalData.addRows(publicPoliticalList);
					publicPoliticalDateChart.draw(publicPoliticalData ,optionsPublic);
					
				  }
			 });

			
		});
	  }
});
</script>




<!-- 画涉穂报道的情感柱状图用的 -->

<script type="text/javascript">
google.load("visualization", "1", {packages:["corechart"]});
var negative = "#FF0000";
var neutral = "#fcaf17";
var positive = "#00CD00";
var reportEmotionColumn = {

  width: 326,
  height: 308,
  legend: 
  {
	position: 'top',
	alignment: 'end'
  },
 


  pointSize: 5,

  chartArea:
  {
	width: 270,
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
$(".mapContent").css("opacity","0");
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
	$(".mapContent").css({opacity:"0",height:"0px"});
	$(".mapContent").css("opacity","0");
	$(".ppBoxM").children("div").animate({opacity:1},100,function(){		
		$($(".ppBakDiv")[0]).find("img").attr("src",'/static/images/distribution/ChinaMap'+i+'.jpg');
		$($(".ppBoxM").children("div")[i-1]).find("img").css("display","block");
		$($(".ppBoxM").children("div")[i-1]).find("span").addClass("act");
		
	});
	$(".mapContent").animate({height:'290px',opacity:'1'},1000,function(){

	});
	drawEmotionColumn();
	i++;
	clearTime = setTimeout(changeBox, 4000);
}


function drawEmotionColumn(){

	var reportEmotionTable = new google.visualization.DataTable();
	var reportEmotionDateChart = new google.visualization.ColumnChart(document.getElementById('DistributeMapemotionColumnChart'));
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


</script>


<!-- 结束 -->


<%@include file="../bottom.jsp"%>
</body>
</html>
