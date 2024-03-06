<%@page import="pkg1.*, java.util.*, java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
MemberDAO dao = new MemberDAO();
String command = request.getParameter("command");

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String email = request.getParameter("email");
MemberVO vo = new MemberVO(id, pwd, name, email);
dao.addMember(vo);

if (command != null && command.equals("delMember")) {
	String delid = request.getParameter("id");
	dao.delMember(delid);
	
}
dao = new MemberDAO();
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
			<td width="7%">아이디</td>
			<td width="7%">비밀번호</td>
			<td width="5%">이름</td>
			<td width="11%">이메일</td>
			<td width="5%">가입일</td>
			<td width="5%">삭제</td>
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
			<td><%=voget.getId()%></td>
			<td><%=voget.getPwd()%></td>
			<td><%=voget.getName()%></td>
			<td><%=voget.getEmail()%></td>
			<td><%=voget.getJoinDate()%></td>
			<td><a href="/test02/member.jsp?command=delMember&id=<%=voget.getId()%>">삭제</a></td>
		</tr>
		<%
		}
		}
		%>
	</table>
</body>
</html>