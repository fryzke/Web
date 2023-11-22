<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="db.db_connect" %>
<% request.setCharacterEncoding("utf-8");%>

<%
	String userID = request.getParameter("userID");
	String userPWD = request.getParameter("userPWD");
	String userName = request.getParameter("userName");
	String call = request.getParameter("call");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	
	 Connection connection = db_connect.getConnection();

	 String user_info = "insert into account values (?,?,?,?,?,?,?)";
	 PreparedStatement pstmt = connection.prepareStatement(user_info);
	 
	 pstmt.setString(1, userID);
	 pstmt.setString(2, userPWD);
	 pstmt.setString(3, userName);
	 pstmt.setString(4, call);
	 pstmt.setString(5, addr1);
	 pstmt.setString(6, addr2);
	 pstmt.setInt(7, 1000);
	 
	 int cnt = pstmt.executeUpdate();
	 if(cnt == 1){
		 out.println("<script>alert('성공적으로 가입 되었습니다. 다시 로그인해 주세요.');</script>)");
		 out.println("<script>location.href='log-in.jsp'</script>)");
		 
	 }else{
		 out.println("<script>alert('가입에 실패하였습니다 다시 입력해주세요.');</script>)");
		 out.println("<script>location.href='signUP.jsp'</script>)");
	 }
%>

