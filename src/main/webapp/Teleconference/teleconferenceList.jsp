<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.4.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.4.3/themes/icon.css">
<link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.4.3/demo/demo.css">
<script type="text/javascript" src="../js/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<title>所属所有电话会议申请</title>
<script type="text/javascript">
	$(function(){
		$('#tt').datagrid({
			idField:'',
		    url:'../Teleconference/findTeleconferenceByEmpid.action', 
		    fitColumns:true,
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    pageList:[5,10,15,20],
		    rowStyler:function(index,IP){
		    	if(IP.approvalStatus=="未审批"){
		    		return "background:#FFEC8B";
		    	}else if(IP.approvalStatus=="同意"){
		    		return "background:#90EE90";
		    	}else if(IP.approvalStatus=="不同意"){
		    		return "background:#EEA2AD";
		    	}
		    },
		    
		    frozenColumns:[[
				{field:'cb',title:'复选',width:100,align:'center',checkbox:true}
		    ]],
		    columns:[[   
		        {field:'teleconference_id',title:'电话会议申请编号',width:100,align:'center'},
		        {field:'meetDate',title:'开会日期',width:100,align:'center'},
		        {field:'room',title:'使用地点',width:100,align:'center'},
		        {field:'beginDate',title:'会议开始时间',width:100,align:'center'},
		        {field:'endDate',title:'会议结束时间',width:100,align:'center'},
		        {field:'conventioner',title:'开会方数',width:100,align:'center'},
		        {field:'isDevice',title:'是否提供会议设备',width:100,align:'center'},
		        {field:'requirement',title:'特殊需求',width:100,align:'center'},
		        {field:'telephone',title:'联系方式',width:100,align:'center'},
		        {field:'applicationDate',title:'提交时间',width:100,align:'center'},
		        {field:'approvalStatus',title:'审批状态',width:100,align:'center'},
		        {field:'approvalDate',title:'审批时间',width:100,align:'center'},
		        {field:'process_emp_id',title:'处理员工编号',width:100,align:'center',
			        formatter:function(value,row){
		        		if(value==0){
		        			return "";
		        		}else{
		        			return value;
		        		}
	        		}
		        },
		        {field:'processStatus',title:'处理状态',width:100,align:'center'},
		        {field:'processDate',title:'处理时间',width:100,align:'center'}
		    ]],
		    toolbar:[
						{
							text : "edit",
							iconCls : "icon-edit",
							handler : function() {
								var attr = $("#tt").datagrid("getSelections");
								if (attr.length != 1) {
									$.messager.show({
										title : '提示',
										msg : '请选中一条数据',
										timeout : 2000
									});
								}else if(attr[0].approvalStatus=="同意"){
									$.messager.show({
										title : '提示',
										msg : '该数据已审批过，请重新选择',
										timeout : 2000
									});
								}else if(attr[0].approvalStatus=="不同意"){
									$.messager.show({
										title : '提示',
										msg : '该数据已处理过，请重新选择',
										timeout : 2000
									});
								}else if(attr.length==1) {
									$("#dialog").dialog({
										title : '修改电话会议申请'
									});
									$("#dialog").dialog('open');
									$("#myForm").form("load", {
										meetDate:attr[0].meetDate,
										room:attr[0].room,
										beginDate:attr[0].beginDate,
										endDate:attr[0].endDate,
										conventioner:attr[0].conventioner,
										isDevice:attr[0].isDevice,
										requirement:attr[0].requirement,
										telephone:attr[0].telephone,
										teleconference_id:attr[0].teleconference_id,
										emp_id:attr[0].emp_id,
									});
								}
							}
						},
						{
							text:"remove",
							iconCls:"icon-remove",
							handler:function(){
								var attr = $("#tt").datagrid("getSelections");
								if(attr.length<=0){
									$.messager.alert("提示信息","请选择至少一条数据！");
								}else if(attr[0].approvalStatus!="未审批"){
									$.messager.show({
										title:'提示信息',
										msg:'该数据已审批过，请重新选择',
										timeout:2000
									});
								}else if(attr.length==1 && attr[0].approvalStatus=="未审批"){
									$.messager.confirm("提示信息","您确定要删除么 ?",function(status){
											if(status){
												var teleconference_ids="";
												for(var i = 0 ; i < attr.length; i++){
													teleconference_ids += attr[i].teleconference_id+",";
												}
												
												teleconference_ids = teleconference_ids.substring(0, teleconference_ids.length-1);
												
												$.post("../Teleconference/deleteTeleconference.action",{teleconference_ids:teleconference_ids},function(status){
													$("#tt").datagrid("reload");
													});
													$.messager.show({
														title:'提示信息',
														msg:'删除成功',
														timeout:2000
													});
											}else{
												return ;
											}
									});
								}
							}
						},
		            ]
		});
		
		$("#dialog").dialog({
			modal : true,
			title : "修改电话会议申请",
			draggable : false,
			closed : true
		});
		
		$("#ok").click(
				function() {
					$.ajax({
						type : "post",
						url: '../Teleconference/updateTeleconference.action',
						dateType : "json",
						data : $("#myForm").serialize(),
						cache:false,
						success : function(result) {
							$("#tt").datagrid('reload');
						}
					});
					$("#dialog").dialog('close');
					$("#tt").datagrid('reload');
					$.messager.show({
						title : '提示信息',
						msg : '操作成功',
						timeout : 2000
					});

				});
	});
</script>
</head>
<body>
	<table id="tt"></table>
	<!-- 修改电话会议申请 -->
	<div id="dialog" style="width:650px;">
		<form method="post" id="myForm">
			<table id="ta" cellpadding="0" cellspacing="0" border="0" width="650px">
					<tr>
						<td>开会日期:</td>
						<td><input type="text" name="meetDate"/></td>
						<td>使用地点:</td>
						<td align="left"><input type="text" name="room"/></td>
					</tr>
					<tr>
						<td>开会时间:</td>
						<td colspan="3" align="left"><input type="text" name="beginDate"/>至
							<input type="text" name="endDate"/></td>
					</tr>
					<tr>
						<td>开会方数:</td>
						<td><input type="text" name="conventioner"/></td>
						<td>是否提供会议设备:</td>
						<td><input type="radio" name="isDevice" value="是"/>是
							<input type="radio" name="isDevice" value="否"/>否</td>
					</tr>
					<tr>
						<td>联系号码:</td>
						<td><input type="text" name="telephone"/></td>
					</tr>
					<tr>
						<td>特殊需求:</td>
						<td colspan="3"><textarea cols="58" rows="10" name="requirement"></textarea></td>
					</tr>
					
					<tr align="center">
					<td colspan="2"><a class="easyui-linkbutton" id="ok">确定</a> <a
						class="easyui-linkbutton" id="reset">重置</a></td>
				</tr>
				</table>
			<input type="hidden" id="teleconference_id" name="teleconference_id" />
			<input type="hidden" id="emp_id" name="emp_id" />
		</form>
	</div>
</body>
</html>