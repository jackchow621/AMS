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
<title>所属部门所有电话会议申请单分配页面</title>
<script type="text/javascript">
	$(function(){
		$('#tt').datagrid({
			idField:'',
		    url:'findTeleconferenceToAssign.action', 
		    fitColumns:true,
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    pageList:[5,10,15,20],
		    rowStyler:function(index,teleconference){
		    	if(teleconference.assignStatus=="未分配"){
		    		return "background:#FFEC8B";
		    	}else if(teleconference.assignStatus=="已分配"){
		    		return "background:#90EE90";
		    	}
		    },
		    
		    frozenColumns:[[
				{field:'cb',title:'复选',width:100,align:'center',checkbox:true}
		    ]],
		    columns:[[   
		        {field:'teleconference_id',title:'电话会议申请编号',width:100,align:'center'},
		        {field:'emp_id',title:'申请员工编号',width:100,align:'center'},
		        {field:'meetDate',title:'开会日期',width:100,align:'center'},
		        {field:'room',title:'使用地点',width:100,align:'center'},
		        {field:'beginDate',title:'会议开始时间',width:100,align:'center'},
		        {field:'endDate',title:'会议结束时间',width:100,align:'center'},
		        {field:'conventioner',title:'开会方数',width:100,align:'center'},
		        {field:'isDevice',title:'是否提供会议设备',width:100,align:'center'},
		        {field:'requirement',title:'特殊需求',width:100,align:'center'},
		        {field:'telephone',title:'联系方式',width:100,align:'center'},
		        {field:'applicationDate',title:'申请时间',width:100,align:'center'},
		        {field:'approvalStatus',title:'审批状态',width:100,align:'center'},
		        {field:'approvalDate',title:'审批时间',width:100,align:'center'},
		        {field:'assignStatus',title:'分配状态',width:100,align:'center'},
		        {field:'assignDate',title:'分配时间',width:100,align:'center'},
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
		    ]],
		    toolbar:[
						{
							text : "assign",
							iconCls : "icon-edit",
							handler : function() {
								flag="assign";
								var attr = $("#tt").datagrid(
										"getSelections");
								if (attr.length != 1) {
									$.messager.show({
										title : '提示',
										msg : '请选中一条数据',
										timeout : 2000
									});
								}else if(attr[0].assignStatus=="已分配"){
									$.messager.show({
										title : '提示',
										msg : '该数据已分配过，请重新选择',
										timeout : 2000
									});
								
								}else if(attr.length==1) {
									$("#dialog01").dialog({
										title : '分配IP申请'
									});
						
									$("#dialog01").dialog('open');
									$("#myForm01").form("load", {
										/* meetDate:attr[0].meetDate,
										room:attr[0].room,
										beginDate:attr[0].beginDate,
										endDate:attr[0].endDate,
										conventioner:attr[0].conventioner,
										isDevice:attr[0].isDevice,
										requirement:attr[0].requirement,
										telephone:attr[0].telephone, */
										teleconference_id:attr[0].teleconference_id,
										emp_id:attr[0].emp_id,
									});
								}
							}
						},
					]
		});
		
		$("#dialog01").dialog({
			modal : true,
			title : "分配IP申请",
			draggable : false,
			closed : true

		});

		$("#ok01").click(
				function() {
					$.ajax({
						type : "post",
						url :"../Teleconference/assignTeleconference.action",
						dateType : "json",
						data : $("#myForm01").serialize(),
						success : function(result) {
							$("#tt").datagrid('reload');
						}
					});

					$("#dialog01").dialog('close');
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
	<!-- 分配电话会议申请 -->
	<div id="dialog01" style="width: 400px; height: 300px;">
		<form method="post" id="myForm01">
			<table cellpadding="0" cellspacing="0" width="100%" height="260px"
				align="center">
				<tr align="center">
					<td>处理人编号：</td>
					<td><input type="text" name="process_emp_id"/>
					</td>
				</tr>
				<tr align="center">
					<td colspan="2"><a class="easyui-linkbutton" id="ok01">确定</a> <a
						class="easyui-linkbutton" id="reset">重置</a></td>
				</tr>
			</table>
			<input type="hidden" id="teleconference_id" name="teleconference_id" />
			<input type="hidden" id="emp_id" name="emp_id" />
		</form>
	</div>

</body>
</html>