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
		    url:'queryToProcess.action', 
		    fitColumns:true,
		    striped:true,
		    rowStyler:function(index,Memory){
		    	if(Memory.processStatus=="未处理"){
		    		return "background:#FFEC8B";
		    	}else if(Memory.processStatus=="已处理"){
		    		return "background:#90EE90";
		    	}
		    },
		    
		    frozenColumns:[[
				{field:'cb',title:'复选',width:100,align:'center',checkbox:true}
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
		        {field:'approval_emp_id',title:'审批人编号',width:100,align:'center'},
		        {field:'approvalStatus',title:'审批状态',width:100,align:'center'},
		        {field:'approvalDate',title:'审批时间',width:100,align:'center'},
		        {field:'assignStatus',title:'分配状态',width:100,align:'center'},
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
						
						
						//处理Memory申请
						{
							text : "process",
							iconCls : "icon-edit",
							handler : function() {
								flag="process";
								var attr = $("#tt").datagrid(
										"getSelections");
								if (attr.length != 1) {
									$.messager.show({
										title : '提示',
										msg : '请选中一条数据',
										timeout : 2000
									});
								}else if(attr[0].processStatus==2){
									$.messager.show({
										title : '提示',
										msg : '该数据已处理过，请重新选择',
										timeout : 2000
									});
								
								}else if(attr.length==1) {
									$("#dialog01").dialog({
										title : '处理Memory申请'
									});
						
									$("#dialog01").dialog('open');
									$("#myForm01").form("load", {
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
										approvalStatus:attr[0].approvalStatus
									});
								}
							}
						},
					]
		});
		
		
		
		
		
		//处理Memory申请
		$("#dialog01").dialog({
			modal : true,
			title : "分配Memory申请",
			draggable : false,
			closed : true

		});

		$("#ok01").click(
				function() {
					$.ajax({
						type : "post",
						url :"../Memory/processMemory.action",
						dateType : "json",
						data : $("#myForm01").serialize(),
						success : function(result) {
							$("#tt").datagrid('reload');
						}
					});

					$("#dialog01").dialog('close');
					//$("#tt").datagrid('reload');
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
	
	<!-- 处理IP申请 -->
	<div id="dialog01" style="width: 500px; height: 600;">
		<form method="post" id="myForm01">
			<table cellpadding="0" cellspacing="0" width="100%" height="450px"
				align="center">
				<tr align="center">
					<tr>
						<td>所需空间:</td>
						<td colspan="3" align="left"><input type="text" name="space" readonly="readonly"/></td>
					</tr>
					<tr>
						<td>使用期限:</td>
						<td colspan="3"><input type="text" name="beginDate" readonly="readonly"/>至
							<input type="text" name="endDate" readonly="readonly"/></td>
					</tr>
					<tr>
						<td>申请原因:</td>
						<td colspan="3"><textarea cols="60" rows="2" name="reason" readonly="readonly"></textarea></td>
					</tr>
					<tr>
						<td>目标访问权限:</td>
						<td colspan="3"><textarea cols="60" rows="2" name="authority" readonly="readonly"></textarea></td>
					</tr>
					<tr>
						<td>特殊需求:</td>
						<td colspan="3"><textarea cols="60" rows="2" name="requirement" readonly="readonly"></textarea></td>
					</tr>
					<tr>
						<td>申请网口端号:</td>
						<td colspan="3"><input type="text" name="dept_port" readonly="readonly"/></td>
					</tr>
					<tr>
						<td>申请时间:</td>
						<td colspan="3"><input type="text" name="applicationDate" readonly="readonly"/></td>
					</tr>
					<tr align="center">
					<td>处理状态：</td>
					<td><input type="radio" name="processStatus" value="未处理"/>未处理
						<input type="radio" name="processStatus" value="已处理"/>已处理
					</td>
				</tr>
				<tr align="center">
					<td colspan="2"><a class="easyui-linkbutton" id="ok01">确定</a> <a
						class="easyui-linkbutton" id="reset01">重置</a></td>
				</tr>
			</table>
			<input type="hidden" id="memory_id" name="memory_id" />
			<input type="hidden" id="emp_id" name="emp_id" />
		</form>
	</div>

</body>
</html>