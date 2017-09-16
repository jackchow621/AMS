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
<title>公司电话会议申请页面</title>
</head>
<body bgcolor="#F6F6F6">
<div align="center">
	<div style="height: 60px; width: 70%; background-color: #0D4B7E">
		<div style="height: 1px; background-color: #6795B4"></div>
		<h2>电话会议申请页面</h2>
	</div>
		<div style="height: 400px; width: 70%; background-color: #FFFFFF">
			<form action="../Teleconference/addTeleconference.action" method="post">
				<table id="ta" cellpadding="0" cellspacing="0" border="0" width="650px">
					<tr>
						<td>开会日期:</td>
						<td><input type="text" name="meetDate"/></td>
						<td>使用地点:</td>
						<td align="left"><input type="text" name="room"/></td>
					</tr>
					<tr>
						<td>开会时间:</td>
						<td colspan="3" align="left"><input type="text" name="beginDate"/>至
							<input type="text" name="endDate"/></td>
					</tr>
					<tr>
						<td>开会方数:</td>
						<td><input type="text" name="conventioner"/></td>
						<td>是否提供会议设备:</td>
						<td><input type="radio" name="isDevice" value="是"/>是
							<input type="radio" name="isDevice" value="否"/>否</td>
					</tr>
					<tr>
						<td>联系号码:</td>
						<td><input type="text" name="telephone"/></td>
					</tr>
					<tr>
						<td>特殊需求:</td>
						<td colspan="3"><textarea cols="58" rows="10" name="requirement"></textarea></td>
					</tr>
					<tr>
					<td colspan="2"></td>
						<td align="left"><input type="submit" value="提交"/></td>
							<td align="left"><input type="reset" value="重置"/></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>