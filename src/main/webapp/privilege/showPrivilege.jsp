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
<title>权限查询</title>
<script type="text/javascript">
	$(function(){
		var flag = "";
		$('#tt').datagrid({
			idField:'',
		    url:'../Privilege/findAllEmpPrivilege.action', 
		    fitColumns:true,
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    pageList:[5,10,15,20],
		    /* rowStyler:function(index,IP){
		    	if(IP.approvalStatus==1){
		    		return "background:#FFEC8B";
		    	}else if(IP.approvalStatus==2){
		    		return "background:#90EE90";
		    	}else if(IP.approvalStatus==3){
		    		return "background:#EEA2AD";
		    	}
		    }, */
		    
		    frozenColumns:[[
				{field:'cb',title:'复选',width:100,align:'center',checkbox:true}
		    ]],
		    columns:[[   
		        {field:'emp_id',title:'员工编号',width:100,align:'center'},
		        {field:'employee',title:'员工姓名',width:100,align:'center',
		        	formatter:function(value,row){
		        		return value.empName;
		        	}
		        },
		        {field:'role_id',title:'员工角色',width:100,align:'center',
		        	formatter:function(value,row){
			        		if(value==1){
			        			return "普通员工";
			        		}else if(value==2){		        			
			        			return "部门经理";
			        		}else if(value==3){		        			
			        			return "分配人";
			        		}else if(value==4){		        			
			        			return "处理人";
			        		}else if(value==5){		        			
			        			return "管理员";
			        		}else if(value==6){		        			
			        			return "老板";
			        		}
			        		
		        		}	
		        	}  
		    ]],
		    toolbar:[
						{
							 text:"add",
							 iconCls:"icon-add",
							 handler:function(){
								 flag="add";
								 //清空表格数据
					    		 $("#dialog").dialog("open");
								 $("#myForm").get(0).reset();
							 }
						},
						{
							text : "edit",
							iconCls : "icon-edit",
							handler : function() {
								flag="edit";
								var attr = $("#tt").datagrid("getSelections");
								if (attr.length != 1) {
									$.messager.show({
										title : '提示',
										msg : '请选中一条数据',
										timeout : 2000
									});
								}else{
									$("#dialog").dialog({
										title : '修改用户角色'
									});
						
									$("#dialog").dialog('open');
									$("#myForm").form("load", {
										emp_id:attr[0].emp_id,
										role_id:attr[0].role_id
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
									$.messager.show({
				    					title:'提示',
				    					msg:'删除至少选择一行数据'
									});
								}else{
									$.messager.confirm("提示信息","您确定要删除么 ?",function(status){
											if(status){
												var emp_ids="";
												for(var i = 0 ; i < attr.length; i++){
													emp_ids += attr[i].emp_id+",";
												}
												
												emp_ids = emp_ids.substring(0, emp_ids.length-1);
												
												$.post("../Privilege/deletePrivilege.action",{emp_ids:emp_ids},function(status){
													});
													$("#tt").datagrid("reload");
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
						{
							 text:"search",
							 iconCls:"icon-search",
							 handler:function(){
								 //清空表格数据
					    		 $("#searchDialog").dialog("open");
							 }
						}
		            ]
		});
		
		$("#dialog").dialog({
			modal : true,
			title : "增加角色用户",
			draggable : false,
			closed : true
		});
		$("#searchDialog").dialog({
			modal : true,
			title : "增加角色用户",
			draggable : false,
			closed : true
		});
		
		$("#ok").click(
				function() {
					$.ajax({
						type : "post",
						url: flag == 'edit' ? '../Privilege/updatePrivilege.action' : '../Privilege/savePrivilege.action',
						dateType : "json",
						data : $("#myForm").serialize(),
						cache:false,
						success:function(r){
							$.messager.alert('警告信息','对不起，您所输入的员工编号不存在，请确认后重新输入！');
						}
					});
					//1、关闭dialog
					$("#dialog").dialog("close");
					//2、刷新数据
					$("#tt").datagrid("reload");
					//3、提示信息
					$.messager.show({
						title:'提示信息',
						msg:'操作成功'
					});

				});
		
		//根据员工姓名进行模糊搜索
		$("#searchbtn").click(function(){
			$("#tt").datagrid('load',serializeForm($("#searchForm")));
			$.ajax({
				type : "post",
				url:'../Privilege/findAllEmpPrivilege.action',
				dateType : "json",
				data : $("#searchForm").serialize(),
				cache:false,
				success:function(r){
				}
			});
			//1、关闭dialog
			$("#searchDialog").dialog("close");
			//2、刷新数据
			$("#tt").datagrid("reload");
		}); 
		
		//js方法：序列化表单 			
		function serializeForm(form){
			var obj = {};
			$.each(form.serializeArray(),function(index){
				if(obj[this['name']]){
					obj[this['name']] = obj[this['name']] + ','+this['value'];
				} else {
					obj[this['name']] =this['value'];
				}
			});
			return obj;
		}
	});
</script>
</head>
<body>
	<table id="tt"></table>
	<div id="dialog" style="width: 400px; height: 300px;">
		<form method="post" id="myForm">
			<table cellpadding="0" cellspacing="0" width="100%" height="260px"
				align="center">
				<tr>
					<td align="center">员工编号：</td>
					<td>
						<input type="text" id="emp_id" name="emp_id"/>
					</td>
				</tr>
				<tr>
					<td align="center">分配角色：</td>
					<td>
						<input type="radio" id="role_id" name="role_id" value="1"/>普通员工<br/>
						<input type="radio" id="role_id" name="role_id" value="2"/>部门经理<br/>
						<input type="radio" id="role_id" name="role_id" value="3"/>分配人<br/>
						<input type="radio" id="role_id" name="role_id" value="4"/>处理人<br/>
						<input type="radio" id="role_id" name="role_id" value="5"/>管理员<br/>
						<input type="radio" id="role_id" name="role_id" value="6"/>老板
					</td>
				</tr>
				<tr align="center">
					<td colspan="2"><a class="easyui-linkbutton" id="ok">确定</a> 
					<a class="easyui-linkbutton" id="reset">重置</a></td>
				</tr>
			</table>
			<input type="hidden" name="employee">
		</form>
	</div>
	<div id="searchDialog" style="height: 150px;">
		<form method="post" id="searchForm">
			<br/>
			<br/>
			请输入您要搜索的员工姓名关键字：
			<input type="text" name="searchName"/>
			<a class="easyui-linkbutton" id="searchbtn">搜索</a>
		</form>
	</div>
</body>
</html>