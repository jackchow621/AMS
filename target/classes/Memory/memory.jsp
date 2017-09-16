<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<STYLE type=text/css>
#ta tr{
	FONT-SIZE: 15px;
	height: 50px;
	COLOR: 
}
</STYLE>
<title>存储空间申请单</title>
</head>
<body bgcolor="#F6F6F6">
	<div align="center">
		<div style="height: 60px; width: 70%; background-color: #0D4B7E">
			<div style="height: 1px; background-color: #6795B4"></div>
			<h2>请假申请页面</h2>
		</div>
		<div style="height: 400px; width: 70%; background-color: #FFFFFF">
			<form action="../Memory/addMemory.action" method="post">
				<table id="ta" cellpadding="0" cellspacing="2" border="0" width="650px">
					<tr>
						<td>部门端口号:</td>
						<td align="center"><input type="text" name="dept_port"/></td>
						<td>所需空间:</td>
						<td><input type="text" name="space"/></td>
					</tr>
					<tr>
						<td>使用期限:</td>
						<td colspan="3"><input type="text" name="beginDate"/>至
							<input type="text" name="endDate"/></td>
					</tr>
					<tr>
						<td>申请原因:</td>
						<td colspan="3"><textarea cols="60" rows="5" name="reason"></textarea></td>
					</tr>
					<tr>
						<td>目标访问权限:</td>
						<td colspan="3"><textarea cols="60" rows="5" name="authority"></textarea></td>
					</tr>
					<tr>
						<td>特殊需求:</td>
						<td colspan="3"><textarea cols="60" rows="5" name="requirement"></textarea></td>
					</tr>
					<tr align="center">
					<td colspan="2"></td>
						<td><input type="submit" value="提交"/></td>
						<td align="center"><input type="reset" value="重置"/></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>