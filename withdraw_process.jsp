<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db.db_connect" %>
<%
	String u_id = request.getParameter("userID");
	
	String sql = "DELETE FROM account WHERE userid = ?";
    Connection connection = null;

    connection = db_connect.getConnection();
   
	PreparedStatement pstmt = connection.prepareStatement(sql);
	pstmt.setString(1, u_id);
	 
	int count = pstmt.executeUpdate();
	 
	if(count == 1){
		session.invalidate();
		out.println("<script> alert('회원탈퇴 성공!'); location.href='main.jsp'; </script>");
	}else{
		out.println("<script> alert('회원탈퇴 실패!'); location.href='Mypage.jsp';</script>");
	}
	 
	pstmt.close();
	connection.close();
%>