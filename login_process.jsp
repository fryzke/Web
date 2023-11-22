<%@ page language="java" contentType="text/html; charset=EUC-KR" import="java.sql.*"
    pageEncoding="UTF-8"%>
<%@ page import="db.db_connect" %>
<%
	Connection connection = db_connect.getConnection();
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	PreparedStatement pstmt = connection.prepareStatement("SELECT userid, userpwd FROM account WHERE userid = ?");
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		if(pwd.equals(rs.getString("userPWD"))){
			session.setAttribute("id", rs.getString("userID"));
			pageContext.forward("main.jsp");
		}
	}else{
		out.println("<script> alert('아이디 또는 비밀번호가 올바르지 않습니다.'); location.href='log-in.jsp'</script>");
	}
%>
<% 
rs.close();
pstmt.close();
connection.close();
%>