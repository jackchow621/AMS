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
<title>所属所有IP地址申请</title>
<script type="text/javascript">
	$(function(){
		var flag = false;
		
		$('#tt').datagrid({
			idField:'',
		    url:'../Leave/findAllLeaves.action', 
		    fitColumns:true,
		    striped:true,
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
		        {field:'leave_id',title:'请假编号',width:100,align:'center'},
		        {field:'emp_id',title:'员工编号',width:100,align:'center'},
		        {field:'beginDate',title:'开始日期',width:100,align:'center'},
		        {field:'endDate',title:'结束日期',width:100,align:'center'},
		        {field:'days',title:'请假天数',width:100,align:'center'},
		        {field:'type',title:'请假类型',width:100,align:'center'},
		        {field:'reason',title:'请假理由',width:100,align:'center'},
		        {field:'applicationDate',title:'申请时间',width:100,align:'center'},
		        {field:'approvalStatus',title:'审批状态',width:100,align:'center'},
		        {field:'approvalDate',title:'审批日期',width:100,align:'center'},
		        {field:'approval_emp_id',title:'审批编号',width:100,align:'center'},
		        {field:'comment',title:'描述',width:100,align:'center'}
		    ]],
		    toolbar:[
						{
							text : "edit",
							iconCls : "icon-edit",
							handler : function() {
								flag="edit";
								var attr = $("#tt").datagrid(
										"getSelections");
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
										title : '修改请假申请'
									});
						
									$("#dialog").dialog('open');
									$("#myForm").form("load", {
										beginDate:attr[0].beginDate,
										endDate:attr[0].endDate,
										days:attr[0].days,
										type:attr[0].type,
										reason:attr[0].reason,
										leave_id:attr[0].leave_id,
										emp_id:attr[0].emp_id
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
									$.messager.confirm("text","您确定要删除么 ?",function(status){
											if(status){
												var leave_ids="";
												for(var i = 0 ; i < attr.length; i++){
													leave_ids += attr[i].leave_id+",";
												}
												
												leave_ids = leave_ids.substring(0, leave_ids.length-1);
												
												$.post("../Leave/deleteLeaves.action",{leave_ids:leave_ids},function(status){
													$("#tt").datagrid('reload');
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
						}
						
						

						
						
		            ]
		});
		
		
		//修改IP申请
		$("#dialog").dialog({
			modal : true,
			title : "修改请假申请",
			draggable : false,
			closed : true

		});
		$("#ok").click(
				function() {
					$.ajax({
						type : "post",
						url :"../Leave/updateLeaves.action",
						dateType : "json",
						data : $("#myForm").serialize(),
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
	<!-- 修改IP申请 -->
	<div id="dialog" style="width: 500px; height: 400px;">
		<form method="post" id="myForm">
			<table cellpadding="0" cellspacing="0" width="100%" height="260px"
				align="center">
				<tr>
						<td colspan="2" align="center">请假时间:</td>
						<td colspan="5"><input type="text" name="beginDate"/>至
							<input type="text" name="endDate"/></td>
				</tr>
				<tr>
						<td colspan="2" align="center">请假天数:</td>
						<td colspan="5"><input type="text" name="days"/></td>
					</tr>
					<tr>
						<td colspan="2" align="center">请假类型:</td>
						<td width="80"><input type="radio" name="type" value="病假"/>病假</td>
						<td width="80"><input type="radio" name="type" value="事假"/>事假</td>
						<td width="80"><input type="radio" name="type" value="丧假"/>丧假</td>
						<td width="80"><input type="radio" name="type" value="婚假"/>婚假</td>
						<td width="80"><input type="radio" name="type" value="产假"/>产假</td>
					</tr>
					<tr>
						<td colspan="2" align="center">申请原因:</td>
						<td colspan="5"><textarea cols="50" rows="10" name="reason"></textarea></td>
					</tr>
				<tr align="center">
					<td colspan="2"><a class="easyui-linkbutton" id="ok">确定</a> <a
						class="easyui-linkbutton" id="reset">重置</a></td>
				</tr>
				</tr>
			</table>
			<input type="hidden" id="leave_id" name="leave_id" />
			<input type="hidden" id="emp_id" name="emp_id" />
		</form>
	</div>
	
	
	
	

</body>
</html>