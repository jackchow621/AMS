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
<title>所属所有Memory内存空间申请</title>
<script type="text/javascript">
	$(function(){
		var flag = false;
		
		$('#tt').datagrid({
			idField:'',
		    url:'../Memory/queryMemory.action', 
		    fitColumns:true,
		    striped:true,
		    rowStyler:function(index,Memory){
		    	if(Memory.approvalStatus=='未审批'){
		    		return "background:#FFEC8B";
		    	}else if(Memory.approvalStatus=="同意"){
		    		return "background:#90EE90";
		    	}else if(Memory.approvalStatus=="不同意"){
		    		return "background:#EEA2AD";
		    	}
		    },
		    
		    frozenColumns:[[
				{field:'cb',title:'复选',width:50,align:'center',checkbox:true}
		    ]],
		    columns:[[   
		        {field:'memory_id',title:'申请内存编号',width:100,align:'center'},
		        {field:'space',title:'所需空间',width:100,align:'center'},
		        {field:'beginDate',title:'开始时间',width:100,align:'center'},
		        {field:'endDate',title:'结束时间',width:100,align:'center'},
		        {field:'reason',title:'申请原因',width:100,align:'center'},
		        {field:'authority',title:'目标访问权限',width:100,align:'center'},
		        {field:'requirement',title:'特殊需求',width:100,align:'center'},
		        {field:'dept_port',title:'申请网口端号',width:100,align:'center'},
		        {field:'applicationDate',title:'申请时间',width:100,align:'center'},
		        /* {field:'approval_emp_id',title:'审批人编号',width:100,align:'center'}, */
		        {field:'approvalStatus',title:'审批状态',width:100,align:'center'},
		        {field:'approvalDate',title:'审批时间',width:100,align:'center'},
		       /*  {field:'assignStatus',title:'分配状态',width:100,align:'center'}, */
		        {field:'process_emp_id',title:'处理人编号',width:100,align:'center',
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
										title : '修改Memory申请'
									});
						
									$("#dialog").dialog('open');
									$("#myForm").form("load", {
										space:attr[0].space,
										beginDate:attr[0].beginDate,
										endDate:attr[0].endDate,
										reason:attr[0].reason,
										authority:attr[0].authority,
										requirement:attr[0].requirement,
										dept_port:attr[0].dept_port,
										applicationDate:attr[0].applicationDate,
										memory_id:attr[0].memory_id,
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
									$.messager.confirm("text","您确定要删除么 ?",function(status){
											if(status){
												var Memory_ids="";
												for(var i = 0 ; i < attr.length; i++){
													Memory_ids += attr[i].memory_id+",";
												}
												
												Memory_ids = Memory_ids.substring(0, Memory_ids.length-1);
												
												$.post("../Memory/deleteMemory.action",{Memory_ids:Memory_ids},function(status){
													
													$("#tt").datagrid('reload');
													
													$.messager.show({
														title:'提示信息',
														msg:'删除成功',
														timeout:2000
													});
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
			title : "新增员工",
			draggable : false,
			closed : true

		});
		$("#ok").click(
				function() {
					$.ajax({
						type : "post",
						url :"../Memory/updateMemory.action",
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
	<!-- 修改Memory申请 -->
	<div id="dialog" style="width: 550px; height: 450px;">
		<form method="post" id="myForm">
			<table cellpadding="0" cellspacing="0" width="100%" height="400px"
				align="center">
				<tr>
						<td>所需空间:</td>
						<td colspan="3" align="left"><input type="text" name="space"/></td>
					</tr>
					<tr>
						<td>使用期限:</td>
						<td colspan="3"><input type="text" name="beginDate"/>至
							<input type="text" name="endDate"/></td>
					</tr>
					<tr>
						<td>申请原因:</td>
						<td colspan="3"><textarea cols="60" rows="2" name="reason"></textarea></td>
					</tr>
					<tr>
						<td>目标访问权限:</td>
						<td colspan="3"><textarea cols="60" rows="2" name="authority"></textarea></td>
					</tr>
					<tr>
						<td>特殊需求:</td>
						<td colspan="3"><textarea cols="60" rows="2" name="requirement"></textarea></td>
					</tr>
					<tr>
						<td>申请网口端号:</td>
						<td colspan="3"><input type="text" name="dept_port"/></td>
					</tr>
					<tr>
						<td>申请时间:</td>
						<td colspan="3"><input type="text" name="applicationDate"/></td>
					</tr>
					<tr align="center">
					<td colspan="2"><a class="easyui-linkbutton" id="ok">确定</a> <a
						class="easyui-linkbutton" id="reset">重置</a></td>
				</tr>
			</table>
			<input type="hidden" id="memory_id" name="memory_id" />
			<input type="hidden" id="emp_id" name="emp_id" />
		</form>
	</div>
	

</body>
</html>