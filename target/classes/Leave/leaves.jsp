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
<title>请假申请页面</title>
</head>
<body bgcolor="#F6F6F6">
	<div align="center">
		<div style="height: 60px; width: 70%; background-color: #0D4B7E">
			<div style="height: 1px; background-color: #6795B4"></div>
			<h2>请假申请页面</h2>
		</div>
		<div style="height: 420px; width: 70%; background-color: #FFFFFF">
			<form action="../Leave/addLeaves.action" method="post">
				<table id="ta" cellpadding="0" cellspacing="0" border="0" width="650px">
					<tr>
						<td colspan="2" align="center">请假时间:</td>
						<td colspan="5"><input type="text" name="beginDate"/>至
							<input type="text" name="endDate"/></td>
					</tr>
					<tr>
						<td colspan="2" align="center">请假天数:</td>
						<td colspan="5"><input type="text" name="days"/></td>
					</tr>
					<tr>
						<td colspan="2" align="center">请假类型:</td>
						<td width="80"><input type="radio" name="type" value="病假"/>病假</td>
						<td width="80"><input type="radio" name="type" value="事假"/>事假</td>
						<td width="80"><input type="radio" name="type" value="丧假"/>丧假</td>
						<td width="80"><input type="radio" name="type" value="婚假"/>婚假</td>
						<td width="80"><input type="radio" name="type" value="产假"/>产假</td>
					</tr>
					<tr>
						<td colspan="2" align="center">申请原因:</td>
						<td colspan="5"><textarea cols="50" rows="10" name="reason"></textarea></td>
					</tr>
					<tr align="center">
						<td colspan="4"></td>
						<td><input type="submit" value="提交"/></td>
							<td colspan="2" align="center"><input type="reset" value="重置"/></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>