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
<title>公司邮箱申请页面</title>
</head>
<body bgcolor="#F6F6F6">
	<div align="center">
		<div style="height: 60px; width: 70%; background-color: #0D4B7E">
			<div style="height: 1px; background-color: #6795B4"></div>
			<h2>email申请页面</h2>
		</div>
		<div style="height: 350px; width: 70%; background-color: #FFFFFF">
			<form action="../Email/addEmail.action" method="post">
				<table id="ta" cellpadding="0" cellspacing="0" border="0" width="650px">
					<tr>
						<td>所需类型:</td>
						<td><input type="radio" name="type" value="新增"/>新增
							<input type="radio" name="type" value="更改"/>更改</td>
					</tr>
					<tr>
						<td>使用期限:</td>
						<td><input type="text" name="beginDate"/>至
							<input type="text" name="endDate"/></td>
					</tr>
					<tr>
						<td>申请原因:</td>
						<td><textarea cols="50" rows="10" name="reason"></textarea></td>
					</tr>
					<tr align="center">
						<td></td>
						<td ><input type="submit" value="提交"/>
							<input type="reset" value="重置"/></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>