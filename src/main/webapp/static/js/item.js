/********************************** 列表页 ******************************************/
var nowPage;
//获取数据列表
function getItemList(pageGo)
{
	//获取表单
	var objForm = $('form');
	
	//准备参数：搜索条件
	var objParams = {};
	var params = $(objForm).find('input,select');
	for(var i=0; i<params.length; i++) {
		if ($(params[i]).val() != '') {
			objParams[$(params[i]).attr('name')] = $(params[i]).val();
		}
	}

	var requestUrl = $(objForm).attr('action').toString();
	//设置分页地址
	if (pageGo > 0){
		var requestUrl = requestUrl.indexOf('?') == -1 ? requestUrl+'?page='+pageGo : requestUrl+'&page='+pageGo;
	}

	//异步请求数据
	getRequestData(requestUrl, objParams, 'post', dataToHtml);

	$('.position1 input').removeAttr("checked","checked");
	$($('#many').find("option")[0]).attr('selected','selected');

}

//异步请求数据
function getRequestData(url, params, method, handle)
{
	$.ajax({
		type : method,
		url : url,
		data : params,
		dataType : 'json',
		success : function(data) {handle(data)}
	});
}

//格式化分页信息
function pageToHtml(page)
{
	var selectStyle='';
	
	selectStyle+='<div class="tablePageLeft">';
	selectStyle+='<span class="position1"><input type="checkbox" /></span>';
	selectStyle+='<span class="position">全选</span>';
	selectStyle+='<span class="systemSearchRight space2">';
	selectStyle+='<select class="select" name="many" id="many">';
	selectStyle+='<option value="">--</option>';
	selectStyle+='<option value="1">删除词条</option>';
	selectStyle+='<option value="2">开启词条</option>';
	selectStyle+='<option value="3">关闭词条</option>';
	selectStyle+='</select>';
	selectStyle+='</span>';
	selectStyle+='</div>';

	var pageContent = '<div class="tablePageRight">';

	if (page.total > 0){
		pageContent += '<span>第</span><span><input id="pageGo" type="text" /></span><span>页</span>';
		pageContent += '<span onclick="getItemList($(\'#pageGo\').val())"><a href="###"></a></span></div>';

		pageContent += '<div class="tablePageNum">';
		if(page.current>1){
			pageContent += '<span onclick="getItemList('+(page.current-1)+')" class="up"><a href="###"></a></span>';
		}else{
			pageContent += '<span class="upend"><a href="###"></a></span>';
		}
		

		var pageLength = 5;
		for(var i=1; i<=page.count; i++) {
			if (page.current>Math.floor(pageLength/2) && page.current<page.count-Math.floor(pageLength/2) && (i<page.current-Math.floor(pageLength/2) || i>page.current+Math.floor(pageLength/2))){
				continue;
			} 
			if (page.current<Math.ceil(pageLength/2) && i>pageLength){
				continue;
			}
			if (page.current>page.count-Math.ceil(pageLength/2) && i<=page.count-pageLength){
				continue;
			}
			if (page.current == i){
				pageContent += '<span class="normal act"><a href="###">'+i+'</a></span>';
			} else {
				pageContent += '<span onclick="getItemList('+i+')" class="normal"><a href="###">'+i+'</a></span>';
			}
		}
		
		if(page.current<page.count){
			pageContent += '<span onclick="getItemList('+(page.current+1)+')" class="next"><a href="###"></a></span>';
		}else{
			pageContent += '<span class="nextend"><a href="###"></a></span>';
		}
		
	}

	pageContent += '</div>';

	$('#pageInfo').html('<span>共有<tt>'+page.total+'</tt>条记录</span> <span>共有<tt>'+page.count+'</tt>页</span>');
	$('#pageNumber').html(pageContent);
}

//格式化新闻或评论列表
function dataToHtml(response)
{
	var tableHeader = '';
	tableHeader+='<tr class="">';
	tableHeader+='<th width="2%" align="center">&nbsp;</th>';
	tableHeader+='<th width="22%" align="center">词条名称</th>';
	tableHeader+='<th width="8%" align="center">词性</th>';
	tableHeader+='<th width="10%" align="center">权重</th>';
	tableHeader+='<th width="18%" align="center">所属词库</th>';
	tableHeader+='<th width="5%" align="center">状态</th>';
	tableHeader+='<th width="15%" align="center">创建时间</th>';
	tableHeader+='<th width="13%" align="center">操作</th>';
	tableHeader+='</tr>';

	var tableContent = '';

	if (response.data && response.data.length > 0){
		for(var i=0; i<response.data.length; i++) {

		if(response.data[i].status=="正常"){
			var statusClass="normal";
		}else{
			var statusClass="close";
		}

		tableContent+='<tr class="" id="tr_'+response.data[i].id+'">';
		tableContent+='<td width="2%" align="center"><input type="checkBox" id="'+response.data[i].id+'"></td>';
		tableContent+='<td width="22%" align="center">'+response.data[i].name+'</td>';
		tableContent+='<td width="8%" align="center">'+response.data[i].kdqId+'</td>';
		tableContent+='<td width="10%" align="center">'+response.data[i].weight+'</td>';
		tableContent+='<td width="18%" align="center">'+response.data[i].kdlId+'</td>';
		tableContent+='<td width="5%" align="center" class="'+statusClass+'">'+response.data[i].status+'</td>';
		tableContent+='<td width="15%" align="center">'+response.data[i].createTime+'</td>';
		tableContent+='<td width="13%" align="center">';
		tableContent+='<div class="tableListDivTableBnt tableListDivCaseTableBnt">';
		tableContent+='<span class="bntLeft"><a href="'+response.data[i].updateUrl+'"></a></span>';
		tableContent+='<span class="bntRight"><a onclick="return onDelete('+response.data[i].id+',\''+response.data[i].name+'\')" href="###"></a></span>';
		tableContent+='</div>';
		tableContent+='</td>';
		tableContent+='</tr>';

		}
	}

	nowPage=response.page.current;

	pageToHtml(response.page);
	$('#tableContainer').html(tableHeader+tableContent);

	//选中事件样式变化
	var checkBoxLabel = $(".tableListDivTable").find('input[type="checkBox"]');

	$.each(checkBoxLabel,function(i,obj)
	{
		$(obj).bind("click",function()
		{
			$(obj).parent().parent().toggleClass("checked");
		});
	});
}



//全选
$(".position1").find('input').live("click",function(){
	
	var checkBoxLabel = '';
	var checkBoxLabel = $(".tableListDivTable").find('input[type="checkBox"]');
	

	if($(this).attr("checked")=="checked"){

		$(this).attr("checked","checked");
		
		$.each(checkBoxLabel,function(i,obj){	
			$(obj).attr("checked","checked");
			$(obj).parent().parent().addClass("checked");
		});

	}else{

		$(this).removeAttr("checked","checked");

		$.each(checkBoxLabel,function(i,obj){
			$(obj).removeAttr("checked","checked");
			$(obj).parent().parent().removeClass("checked");
		});
	}

});



//批量删除
$("#many").live("change",function(){

	var data = getCheckBoxID();

	//alert(data[1]);return;

	if(data==""){return false};
	
	switch($(this).val()){
		case "1":
		onDelete(data);//批量删除
		break;

		case "2":
		Open(data);//批量开启
		break;

		case "3":
		Close(data);//批量关闭
		break;

		default:
		break;
	}



});

//获取已选中的数据
function getCheckBoxID(){

	var CBLabel = $(".tableListDivTable table").find('input[type="checkBox"]');

	var data=Array();

	for(var i=0;i<CBLabel.length;i++){
		if($($(CBLabel)[i]).attr("checked")=="checked"){
			data.push($(CBLabel[i]).attr("id"));
		}
	}

	return data ;
}


//批量开启词条状态
function Open(id)
{
	if(confirm("是否要批量开启词条")){
		$.ajax({url:$("#openUrl").val(),
			type:"post",
			async:false,
			data:{
				id:id,
				status:1
			},
			dataType:"jsonp",
			success:function(msg){
				if(msg.data){
					getItemList(nowPage);
				}
			}
		});
	}
}

//批量关闭词条状态
function Close(id)
{
	if(confirm("是否要批量关闭词条")){
		$.ajax({url:$("#closeUrl").val(),
			type:"post",
			async:false,
			data:{
				id:id
			},
			dataType:"jsonp",
			success:function(msg){
				if(msg.data){
					getItemList(nowPage);
				}
			}
		});
	}
}



//批量删除词条事件
function onDelete(id,name)
{
	if(id.constructor==Array){
		var info="词条批量删除后将无法恢复！";				
	}else{
		var info="删除词条："+name+"，词条删除后将无法恢复！";
	}

	if(confirm(info)){
		$.ajax({url:$("#deleteUrl").val(),
			type:"post",
			async:false,
			data:{
				id:id
			},
			dataType:"jsonp",
			success:function(msg){
				getItemList(1);
			}
		});
	}
}









