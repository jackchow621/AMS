<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<STYLE type=text/css>
#ta tr {
	FONT-SIZE: 18px;
	height: 30px;
	COLOR: 
}
</STYLE>
<script type="text/javascript" src="../js/jquery-easyui-1.4.3/jquery.min.js"></script>
<link rel="stylesheet" href="../js/jquery-easyui-1.4.3/themes/default/easyui.css" type="text/css">
<link rel="stylesheet" href="../js/jquery-easyui-1.4.3/themes/icon.css" type="text/css">
<script type="text/javascript" src="../js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../js/jquery-easyui-1.4.3/jquery.edatagrid.js"></script>
<link rel="stylesheet" href="../css/common.css" type="text/css">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
		//左边表格
		$('#tt').edatagrid({   
		    url:'queryDeptment.action',
		    saveUrl: 'addDeptment.action',
		    updateUrl: 'updateDeptment.action',
		    destroyUrl: 'deleteDeptments.action',
			autoSave:true,
		    idField:'dept_Id',
		    fitColumns:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    striped:true,
		    pageList:[5,10,15,20],
		    toolbar:[
		             {
		            	 text:"增加",
		            	 iconCls:"icon-add",
		            	 handler:function(){
		            		 $('#tt').edatagrid('addRow');
		            	 }
			            
		              },
		             {
		            	 text:"删除",
		            	 iconCls:"icon-remove",
		            	 handler:function(){
		            		 $('#tt').edatagrid('destroyRow');
		            	 }
		             },
		              {
		            	 text:"保存修改",
		            	 iconCls:"icon-save",
		            	 handler:function(){
		            		 $('#tt').edatagrid('saveRow');
		            		 $('#tt').datagrid('reload');
		            	 }
			            }
		            ]
	});
});
	
</script>
</head>
<body> 

		<table id="tt" style="width:auto;height:auto" singleSelect="true" fit=true>   
		    <thead>   
		        <tr>
				    <th field="deptName" width="100" editor="{type:'validatebox',options:{required:true}}">部门名称</th>
		        </tr>   
		    </thead>   
		</table>  
</body>
</html>