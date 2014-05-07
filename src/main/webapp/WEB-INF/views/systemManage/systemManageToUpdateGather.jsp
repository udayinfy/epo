<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../top.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>广州广报</title>

<script type="text/javascript" src="${ctx}/static/js/site.js"></script>

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
				
				<div class="addPoint">
	<!-- addPointInput start -->

<form action="/webGatherNode/update" method="post" id="form">
<input type="hidden" name="id" value="${webGatherNode.id }"/>
<input type="hidden" name="old_wgnName" value="${webGatherNode.wgnName }"/>
<input type="hidden" name="old_wgnUniqueId" value="${webGatherNode.wgnUniqueId }"/>
	<div title="node-form" class="addPointInput">
		<div class="addPointInputBox">
			<span class="inputTitle"><tt>*</tt>采集点名称：</span>
			<span class="inputDiv">
				<input id="WebGatherNode_wgnName" type="text" value="${webGatherNode.wgnName }" name="wgnName" onchange="checkUnique(this,'/webGatherNode/ajaxUnique?old_wgnName=${webGatherNode.wgnName }','')" maxlength="255" />
			</span>
			<span class="inputPrompt"></span>
		</div>
		<div class="addPointInputBox">
			<span class="inputTitle"><tt>*</tt>采集点标记：</span>
			<span class="inputDiv">
			<input id="WebGatherNode_wgnUniqueId" type="text" value="${webGatherNode.wgnUniqueId }" name="wgnUniqueId" onchange="checkUnique(this,'/webGatherNode/ajaxUnique_1?old_wgnUniqueId=${webGatherNode.wgnUniqueId }','')" maxlength="64" />
			</span>
			<span class="inputPrompt"></span>
		</div>
		<div class="addPointInputBox">
			<span class="inputTitle"><tt>*</tt>所属站点：</span>
			<span class="inputDiv">
			<select id="webSiteID" class="select" name="webSiteID">
					
					<c:forEach items="${webSiteNameList}" var="types">
						<option <c:if test="${types.key eq webGatherNode.webSiteID}">selected="selected"</c:if> value="${types.key}">${types.value}</option>
					</c:forEach>
			</select>
			</span>
			<span class="inputPrompt"></span>
		</div>
		<div class="addPointInputBox">
			<span class="inputTitle"><tt>*</tt>是否繁体：</span>
			<span class="inputDiv">
				<select id="WebGatherNode_wgnTraditional" name="wgnTraditional">
					<option  <c:if test="${0 eq webGatherNode.wgnTraditional}">selected="selected"</c:if> value="0">否</option>
					<option  <c:if test="${1 eq webGatherNode.wgnTraditional}">selected="selected"</c:if> value="1">是</option>
				</select>
			</span>
			<span class="inputPrompt"></span>
		</div>
		<div class="addPointInputBox">
			<span class="inputTitle"><tt>*</tt>采集权重：</span>
			<span class="inputDiv">
			<input id="WebGatherNode_wgnWeight" type="text" value="${webGatherNode.wgnWeight }" name="wgnWeight" maxlength="10" size="80" onchange="resetMessage('wgnWeight')" />
			</span>
			<span class="inputPrompt"></span>
		</div>

		<div class="addPointInputBox">
			<span class="inputTitle"><tt>*</tt>来源类别：</span>
			<span class="inputDiv">
			<select id="WebGatherNode_wgnType" name="wgnType">
				<option <c:if test="${1 eq webGatherNode.wgnType}">selected="selected"</c:if> value="1">新闻类</option>
				<option <c:if test="${2 eq webGatherNode.wgnType}">selected="selected"</c:if> value="2">评论类</option>
				<option <c:if test="${3 eq webGatherNode.wgnType}">selected="selected"</c:if> value="3">微博类</option>
				<option <c:if test="${4 eq webGatherNode.wgnType}">selected="selected"</c:if> value="4">论坛类</option>
				<option <c:if test="${5 eq webGatherNode.wgnType}">selected="selected"</c:if> value="5">博客类</option>
				</select>
			</span>
			<span class="inputPrompt"></span>
		</div>
		<div id="WebGatherNode_wgnSpiderEnable" class="addPointInputBox">
			<span class="inputTitle"><tt>*</tt>开启蜘蛛：</span>
			<span class="radioDiv">
				<input id="WebGatherNode_wgnSpiderEnable_0" type="radio" name="wgnSpiderEnable" <c:if test="${0 eq webGatherNode.wgnSpiderEnable}">checked="checked"</c:if> value="0" onclick="spider(this)" />
				<label for="WebGatherNode_wgnSpiderEnable_0">关闭</label>
				<input id="WebGatherNode_wgnSpiderEnable_1" type="radio" name="wgnSpiderEnable" <c:if test="${1 eq webGatherNode.wgnSpiderEnable}">checked="checked"</c:if> value="1" onclick="spider(this)" />
				<label for="WebGatherNode_wgnSpiderEnable_1">开启</label>
			</span>
			<span class="inputPrompt"></span>
		</div>
	</div>
	<!-- addPointInput end -->

	<!-- addPointCon start -->
	<div class="addPointCon" id="spider">
		<div class="addPointConBntLine"></div>
		<div class="addPointConBnt">
			<div class="addPointConBntDiv addPointConBntAct">基本配置</div>
			<div class="addPointConBntDiv">网址规则</div>
			<div class="addPointConBntDiv">内容规则</div>
		</div>

		<div class="addPointConContent">
		<!-- 基本配置 start -->
			<div title="node-form" class="basic">
				<div class="addPointInputBox">
					<span class="inputTitle">采集深度：</span>
					<span class="inputDiv">
					<input id="WebGatherNode_wgnDepthLimit" class="inputWidth1" type="text" value="${webGatherNode.wgnDepthLimit }" name="wgnDepthLimit" maxlength="10" onchange="resetMessage('wgnDepthLimit')" />
					</span>
				</div>

				<div class="addPointInputBox">
					<span class="inputTitle">采集延迟：</span>
					<span class="inputDiv inputDiv1">
					<input id="WebGatherNode_wgnDelay" class="inputWidth1" type="text" value="${webGatherNode.wgnDelay }" name="wgnDelay" maxlength="10" onchange="resetMessage('wgnDelay')" />
					</span>
					<span class="inputText">秒</span>
				</div>

				<div class="addPointInputBox">
					<span class="inputTitle">采集频率：</span>
					<span class="inputDiv inputDiv1">
					<input id="WebGatherNode_wgnTimeInterval" class="inputWidth1" type="text" value="${webGatherNode.wgnTimeInterval }" name="wgnTimeInterval" maxlength="10" onchange="resetMessage('wgnTimeInterval')" />
					</span>
					<span class="inputText">秒</span>
				</div>

				<div class="addPointInputBox">
					<span class="inputTitle">使用Cookies：</span>
					<span class="radioDiv">
						<input id="WebGatherNode_wgnCookiesEnable_0" type="radio" name="wgnCookiesEnable" <c:if test="${1 eq webGatherNode.wgnCookiesEnable}">checked="checked"</c:if> value="1" />
						<label for="WebGatherNode_wgnCookiesEnable_0">是</label>
						<input id="WebGatherNode_wgnCookiesEnable_1" type="radio" name="wgnCookiesEnable" <c:if test="${0 eq webGatherNode.wgnCookiesEnable}">checked="checked"</c:if> value="0" />
						<label for="WebGatherNode_wgnCookiesEnable_1">否</label>
					</span>
				</div>
				
				<div class="addPointInputBox addPointInputBox1">
					<span class="inputTitle">用户代理：</span>
					<span class="inputTextarea">
					<textarea id="WebGatherNode_wgnUserAgents" name="wgnUserAgents" onchange="resetMessage('wgnUserAgents')">${webGatherNode.wgnUserAgents}</textarea>
					</span>
				</div>

				<div class="addPointInputBox addPointInputBox1">
					<span class="inputTitle">代理列表：</span>
					<span class="inputTextarea">
					<textarea id="WebGatherNode_wgnProxies" name="wgnProxies" onchange="resetMessage('wgnProxies')">${webGatherNode.wgnProxies}</textarea>
					</span>
				</div>

				<div class="addPointInputBox">
					<span class="inputTitle">是否登录：</span>
					<span class="radioDiv" id="WebGatherNode_wgnLoginEnable">
					<input id="WebGatherNode_wgnLoginEnable_0" type="radio" name="wgnLoginEnable" <c:if test="${0 eq webGatherNode.wgnLoginEnable}">checked="checked"</c:if> value="0" onclick="spiderLogin(this)" />
					<label for="WebGatherNode_wgnLoginEnable_0">否</label>
					<input id="WebGatherNode_wgnLoginEnable_1" type="radio" name="wgnLoginEnable" <c:if test="${1 eq webGatherNode.wgnLoginEnable}">checked="checked"</c:if> value="1" onclick="spiderLogin(this)" />
					<label for="WebGatherNode_wgnLoginEnable_1">是</label>
					</span>
				</div>

				<div id="spider_login" style="display:none;">
					<div class="addPointInputBox">
						<span class="inputTitle">登录入口：</span>
						<span class="inputDiv">
						<input id="WebGatherNode_wgnLoginEntry" type="text" value="${webGatherNode.wgnLoginEntry }" name="wgnLoginEntry" maxlength="128" />
						</span>
					</div>

					<div class="addPointInputBox">
						<span class="inputTitle">登录帐号：</span>
						<span class="inputDiv">
						<input id="WebGatherNode_wgnLoginAccount" type="text" value="${webGatherNode.wgnLoginAccount }" name="wgnLoginAccount" maxlength="64" />
						</span>
					</div>

					<div class="addPointInputBox">
						<span class="inputTitle">登录密码：</span>
						<span class="inputDiv">
						<input id="WebGatherNode_wgnLoginPassword" type="text" value="${webGatherNode.wgnLoginPassword }" name="wgnLoginPassword" maxlength="32" />
						</span>
					</div>
					</div>
				</div>
			</div>
			<!-- 基本配置 end -->

			<!-- 网址规则 start -->
			<div title="node-form" class="basic hidden">
				<div class="addPointInputBox addPointInputBox1">
					<span class="inputTitle">采集入口：</span>
					<span class="inputTextarea">
						<textarea id="WebGatherNode_wgnEntryUrl" name="wgnEntryUrl">${webGatherNode.wgnEntryUrl }</textarea>
					</span>
				</div>

				<div class="addPointInputBox addPointInputBox1">
					<span class="inputTitle">允许域名：</span>
					<span class="inputTextarea">
						<textarea id="WebGatherNode_wgnAllowDomain" name="wgnAllowDomain">${webGatherNode.wgnAllowDomain }</textarea>
					</span>
				</div>

				<div class="addPointInputBox addPointInputBox1">
					<span class="inputTitle">允许链接格式：</span>
					<span class="inputTextarea">
						<textarea id="WebGatherNode_wgnAllowRule" name="wgnAllowRule" cols="80">${webGatherNode.wgnAllowRule }</textarea>
					</span>
				</div>

				<div class="addPointInputBox addPointInputBox1">
					<span class="inputTitle">禁止链接格式：</span>
					<span class="inputTextarea">
						<textarea id="WebGatherNode_wgnDenyRule" name="wgnDenyRule" cols="80">${webGatherNode.wgnDenyRule }</textarea>
					</span>
				</div>
				<div class="addPointInputBox">
					<span class="inputTitle">处理链接操作：</span>
					<span class="inputDiv">
					<input id="WebGatherNode_wgnProcessLinks" type="text" value="${webGatherNode.wgnProcessLinks }" name="wgnProcessLinks" style="width:462px" maxlength="255" />
					</span>
				</div>
			</div>
			<!-- 网址规则 end -->

			<!-- 内容规则 start -->
			<div class="basic hidden">
				<div title="node-form">
					<div class="addPointInputBox">
						<span class="inputTitle">分页规则匹配：</span>
						<span class="inputDiv">
						<input id="WebGatherNode_wgnNextPage" type="text" value="${webGatherNode.wgnNextPage }" name="wgnNextPage" style="width:558px" maxlength="255" />
						</span>
					</div>

					<div class="addPointInputBox">
						<span class="inputTitle">是否过滤网页：</span>
						<span class="radioDiv">
						<input id="WebGatherNode_wgnIsClean_0" type="radio" name="wgnIsClean" <c:if test="${0 eq webGatherNode.wgnIsClean}">checked="checked"</c:if> value="0" />
						<label for="WebGatherNode_wgnIsClean_0">否</label>
						<input id="WebGatherNode_wgnIsClean_1" type="radio" name="wgnIsClean" <c:if test="${1 eq webGatherNode.wgnIsClean}">checked="checked"</c:if> value="1" />
						<label for="WebGatherNode_wgnIsClean_1">是</label>
						</span>
						<span class="inputPrompt"></span>
					</div>

					<div class="addPointInputBox">
						<span class="inputTitle">采集更新时间：</span>
						<span class="inputDiv inputDiv1">
						<input id="WebGatherNode_wgnTimeRefresh" class="inputWidth1" type="text" value="${webGatherNode.wgnTimeRefresh }" name="wgnTimeRefresh" maxlength="10" />
						</span>
						<span class="inputText">秒</span>
					</div>
				</div>

				<div class="addPointInputBox">
					<span class="inputTitle">采集字段匹配：</span>
				</div>

				<div class="tableListDivTable addPointTable" style="width:100%">
					<table id="spiderItem" cellpadding="0" cellspacing="0" style="text-align:center;width:100%" >
						<tr>
							<th align="center" width="10%">字段名称</th>
							<th align="center" width="10%">字段标识</th>
							<th align="center" width="10%">字段类型</th>
							<th align="center" width="20%">字段参数 </th>
							<th align="center" width="20%">过滤正则式</th>
							<th align="center" width="15%">处理器</th>
							<th align="center" width="7%">必要项</th>
							<th align="center" width="8%">操作</th>
						</tr>
						<c:forEach items="${configItemList}" var="configItem">
							<tr>
								<td><input name="item[title][]" alt="字段名称" value="${configItem.title }" size="7" /></td>
								<td>
									<select name="item[name][]" alt="字段标识" onchange="setDefaultValue(this)">
										<option value="">-----</option>
										<option <c:if test="${configItem.name == 'title'}">selected="selected"</c:if> value="title">title</option>
										<option <c:if test="${configItem.name == 'content'}">selected="selected"</c:if> value="content">content</option>
										<option <c:if test="${configItem.name == 'author'}">selected="selected"</c:if> value="author">author</option>
										<option <c:if test="${configItem.name == 'comment_c'}">selected="selected"</c:if> value="comment_c">comment_c</option>
										<option <c:if test="${configItem.name == 'pubdate'}">selected="selected"</c:if> value="pubdate">pubdate</option>
										<option <c:if test="${configItem.name == 'source'}">selected="selected"</c:if> value="source">source</option>
										<option <c:if test="${configItem.name == 'views'}">selected="selected"</c:if> value="views">views</option>
										<option <c:if test="${configItem.name == 'realUrl'}">selected="selected"</c:if> value="realUrl">realUrl</option>
										<option <c:if test="${configItem.name == 'facePic'}">selected="selected"</c:if> value="facePic">facePic</option>
										<option <c:if test="${configItem.name == 'isAuth'}">selected="selected"</c:if> value="isAuth">isAuth</option>
										<option <c:if test="${configItem.name == 'picture'}">selected="selected"</c:if> value="picture">picture</option>
										<option <c:if test="${configItem.name == 'thumb'}">selected="selected"</c:if> value="thumb">thumb</option>
										<option <c:if test="${configItem.name == 'editor'}">selected="selected"</c:if> value="editor">editor</option>
										<option <c:if test="${configItem.name == 'reserved'}">selected="selected"</c:if> value="reserved">reserved</option>
										<option <c:if test="${configItem.name == 'reservedTime'}">selected="selected"</c:if> value="reservedTime">reservedTime</option>
										<option <c:if test="${configItem.name == 'keywords'}">selected="selected"</c:if> value="keywords">keywords</option>
										<option <c:if test="${configItem.name == 'reply'}">selected="selected"</c:if> value="reply">reply</option>
									</select>
								</td>
								<td>
									<select name="item[type][]" alt="字段类型">
										<option <c:if test="${configItem.type == 'xpath'}">selected="selected"</c:if> value="xpath">Xpath</option>
										<option <c:if test="${configItem.type == 'value'}">selected="selected"</c:if> value="value">Value</option>
									</select>
								</td>
								<td><input name="item[variable][]" value="${configItem.variable}" alt="字段参数" size="15" /></td>
								<td><input name="item[regex][]" value="${configItem.regex}" alt="过滤正则式" size="15" /></td>
								<td><input name="item[unit][]" value='${configItem.unit}' alt="处理器" size="12" /></td>
								<td>
									<select name="item[required][]" alt="必要项">
										<option <c:if test="${configItem.required eq 0}">selected="selected"</c:if> value="0">否</option>
										<option <c:if test="${configItem.required eq 1}">selected="selected"</c:if> value="1">是</option>
									</select>
								</td>
								<td><a href="###" onclick="itemRemove(this)"> - </a></td>
							</tr>
						</c:forEach>
						<tr>
							<td><input name="item[title][]" alt="字段名称" size="7" /></td>
							<td>
								<select name="item[name][]" alt="字段标识" onchange="setDefaultValue(this)">
									<option value="">-----</option>
									<option value="title">title</option>
									<option value="content">content</option>
									<option value="author">author</option>
									<option value="comment_c">comment_c</option>
									<option value="pubdate">pubdate</option>
									<option value="source">source</option>
									<option value="views">views</option>
									<option value="realUrl">realUrl</option>
									<option value="facePic">facePic</option>
									<option value="isAuth">isAuth</option>
									<option value="picture">picture</option>
									<option value="thumb">thumb</option>
									<option value="editor">editor</option>
									<option value="reserved">reserved</option>
									<option value="reservedTime">reservedTime</option>
									<option value="keywords">keywords</option>
									<option value="reply">reply</option>
								</select>
							</td>
							<td>
								<select name="item[type][]" alt="字段类型">
									<option value="xpath">Xpath</option>
									<option value="value">Value</option>
								</select>
							</td>
							<td><input name="item[variable][]" alt="字段参数" size="15" /></td>
							<td><input name="item[regex][]" alt="过滤正则式" size="15" /></td>
							<td><input name="item[unit][]" alt="处理器" size="12" /></td>
							<td>
								<select name="item[required][]" alt="必要项">
									<option value="0">否</option>
									<option value="1">是</option>
								</select>
							</td>
							<td><a href="###" onclick="itemClone(this)"> + </a></td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 内容规则 end -->
		</div>
		</form>
	</div>
	<!-- addPointCon end -->

	<!-- submit start -->
	<div class="submitBox">
		<span class="submitBnt_1"><a onclick="return submitNormalForm('/webGatherNode/update')" href="###"></a></span>
		<span class="returnBnt"><a id="backUrl" href="${backUrl }" onclick="window.history.back()"></a></span>
	</div>
	<!-- submit end -->

	<!-- submit success start -->
	<div class="restate" style="display:none;">
		<span><img src="/static/images/loading.gif" />&nbsp;</span>
	</div>
<!-- submit success end -->

</div>
				
				<!-- 页面内容  end -->
				</div>
			</td>
		</tr>
	</table>
	</div>
<!-- table content end -->
</div>
<script type="text/javascript">
//检查是否开启蜘蛛
function spider(prefix) {
	if($(prefix).val() == 0) {
		$('#spider').hide();
	} else {
		$('#spider').show();
	}
}

//检查是否需要登录
function spiderLogin(prefix) {
	if($(prefix).val() == 0) {
		$('#spider_login').hide();
	} else {
		$('#spider_login').show();
	}
}

//增加配置输入行
function itemClone(e) {
	var itemObj = $(e).parents("#spiderItem tr").clone();
	$(e).parent().html('<a href="###" onclick="itemRemove(this)">-</a>');
	$('#spiderItem').append(itemObj);
}

//删除配置行
function itemRemove(e) {
	$(e).parents("#spiderItem tr").remove();
}

//检查必填项
function checkRequired(requiredValue) {
	for(var i=0; i<requiredValue.length; i++) {
		if($('#'+requiredValue[i]).val() == "") {
			var message = {};
			attribute=requiredValue[i];
			message[attribute] = $('#'+requiredValue[i]).parent().parent().find('.inputTitle').text()+' 不能为空！';
			
			responseMessage(message);

			$('#'+requiredValue[i]).focus();
			return true;
		}
	}
	return false;
}

//检查采集字段配置
function checkConfigItem(requiredValue) {
	var itemConfigLine = $("#spiderItem tr");
	//全空的行忽略
	for (var i=1; i<itemConfigLine.length; i++){
		if ($(itemConfigLine[i]).find('input[value!=""]').length == 0) {
			continue;
		}

		for (var j=0; j<requiredValue.length; j++){
			var itemRequire = $(itemConfigLine[i]).find('input[name="'+requiredValue[j]+'"]');
			if (itemRequire.val() == ''){
				//alert(itemRequire.attr("alt")+"：不能为空！");
				itemRequire.focus();
				return true;
			}
		}
	}
	return false;
}

function checkSpider() {
	//检查采集点必填项
	var requiredValue = new Array('WebGatherNode_wgnName', 'WebGatherNode_wgnWeight', 'WebGatherNode_wgnUniqueId');
	if (checkRequired(requiredValue)){
		return true;
	}

	//检查是否需要登录
	requiredValue = new Array('WebGatherNode_wgnLoginEntry', 'WebGatherNode_wgnLoginAccount', 'WebGatherNode_wgnLoginPassword');
	if ($("#WebGatherNode_wgnSpiderEnable input:checked").val() == 1 && $($("#WebGatherNode_wgnLoginEnable input:checked")).val() == 1 && checkRequired(requiredValue)){
		return true;
	}

	//检查蜘蛛必填项
	requiredValue = new Array('WebGatherNode_wgnDepthLimit', 'WebGatherNode_wgnTimeInterval', 'WebGatherNode_wgnUserAgents', 'WebGatherNode_wgnEntryUrl', 'WebGatherNode_wgnAllowDomain', 'WebGatherNode_wgnAllowRule');
	if ($("#WebGatherNode_wgnSpiderEnable input:checked").val() == 1 && checkRequired(requiredValue)){
		return true;
	}

	//检查采集字段配置
	requiredValue = new Array('item[title][]', 'item[name][]', 'item[variable][]');
	if ($("#WebGatherNode_wgnSpiderEnable input:checked").val() == 1 && checkConfigItem(requiredValue)){
		return true;
	}

	return false;
}

//检查表单数据，并返回表单值
function checkValue() {
	//检查必填项
	if (checkSpider()){
		return false;
	}

	var spiderItemData = {'item[title][]':[],'item[name][]':[],'item[type][]':[],'item[variable][]':[],'item[regex][]':[],'item[unit][]':[],'item[required][]':[]};

	//检查主表单值
	var mainData = $('div[title="node-form"] input[type=text],input[type=hidden] ,div[title="node-form"] select,div[title="node-form"] input[type=radio]:checked ,div[title="node-form"] textarea');
	for (var i = 0; i < mainData.length; i++) {
		spiderItemData[$(mainData[i]).attr('name')] = $(mainData[i]).val();
	}

	//附加配置数据
	var itemData = $('#spiderItem tr');
	//遍历每行的输入数据
	for(var i = 1; i < itemData.length; i++) {
		var itemLine = $(itemData[i]).find("input,select");
		
		//如果第一项为空，则忽略此行数据
		if (!(itemLine.length && $(itemLine[0]).val())){
			continue;
		}

		//将所有值存放到数组
		for(var j = 0; j < itemLine.length; j++) {
			spiderItemData[$(itemLine[j]).attr('name')].push($(itemLine[j]).val());
		}
	}

	return spiderItemData;
}

//提交表单数据
function submitNormalForm(requestUrl) {
	var spiderData = checkValue();
	if(spiderData){
		messageContent(1,'正在提交数据');
		if (spiderData) {
			$.ajax({
			type:"POST",	 
			url : requestUrl,
			dataType: "json",
			data: spiderData,
			success: function (response) {
				//保存成功
				if (response.success){
					//操作成功处理
					messageContent(1,'更新成功');
					setTimeout(function() {window.location = $('#backUrl').attr('href')}, 2000);
					return;
				}

				//提示错误
				responseMessage(response);
				messageContent(0,'');
				setTimeout(function() {window.location = $('#backUrl').attr('href')}, 2000);
				return;
			},
			error:function() {
				messageContent(1,'网络发生错误');
				setTimeout(function() {window.location = $('#backUrl').attr('href')}, 2000);
				return;
			}});
			
		}
	}
		
}

//按钮切换效果
function changeBnt(bnt,con)
{
	$("."+bnt).click(function()
	{
		$("."+bnt).removeClass("addPointConBntAct");
		$(this).addClass("addPointConBntAct");
		$("."+con).addClass("hidden");
		$($("."+con)[$(this).index()]).removeClass("hidden");
	})
	

}

//典型配置
function setDefaultValue(objName)
{
	//预设配置
	var itemConfig = {
		title:{
			'item[title][]'		: '标题',
			'item[type][]'		: 'xpath',
			'item[variable][]'	: '',
			'item[regex][]'		: '',
			'item[unit][]'		: '{"cls":"TakeFirst"}',
			'item[required][]'	: 1
		},
		content:{
			'item[title][]'		: '内容',
			'item[type][]'		: 'xpath',
			'item[variable][]'	: '',
			'item[regex][]'		: '',
			'item[unit][]'		: '{"param":["\n"],"cls":"Join"}',
			'item[required][]'	: 0
		},
		author:{
			'item[title][]'		: '作者',
			'item[type][]'		: 'xpath',
			'item[variable][]'	: '',
			'item[regex][]'		: '',
			'item[unit][]'		: '{"cls":"TakeFirst"}',
			'item[required][]'	: 0
		},
		comment_c:{
			'item[title][]'		: '评论数',
			'item[type][]'		: 'value',
			'item[variable][]'	: 0,
			'item[regex][]'		: '',
			'item[unit][]'		: '',
			'item[required][]'	: 0
		},
		pubdate:{
			'item[title][]'		: '发布日期',
			'item[type][]'		: 'xpath',
			'item[variable][]'	: '',
			'item[regex][]'		: '',
			'item[unit][]'		: '{"cls":"DateFormatter"}',
			'item[required][]'	: 0
		},
		source:{
			'item[title][]'		: '来源',
			'item[type][]'		: 'xpath',
			'item[variable][]'	: '',
			'item[regex][]'		: '',
			'item[unit][]'		: '{"cls":"TakeFirst"}',
			'item[required][]'	: 0
		},
		views:{
			'item[title][]'		: '查看数',
			'item[type][]'		: 'value',
			'item[variable][]'	: 0,
			'item[regex][]'		: '',
			'item[unit][]'		: '',
			'item[required][]'	: 0
		},
		realUrl:{
			'item[title][]'		: '原始URL',
			'item[type][]'		: 'xpath',
			'item[variable][]'	: '',
			'item[regex][]'		: '',
			'item[unit][]'		: '',
			'item[required][]'	: 0
		},
		facePic:{
			'item[title][]'		: '头像',
			'item[type][]'		: 'xpath',
			'item[variable][]'	: '',
			'item[regex][]'		: '',
			'item[unit][]'		: '',
			'item[required][]'	: 0
		},
		isAuth:{
			'item[title][]'		: '认证用户',
			'item[type][]'		: 'xpath',
			'item[variable][]'	: '',
			'item[regex][]'		: '',
			'item[unit][]'		: '',
			'item[required][]'	: 0
		},
		picture:{
			'item[title][]'		: '图片',
			'item[type][]'		: 'xpath',
			'item[variable][]'	: '',
			'item[regex][]'		: '',
			'item[unit][]'		: '',
			'item[required][]'	: 0
		},
		
		editor:{
			'item[title][]'		: '编辑',
			'item[type][]'		: 'xpath',
			'item[variable][]'	: '',
			'item[regex][]'		: '',
			'item[unit][]'		: '',
			'item[required][]'	: 0
		},
		reserved:{
			'item[title][]'		: '转载数',
			'item[type][]'		: 'xpath',
			'item[variable][]'	: '',
			'item[regex][]'		: '',
			'item[unit][]'		: '',
			'item[required][]'	: 0
		},
		reservedTime:{
			'item[title][]'		: '最近转载时间',
			'item[type][]'		: 'xpath',
			'item[variable][]'	: '',
			'item[regex][]'		: '',
			'item[unit][]'		: '',
			'item[required][]'	: 0
		},
		keywords:{
			'item[title][]'		: '关键字',
			'item[type][]'		: 'xpath',
			'item[variable][]'	: '',
			'item[regex][]'		: '',
			'item[unit][]'		: '',
			'item[required][]'	: 0
		},
		reply:{
			'item[title][]'		: '回复数',
			'item[type][]'		: 'xpath',
			'item[variable][]'	: '',
			'item[regex][]'		: '',
			'item[unit][]'		: '',
			'item[required][]'	: 0
		}
		
	};

	var currentSelect = $(objName);
	if (itemConfig[currentSelect.val()]){
		//当前配置值
		var currentConfig = itemConfig[currentSelect.val()];

		//遍历当前行配置项
		var itemList = currentSelect.parent().parent().find('input,select');
		for(var i=0; i<itemList.length; i++) {
			if (currentConfig[$(itemList[i]).attr('name')] != undefined){
				//设置配置项值
				$(itemList[i]).val(currentConfig[$(itemList[i]).attr('name')]);
			}
		}
	}
}

$(function() {
	spider($("#WebGatherNode_wgnSpiderEnable input:checked"));
	spiderLogin($("#WebGatherNode_wgnLoginEnable input:checked"));

	//执行按钮切换效果
	changeBnt("addPointConBntDiv","basic");
})
</script>
<%@include file="../bottom.jsp"%>
</body>
</html>
