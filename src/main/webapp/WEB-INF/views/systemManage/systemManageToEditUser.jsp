<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../top.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>广州广报</title>

<script type="text/javascript">


//表单提交
function submitForm(){
	//获取表单数据对象
	var formLabel = $("form").find('input[type="text"],input[type="password"],select');
	//获取表单数据
	var dataLabel = requiredLabel(formLabel);
	//如果检测必填数据为空，返回页面
	if(dataLabel==false){
		return false;
	}
	//是否有错误提示
	var hasErrors = inputPrompt();
	
	//提交表单
	if(hasErrors==false){
		$.ajax({url:$("form").attr("action"),
		type:'post',
		async:false,
		data:dataLabel,
		dataType:"json",
		success:function(msg){
			if(msg.errors){
				$(".restate span").html("<img src=\"<?php echo Yii::app()->request->baseUrl; ?>/images/loading.gif\" />");
				$(".importPrompt").html();
				$(".restate span").append("用户信息修改失败");
				$(".restate").css("display","block");
			}else{
				$(".restate span").html("<img src=\"<?php echo Yii::app()->request->baseUrl; ?>/images/loading.gif\" />");
				$(".importPrompt").html();
				$(".restate span").append("用户信息修改成功");
				$(".restate").css("display","block");
			}

			setInterval("$('.restate').css('display','none')",3000);
			
		}
	});
	
	}


}

//验证不能为空，若都有值则返回表单数组、密码验证、邮箱验证
function requiredLabel(objLabel){
	
	var data = {};

	var status="";

	for(var i=0;i<objLabel.length;i++){
		data[$(objLabel[i]).attr("name")] = $(objLabel[i]).val();
		var labelText = $(objLabel[i]).parent().prev().text();

		if($(objLabel[i]).parent().prev().find("tt").text()=="*" && $(objLabel[i]).val()==""){
			$(objLabel[i]).parent().next().html(labelText.substr(1,labelText.length-2)+"不能为空");
			status = 1;
		}else{
			$(objLabel[i]).parent().next().html("");
		}
	}

	//邮箱验证
	var temp = $("#email");
	var myreg = /^([a-zA-Z0-9]+[_|\_|\.|\-]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	
	if(!myreg.test(temp.val()))
	{	status = 1;
		$(temp).parent().next().html("邮箱地址不符合电子邮箱格式");
	}

	if(status!=1){
		return data;
	}else{
		return false;
	}
}


//是否有错误提示
function inputPrompt(){
	for(var i=0;i<$(".inputPrompt").length;i++){
			if($($(".inputPrompt")[i]).html()==""){
				return false;
			}else{
				return true;
			}
	}
}



</script>


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
				
				<div class="addPoint" style="height:430px;">
<!-- addPointInput start -->

						<form action="/user/editUser" method="post" id="form" name="form">
						<div class="addPointInput modifyIndiv">
							<div class="addPointInputBox">
								<span class="inputTitle inputModifyTitle"><tt>*</tt>用户名：</span>
								<span class="inputDiv inputModifyDiv"><input id="loginName" type="text" maxlength="16" readonly="readonly" name="loginName" value="${user.loginName }"/></span>
								<span class="inputPrompt"></span>
							</div>

							<div class="addPointInputBox">
								<span class="inputTitle inputModifyTitle"><tt>*</tt>用户昵称：</span>
								<span class="inputDiv inputModifyDiv"><input id="username" type="text" maxlength="16" name="username" value="${user.username }"/></span>
								<span class="inputPrompt"></span>
							</div>

							<div class="addPointInputBox">
								<span class="inputTitle inputModifyTitle"><tt>*</tt>用户级别：</span>
								<span class="inputDiv inputModifyDiv"><select id="userType" name="userType" disabled="disabled">
																		<option value="">--</option>
																		<option <c:if test="${user.userType ne 1}">selected="selected"</c:if> value="1">系统用户</option>
																		<option <c:if test="${user.userType eq 1}">selected="selected"</c:if> value="1">管理员用户</option>
																		<!--<option <c:if test="${user.userType eq 1}">selected="selected"</c:if> value="1">系统管理员</option>
																		<option <c:if test="${user.userType eq 2}">selected="selected"</c:if> value="2">部负责人</option>
																		<option <c:if test="${user.userType eq 3}">selected="selected"</c:if> value="3">处室负责人</option>
																		<option <c:if test="${user.userType eq 4}">selected="selected"</c:if> value="4">处室人员</option>
																		<option <c:if test="${user.userType eq 5}">selected="selected"</c:if> value="5">中心负责人</option>
																		<option <c:if test="${user.userType eq 6}">selected="selected"</c:if> value="6">中心人员</option>
																		--></select></span>
								<span class="inputPrompt"></span>
							</div>

							<div class="addPointInputBox">
								<span class="inputTitle inputModifyTitle"><tt>*</tt>电子邮箱：</span>
								<span class="inputDiv inputModifyDiv"><input id="email" type="text" maxlength="64" name="email" value="${user.email }"/></span>
								<span class="inputPrompt"></span>
							</div>
							
							
						
						

						</div>
<!-- addPointInput end -->

<!-- submit start -->
						<div class="submitBox modifyBox">
							<span class="submitBnt_1"><a href="###" onclick="submitForm()"></a></span>
							<span class="returnBnt"><a href="#" onclick="window.history.back()"></a></span>
						</div>
<!-- submit end -->

<!-- submit success start -->
						<div class="restate" style="display:none">
							<span ><img src="/static/images/loading.gif" /></span>
						</div>
<!-- submit success end -->
						</form>
					</div>
					


				
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
