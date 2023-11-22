<%@ page language="java" contentType="text/html; charset=EUC-KR" import="java.sql.*"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("cartlist");
	if(session.getAttribute("cartlist") != null){
		out.println("<script>alert('삭제 실패'); location.href='cart.jsp';</script>");
		return;
	}else{
		out.println("<script>alert('삭제 완료'); location.href='cart.jsp';</script>");
	}
%>
