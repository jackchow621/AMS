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
<title>所属所有email申请</title>
<script type="text/javascript">
	$(function(){
		var flag = false;
		
		$('#tt').datagrid({
			idField:'',
		    url:'../Email/findEmailByEmpId.action', 
		    fitColumns:true,
		    striped:true,
		    rowStyler:function(index,email){
		    	if(email.approvalStatus=="未审批"){
		    		return "background:#FFEC8B";
		    	}else if(email.approvalStatus=="同意"){
		    		return "background:#90EE90";
		    	}else if(email.approvalStatus=="未同意"){
		    		return "background:#EEA2AD";
		    	}
		    },
		    
		    frozenColumns:[[
				{field:'cb',title:'复选',width:100,align:'center',checkbox:true}
		    ]],
		    columns:[[   
		        {field:'email_id',title:'邮箱申请ID',width:100,align:'center'},
		        {field:'type',title:'申请类型',width:100,align:'center'},
		        {field:'beginDate',title:'开始时间',width:100,align:'center'},
		        {field:'endDate',title:'结束时间',width:100,align:'center'},
		        {field:'reason',title:'申请原因',width:100,align:'center'},
		        {field:'applicationDate',title:'申请时间',width:100,align:'center'},
		        {field:'approvalStatus',title:'审批状态',width:100,align:'center'},  
		        {field:'approvalDate',title:'审批时间',width:100,align:'center'},
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
		        {field:'processDate',title:'处理时间',width:100,align:'center'},
		        {field:'comment',title:'备注',width:100,align:'center'}
		    ]],
		    toolbar:[
						{
							text : "修改",
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
										title : '修改email申请'
									});
						
									$("#dialog").dialog('open');
									$("#myForm").form("load", {
										type:attr[0].type,
										beginDate:attr[0].beginDate,
										endDate:attr[0].endDate,
										reason:attr[0].reason,
										email_id:attr[0].email_id,
										emp_id:attr[0].emp_id
									});
								}
							}
						},
						{
							text:"删除",
							iconCls:"icon-remove",
							handler:function(){
								var attr = $("#tt").datagrid("getSelections");
								if(attr.length<=0){
									$.messager.alert("提示信息","请选择至少一条数据！")
								}else if(attr[0].approvalStatus!="未审批"){
									$.messager.show({
										title:'提示信息',
										msg:'该数据已审批过，请重新选择',
										timeout:2000
									});
								}else if(attr.length==1 && attr[0].approvalStatus=="未审批"){
									$.messager.confirm("text","您确定要删除么 ?",function(status){
											if(status){
												var email_ids="";
												for(var i = 0 ; i < attr.length; i++){
													email_ids += attr[i].email_id+",";
												}
												
												email_ids = email_ids.substring(0, email_ids.length-1);
												
												$.post("../Email/deleteEmail.action",{email_ids:email_ids},function(status){
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
		
		
		//修改Email申请
		$("#dialog").dialog({
			modal : true,
			title : "修改email申请",
			draggable : false,
			closed : true

		});
		$("#ok").click(
				function() {
					$.ajax({
						type : "post",
						url :"../Email/updateEmail.action",
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
	<!-- 修改Email申请 -->
	<div id="dialog" style="width: 400px; height: 300px;">
		<form method="post" id="myForm">
			<table cellpadding="0" cellspacing="0" width="100%" height="260px"
				align="center">
				<tr align="center">
					<td>申请类型：</td>
					<td><input type="radio" name="type" value="新增"/>新增
						<input type="radio" name="type" value="修改"/>修改
					</td>
				</tr>
				<tr align="center">
					<td>开始时间：</td>
					<td><input type="text" id="beginDate" name="beginDate"/>
					</td>
				</tr>
				<tr align="center">
					<td>结束时间：</td>
					<td><input type="text" id="endDate" name="endDate" />
					</td>
				</tr>
				
				<tr align="center">
					<td>申请理由：</td>
					<td><input type="text" id="reason" name="reason" />
					</td>
				</tr>
				<tr align="center">
					<td colspan="2"><a class="easyui-linkbutton" id="ok">确定</a> <a
						class="easyui-linkbutton" id="reset">重置</a></td>
				</tr>
				</tr>
			</table>
			<input type="hidden" id="email_id" name="email_id" />
			<input type="hidden" id="emp_id" name="emp_id" />
		</form>
	</div>


</body>
</html>