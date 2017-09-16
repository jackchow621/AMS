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
		    url:'queryToApproval.action', 
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
		        {field:'iP_id',title:'申请IP编号',width:100,align:'center'},
		        {field:'emp_id',title:'申请人编号',width:100,align:'center'},
		        {field:'reason',title:'申请理由',width:100,align:'center'},
		        {field:'number',title:'申请数量',width:100,align:'center'},
		        {field:'place',title:'使用地点',width:100,align:'center'},
		        {field:'iF_num',title:'网口号码',width:100,align:'center'},
		        {field:'useDay',title:'使用时间',width:100,align:'center'},
		        {field:'applicationDate',title:'申请时间',width:100,align:'center'},
		        
		        {field:'approvalStatus',title:'审批状态',width:100,align:'center'},  
		        {field:'approvalDate',title:'审批时间',width:100,align:'center'},
		        {field:'process_emp_id',title:'处理人编号',width:100,align:'center',
		        	formatter:function(value,row){
		        		if(value == 0){
		        			return '';
		        		}else{
		        			return value;
		        		}
	        		}		
		        },
		        
		        {field:'processStatus',title:'处理状态',width:100,align:'center'},
		        {field:'processDate',title:'处理时间',width:100,align:'center'}
		    ]],
		    toolbar:[
						
						
						//审批IP申请
						{
							text : "approval",
							iconCls : "icon-edit",
							handler : function() {
								flag="approval";
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
									$("#dialog01").dialog({
										title : '审批IP申请'
									});
						
									$("#dialog01").dialog('open');
									$("#myForm01").form("load", {
										reason:attr[0].reason,
										number:attr[0].number,
										place:attr[0].place,
										iF_num:attr[0].iF_num,
										useDay:attr[0].useDay,
										iP_id:attr[0].iP_id,
										emp_id:attr[0].emp_id,
									});
								}
							}
						},
							
		            ]
		});
		
		//审批IP申请
		$("#dialog01").dialog({
			modal : true,
			title : "审批IP申请",
			draggable : false,
			closed : true

		});

		$("#ok01").click(
				function() {
					$.ajax({
						type : "post",
						url :"../IP/approvalIP.action",
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
	
	<!-- 审批IP申请 -->
	<div id="dialog01" style="width: 400px; height: 300px;">
		<form method="post" id="myForm01">
			<table cellpadding="0" cellspacing="0" width="100%" height="260px"
				align="center">
				<tr align="center">
					<td>使用理由：</td>
					<td><input type="text" id="reason" name="reason" readonly="readonly"/>
					</td>
				</tr>
				<tr align="center">
					<td>申请数量：</td>
					<td><input type="text" id="number" name="number" readonly="readonly"/>
					</td>
				</tr>
				<tr align="center">
					<td>使用地点：</td>
					<td><input type="text" id="place" name="place" readonly="readonly"/>
					</td>
				</tr>
				<tr align="center">
					<td>网口号：</td>
					<td><input type="text" id="iF_num" name="iF_num" readonly="readonly"/>
					</td>
				</tr>
				<tr align="center">
					<td>使用时间：</td>
					<td><input type="text" id="useDay" name="useDay" readonly="readonly"/>
					</td>
				</tr>
				 
				<tr align="center">
					<td>分配人编号：</td>
					<td><input type="text" id="assign_emp_id" name="assign_emp_id"/>
					</td>
				</tr>
				<tr align="center">
					<td>审批状态：</td>
					<td><input type="radio" name="approvalStatus" value="同意" checked="checked"/>同意
						<input type="radio" name="approvalStatus" value="不同意"/>不同意
					</td>
				</tr>
				<tr align="center">
					<td colspan="2"><a class="easyui-linkbutton" id="ok01">确定</a> <a
						class="easyui-linkbutton" id="reset01">重置</a></td>
				</tr>
				</tr>
			</table>
			<input type="hidden" id="iP_id" name="iP_id" />
			<input type="hidden" id="emp_id" name="emp_id" />
		</form>
	</div>

</body>
</html>