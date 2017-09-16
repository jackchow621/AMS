<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>无标题页</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK 
href="images/public.css" type=text/css rel=stylesheet>
<LINK 
href="images/login.css" type=text/css rel=stylesheet>
<STYLE type=text/css>
</STYLE>
<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
<BODY>
<DIV id=div1>
	<FORM name=Login action="login.action" 
	method=post target=_parent>
	  <TABLE id=login height="100%" cellSpacing=0 cellPadding=0 width=800 
		align=center>
	    <TBODY>
	      <TR id=main height="591">
	        <TD>
	          <TABLE height="480" cellSpacing=0 cellPadding=0 width="750px">
	            <TBODY>
	              <TR>
	                <TD colSpan=4>&nbsp;</TD>
	              </TR>
	              <TR height=30>
	                <TD width=380>&nbsp;</TD>
	                <TD>&nbsp;</TD>
	                <TD>&nbsp;</TD>
	                <TD>&nbsp;</TD>
	              </TR>
	              <TR height=40>
	                <TD rowSpan=4>&nbsp;</TD>
	                <TD>用户名：</TD>
	                <TD>
	                  <INPUT class=textbox id=emp_Id name=emp_Id>
	                </TD>
	                <TD width=120>&nbsp;</TD>
	              </TR>
	              <TR height=40>
	                <TD>密　码：</TD>
	                <TD>
	                  <INPUT class=textbox id=password type=password 
	            name=password>
	                </TD>
	                <TD width=120>&nbsp;</TD>
	              </TR>
	              <TR height=40>
	                <TD>验证码：</TD>
	                <TD vAlign=center colSpan=2>
	                  <INPUT id=txtSN size=4 name=txtSN>
	                  &nbsp; <IMG src="image.jsp" border=0> <A id=LinkButton1 
	            href="RandServlet">不清楚，再来一张</A></TD>
	              </TR>
	              <TR height=40>
	                <TD></TD>
	                <TD align=right>
	                  <INPUT id=btnLogin type=submit value=" 登 录 " name=btnLogin>
	                </TD>
	                <TD width=120>&nbsp;</TD>
	              </TR>
	              <TR height=150>
	                <TD colSpan=4>&nbsp;</TD>
	              </TR>
	            </TBODY>
	          </TABLE>
	        </TD>
	      </TR>
	      <TR id=root height=104>
	        <TD>&nbsp;</TD>
	      </TR>
	    </TBODY>
	  </TABLE>
	</FORM>
</DIV>
<DIV id=div2 style="DISPLAY: none"></DIV>
</CONTENTTEMPLATE>
</BODY>
</HTML>
