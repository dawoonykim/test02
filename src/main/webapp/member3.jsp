<%@page import="pkg1.*, java.util.*, java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="pkg1.MemberVO" scope="page"></jsp:useBean>
<jsp:setProperty property="id" name="vo" value='<%=request.getParameter("id") %>'/>
<jsp:setProperty property="pwd" name="vo" value='<%=request.getParameter("pwd") %>'/>
<jsp:setProperty property="name" name="vo" value='<%=request.getParameter("name") %>'/>
<jsp:setProperty property="email" name="vo" value='<%=request.getParameter("email") %>'/>

<%
MemberDAO dao = new MemberDAO();
String command = request.getParameter("command");

/* String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String email = request.getParameter("email");
vo.setId(id);
vo.setPwd(pwd);
vo.setName(name);
vo.setEmail(email);*/
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
			<td width="7%">아이디3</td>
			<td width="7%">비밀번호3</td>
			<td width="5%">이름3</td>
			<td width="11%">이메일3</td>
			<td width="5%">가입일3</td>
			<td width="5%">삭제3</td>
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