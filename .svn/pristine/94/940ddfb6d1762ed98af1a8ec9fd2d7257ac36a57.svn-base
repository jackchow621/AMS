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
		    url:'../IP/queryIP.action', 
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
										title : '修改IP申请'
									});
						
									$("#dialog").dialog('open');
									$("#myForm").form("load", {
										reason:attr[0].reason,
										number:attr[0].number,
										place:attr[0].place,
										iF_num:attr[0].iF_num,
										useDay:attr[0].useDay,
										iP_id:attr[0].iP_id,
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
												var IP_ids="";
												for(var i = 0 ; i < attr.length; i++){
													IP_ids += attr[i].iP_id+",";
												}
												
												IP_ids = IP_ids.substring(0, IP_ids.length-1);
												
												$.post("../IP/delIP.action",{IP_ids:IP_ids},function(status){
													
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
			title : "修改IP申请",
			draggable : false,
			closed : true

		});
		$("#ok").click(
				function() {
					$.ajax({
						type : "post",
						url :"../IP/editIP.action",
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
	<div id="dialog" style="width: 400px; height: 300px;">
		<form method="post" id="myForm">
			<table cellpadding="0" cellspacing="0" width="100%" height="260px"
				align="center">
				<tr align="center">
					<td>使用理由：</td>
					<td><input type="text" id="reason" name="reason" />
					</td>
				</tr>
				<tr align="center">
					<td>申请数量：</td>
					<td><input type="text" id="number" name="number"/>
					</td>
				</tr>
				<tr align="center">
					<td>使用地点：</td>
					<td><input type="text" id="place" name="place" />
					</td>
				</tr>
				<tr align="center">
					<td>网口号：</td>
					<td><input type="text" id="iF_num" name="iF_num" />
					</td>
				</tr>
				<tr align="center">
					<td>使用时间：</td>
					<td><input type="text" id="useDay" name="useDay" />
					</td>
				</tr>
				<tr align="center">
					<td colspan="2"><a class="easyui-linkbutton" id="ok">确定</a> <a
						class="easyui-linkbutton" id="reset">重置</a></td>
				</tr>
				</tr>
			</table>
			<input type="hidden" id="iP_id" name="iP_id" />
			<input type="hidden" id="emp_id" name="emp_id" />
		</form>
	</div>
	
	
	
	

</body>
</html>