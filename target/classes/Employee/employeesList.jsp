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
		    url:'queryEmployee.action',
		    saveUrl: 'addEmployee.action',
		    updateUrl: 'updateEmployee.action',
		    destroyUrl: 'deleteEmployees.action',
			autoSave:true,
		    idField:'emp_Id',
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
	//手机号码验证
	/* $.extend($.fn.validatebox.defaults.rules, {
		mobile: {// 验证手机号码
            validator: function (value) {
                return /^(13|15|18)\d{9}$/i.test(value);
            },
            message: '手机号码格式不正确'
        }
	}); */
});
	
</script>
</head>
<body> 
	<table id="tt" singleSelect="true">   
	    <thead>   
	        <tr>
	            <th field="emp_Id" width="100">员工编号</th>
			    <th field="dept_Id" width="100" editor="{type:'validatebox',options:{required:true}}">部门编号</th>
			    <th field="empName" width="100" editor="{type:'validatebox',options:{required:true}}">员工姓名</th>
			    <th field="password" width="100" align="right" editor="{type:'validatebox',options:{required:true,validType:'length[1,3]'}}">密码</th>
			    <th field="sex" width="100" editor="{type:'combobox',options:{valueField: 'label',
																			  textField: 'value',
																			  data: [{
																				  label: '男',
																				  value: '男'
																			  },{
																				  label: '女',
																				  value: '女'
																			  }]}}">性别</th>
			    <th field="birthday" width="100" editor="{type:'datetimebox',options:{required:true}}">生日</th>
			    <th field="createTime" width="100" align="right" editor="{type:'datetimebox',options:{required:true}}">入职时间</th>
			    <th field="cellphone" width="100" align="right" editor="{type:'validatebox',options:{required:true,validType:'mobile'}}">手机</th>
			    <th field="empContent" width="100" editor="text">备注</th> 
	        </tr>   
	    </thead>   
	</table> 
	<a title="#" href="exportExcel.action" class="easyui-linkbutton" plain="true" iconCls="icon-edit">导出员工excel文件</a>
</body>
</html>