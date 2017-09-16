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
<title>IP地址申请页面</title>
</head>
<body bgcolor="#F6F6F6">
	<div align="center">
		<div style="height: 60px; width: 70%; background-color: #0D4B7E">
			<div style="height: 1px; background-color: #6795B4"></div>
			<h2>ip地址申请页面</h2>
		</div>
		<div style="height: 350px; width: 70%; background-color: #FFFFFF">
			<form action="../IP/addIP.action" method="post">
				<table id="ta"  cellpadding="0" cellspacing="0" border="0" width="800px">
					<tr>
						<td>申请数量:</td>
						<td><input type="text" name="number" />
						</td>
						<td>使用地点:</td>
						<td><input type="text" name="place" />
						</td>
					</tr>
					<tr>
						<td>网口号码:</td>
						<td><input type="text" name="IF_num" />
						</td>
						<td>使用时间:</td>
						<td><input type="text" name="useDay" />
						</td>
					</tr>
					<tr>
						<td>申请原因:</td>
						<td colspan="3"><textarea name="reason" cols="68" rows="8"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2"></td>
						<td align="center"><input type="submit" value="提交"></td>
						<td align="left"><input type="reset" value="重置"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>