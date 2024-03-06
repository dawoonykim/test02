<%@page import="pkg1.*, java.util.*, java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="pkg1.MemberVO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="vo" />

<%
MemberDAO dao = new MemberDAO();
String command = request.getParameter("command");

if (command != null && command.equals("delMember")) {
	String delid = request.getParameter("id");
	dao.delMember(delid);
}
List memberList = (ArrayList) dao.listMembers();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록창</title>
</head>
<body>
	<table align="center" width="100%">
		<tr align="center" bgcolor="#99ccff">
			<td width="7%">아이디7</td>
			<td width="7%">비밀번호7</td>
			<td width="5%">이름7</td>
			<td width="11%">이메일7</td>
			<td width="5%">가입일7</td>
			<td width="5%">삭제7</td>
		</tr>
		<%
		if (memberList.size() == 0) {
		%>
		<tr>
			<td colspan="5"><p align="center">
					<b><span style="font-size: 9pt">등록된 회원이 없습니다.</span></b></td>
		</tr>
		<%
		} else {
		for (int i = 0; i < memberList.size(); i++) {
			MemberVO voget = (MemberVO) memberList.get(i);
		%>
		<tr align="center">
			<td><jsp:getProperty property="id" name="vo" /></td>
			<td><jsp:getProperty property="pwd" name="vo" /></td>
			<td><jsp:getProperty property="name" name="vo" /></td>
			<td><jsp:getProperty property="email" name="vo" /></td>
			<td><%=voget.getJoinDate()%></td>
			<td><a
				href="/test02/member.jsp?command=delMember&id=<%=voget.getId()%>">삭제</a></td>
		</tr>

		<%
		}
		}
		%>
	</table>
	<a href="/test02/mform.html">회원가입</a>

</body>
</html>