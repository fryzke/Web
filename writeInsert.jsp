<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="db.board_listing" %>
<%@page import="db.board_db" %>
<%@page import="db.db_connect" %>
<% request.setCharacterEncoding("utf-8"); %>

	<%
		String id = null;
		String title = request.getParameter("log_title");
		String content = request.getParameter("log_content");
		
		if(session.getAttribute("id") != null){
			id = (String)session.getAttribute("id");
		}
		
		
		if(title == null || content == null){
			out.println("<script>alert('모든 항목을 입력해주세요.');");
			out.println("history.back()</script>");
		}else{
			board_listing board_list = new board_listing();
			int rs = board_list.write(title, id, content);
			if(rs == -1){
				out.println("<script>alert('작성 실패. 다시 작성해주십시오.');");
				out.println("history.back()</script>");
			}else{
				out.println("<script>alert('작성 완료.');");
				out.println("location.href='board.jsp'</script>");
			}
		}
	%>