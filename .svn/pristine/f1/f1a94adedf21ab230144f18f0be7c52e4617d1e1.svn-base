<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<STYLE type=text/css>
* {
	FONT-SIZE: 12px;
	COLOR: 
}

#logo {
	COLOR: white
}

#logo A {
	COLOR: white
}

FORM {
	MARGIN: 0px
}
</STYLE>
<SCRIPT src="Top.files/Clock.js" type=text/javascript></SCRIPT>
<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
<link rel="stylesheet" type="text/css"
	href="../js/jquery-easyui-1.4.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="../js/jquery-easyui-1.4.3/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="../js/jquery-easyui-1.4.3/demo/demo.css">
<script type="text/javascript"
	src="../js/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript"
	src="../js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<title>申请单管理系统</title>
<script type="text/javascript">
	$(function() {
		$("#help").linkbutton({
			plain : true
		});
		$("#cancel").linkbutton({
			plain : true
		});
		$("a[title]")
				.click(
						function() {
							var title = $(this).html();
							var url = $(this).attr("title");
							if ($("#tt").tabs("exists", title)) {
								$("#tt").tabs("select", title);
							} else {
								$("#tt")
										.tabs(
												'add',
												{
													title : title,
													content : '<iframe src="'
															+ url
															+ '"style="width:100%;height:100%;"></iframe>',
													closable : true
												});
							}
						});
	});
</script>
</head>
<body class="easyui-layout"
	style="BACKGROUND-IMAGE: url(images/bg.gif); MARGIN: 0px; BACKGROUND-REPEAT: repeat-x">
	<div region="north" style="background-color: #1F385C; height: 123px">
		<form id="form1">
			<div id=logo
				style="BACKGROUND-IMAGE: url(images/logo.png); BACKGROUND-REPEAT: no-repeat">
				<DIV
					style="PADDING-RIGHT: 50px; BACKGROUND-POSITION: right 50%; DISPLAY: block; PADDING-LEFT: 0px; BACKGROUND-IMAGE: url(images/bg_banner_menu.gif); PADDING-BOTTOM: 0px; PADDING-TOP: 3px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 30px; TEXT-ALIGN: right">
					<IMG src="Top.files/user_suit.png" align=absMiddle border=0>欢迎用户:${employee.empName}
					<A id=HyperLink1 href="http://localhost:1479/Web/sys/Top.aspx#"></A>
					<IMG src="Top.files/menu_seprator.gif" align=absMiddle>
					<A id="HyperLink2" href="index.jsp">返回首页</A>
					<IMG src="Top.files/menu_seprator.gif" align=absMiddle> 
					<A id=HyperLink3 href="../Employee/logout.action">退出系统</A>
				</DIV>
				<DIV style="DISPLAY: block; HEIGHT: 54px"></DIV>
				<DIV
					style="BACKGROUND-IMAGE: url(images/bg_nav.gif); BACKGROUND-REPEAT: repeat-x; HEIGHT: 30px">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD align=right width="70%"><SPAN
									style="PADDING-RIGHT: 50px"><A
										href="javascript:history.go(-1);"><IMG
											src="Top.files/nav_back.gif" align=absMiddle border=0>后退</A>
										<A href="javascript:history.go(1);"><IMG
											src="Top.files/nav_forward.gif" align=absMiddle border=0>前进</A>
										<A href="http://localhost:1479/Web/sys/updatePwd.aspx"
										target=mainFrame><IMG
											src="Top.files/nav_resetPassword.gif" align=absMiddle
											border=0>修改密码</A> <A
										href="http://localhost:1479/Web/sys/Top.aspx#"
										target=mainFrame><IMG src="Top.files/nav_help.gif"
											align=absMiddle border=0>帮助</A> <IMG
										src="Top.files/menu_seprator.gif" align=absMiddle> <SPAN
										id=clock></SPAN> </SPAN>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</DIV>
			</DIV>
			<SCRIPT type=text/javascript>
				var clock = new Clock();
				clock.display(document.getElementById("clock"));
			</SCRIPT>
		</form>
	</div>
	<div region="west" split="true" title="功能菜单" style="width: 150px;">
		<div id="aa" class="easyui-accordion"
			style="width: 300px; height: 200px;" fit=true>
			<!-- 创建申请 -->
			<%
				if(session.getAttribute("menu_id00")!=null){
			%>
				<div title="申请管理" iconCls="icon-save"
					style="overflow: auto; padding: 10px;" selected="true">
					<a title="../IP/IP.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-edit">IP地址申请</a><br/> 
					<a title="../Email/email.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-edit">办公邮箱申请</a><br />
					<a title="../Memory/memory.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-edit">存储空间申请</a><br/> 
					<a title="../Teleconference/teleconference.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-edit">电话会议申请</a><br />
					<a title="../Leave/leaves.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-edit">请假申请</a><br/>
				</div>
			<%		
				}else{
			%>
				<div></div>
			<%
				}
			%>
			
			<!-- 申请查询 -->
			<%
				if(session.getAttribute("menu_id01")!=null){
			%>
				<div title="申请查询" iconCls="icon-reload" style="padding: 10px;">
					<a title="../IP/ipList.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-search">IP地址</a><br />
					<a title="../Email/emailList.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-search">办公邮箱</a><br />
					<a title="../Memory/memoryList.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-search">存储空间</a><br />
					<a title="../Teleconference/teleconferenceList.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-search">电话会议</a><br />
					<a title="../Leave/leaveList.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-search">请假</a><br />
				</div>
			<%		
				}else{
			%>
				<div></div>
			<%
				}
			%>
			
			<!-- 审批查询 -->
			<%
				if(session.getAttribute("menu_id02")!=null){
			%>
				<div title="审批查询" iconCls="icon-reload" style="padding: 10px;">
					<a title="../IP/approvalIP.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-search">IP地址单审批</a><br />
					<a title="../Email/approvalEmail.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-search">办公邮箱单审批</a><br />
					<a title="../Memory/approvalMemory.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-search">存储空间单审批</a><br />
					<a title="../Teleconference/approvalTeleconference.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-search">电话会议单审批</a><br />
					<a title="../Leave/approvalLeave.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-search">请假单审批</a><br />
				</div>
			<%		
				}else{
			%>
				<div></div>
			<%
				}
			%>
			
			<!-- 分配查询 -->
			<%
				if(session.getAttribute("menu_id03")!=null){
			%>
				<div title="分配查询" iconCls="icon-reload" style="padding: 10px;">
					<a title="../IP/assignIP.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-search">IP地址单分配</a><br />
					<a title="../Email/assignEmail.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-search">办公邮箱单分配</a><br />
					<a title="../Memory/assignMemory.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-search">存储空间单分配</a><br />
					<a title="../Teleconference/assignTeleconference.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-search">电话会议单分配</a><br />
				</div>
			<%		
				}else{
			%>
				<div></div>
			<%
				}
			%>
			
			<!-- 处理查询 -->
			<%
				if(session.getAttribute("menu_id04")!=null){
			%>
				<div title="处理查询" iconCls="icon-reload" style="padding: 10px;">
					<a title="../IP/processIP.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-search">IP地址单处理</a><br />
					<a title="../Email/processEmail.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-search">办公邮箱单处理</a><br />
					<a title="../Memory/processMemory.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-search">存储空间单处理</a><br />
					<a title="../Teleconference/processTeleconference.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-search">电话会议单处理</a><br />
				</div>
			<%		
				}else{
			%>
				<div></div>
			<%
				}
			%>
			
			<!-- 个人设置 -->
			<%
				if(session.getAttribute("menu_id05")!=null){
			%>
				<div title="个人设置" iconCls="icon-save"
					style="overflow: auto; padding: 10px;">
					<a title="Employee.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-edit">个人信息修改</a><br/>
				</div>
			<%		
				}else{
			%>
				<div></div>
			<%
				}
			%>
			
			<!-- 管理员专用 -->
			<%
				if(session.getAttribute("menu_id06")!=null){
			%>
				<div title="管理" iconCls="icon-save"
					style="overflow: auto; padding: 10px;">
					<a title="../Deptment/deptmentsList.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-edit">部门管理</a><br/>
					<a title="../Employee/employeesList.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-edit">员工管理</a><br/>
					<a title="../privilege/showPrivilege.jsp" class="easyui-linkbutton" plain="true" iconCls="icon-edit">权限管理</a><br/>
				</div>
			<%		
				}else{
			%>
				<div></div>
			<%
				}
			%>
			
		</div>
	</div>
	<div region="center">
		<div id="tt" class="easyui-tabs" style="width: 500px; height: 250px;"
			fit=true>
			<div title="首页" style="padding: 20px;"></div>
		</div>
	</div>
</body>
</html>