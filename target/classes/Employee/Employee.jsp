<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<STYLE type=text/css>
#ta tr {
	FONT-SIZE: 15px;
	height: 50px;
	COLOR: 
}
</STYLE>
<title>个人信息</title>
</head>
<body bgcolor="#F6F6F6">
	<div align="center">
		<div style="height: 60px; width: 70%; background-color: #0D4B7E">
			<div style="height: 1px; background-color: #6795B4"></div>
			<h2>个人信息修改</h2>
		</div>
		<div style="height: 350px; width: 70%; background-color: #FFFFFF">
			<form action="updateEmployeeInfo.action" method="post">
				<table id="ta" cellpadding="0" cellspacing="0" border="0"
					width="800px">
					<tr>
						<td>部门编号</td>
						<td><input type="text" name="dept_Id" disabled="disabled"
							value="${employee.dept_Id }" /></td>
						<td>员工姓名</td>
						<td><input type="text" name="empName"
							value="${employee.empName }" />
						</td>
					</tr>
					<tr>
						
						<td>性别</td>
						<td><c:choose>
								<c:when test="${employee.sex=='男'}">
									<input type="radio" id="sex" name="sex" checked="checked"
										value="男" />男
										<input type="radio" id="sex" name="sex" value="女" />女
									</c:when>
								<c:when test="${employee.sex=='女'}">
									<input type="radio" id="sex" name="sex" value="男" />男
										<input type="radio" id="sex" name="sex" checked="checked"
										value="女" />女
									</c:when>
							</c:choose></td>
						<td>手机号码</td>
						<td colspan="3"><input name="cellphone" cols="68" rows="8" value="${employee.cellphone }" /></td>
					</tr>
					<tr>
						<td colspan="2"></td>
						<td align="center"><input type="submit" value="提交">
						</td>
						<td align="left"><input type="reset" value="重置">
						</td>
					</tr>
				</table>
				<input type="hidden" id="emp_Id" name="emp_Id" value="${employee.emp_Id}"/>
			</form>
		</div>
	</div>
</body>
</html>