<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
	String id = null;
	if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
	}
	String link;
	if(id != null){
		if(id.equals("admin")){
			link = "adminpage.jsp";
		}else{
			link = "Mypage.jsp";
	}
	}else{
		link = "log-in.jsp";
	}
	Class.forName("org.postgresql.Driver");
    Connection connection = null;

    connection = DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/web_DB", "postgres", "admin");
   
	Statement st = connection.createStatement();
	ResultSet rs;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title></title>
<style>
	 .work-sans {
            font-family: 'Work Sans', sans-serif;
        }
                
        #menu-toggle:checked + #menu {
            display: block;
        }
        
        .hover\:grow {
            transition: all 0.3s;
            transform: scale(1);
        }
        
        .hover\:grow:hover {
            transform: scale(1.02);
        }
        
        .carousel-open:checked + .carousel-item {
            position: static;
            opacity: 100;
        }
        
        .carousel-item {
            -webkit-transition: opacity 0.6s ease-out;
            transition: opacity 0.6s ease-out;
        }
        
        #carousel-1:checked ~ .control-1,
        #carousel-2:checked ~ .control-2,
        #carousel-3:checked ~ .control-3 {
            display: block;
        }
        
        .carousel-indicators {
            list-style: none;
            margin: 0;
            padding: 0;
            position: absolute;
            bottom: 2%;
            left: 0;
            right: 0;
            text-align: center;
            z-index: 10;
        }
        
        #carousel-1:checked ~ .control-1 ~ .carousel-indicators li:nth-child(1) .carousel-bullet,
        #carousel-2:checked ~ .control-2 ~ .carousel-indicators li:nth-child(2) .carousel-bullet,
        #carousel-3:checked ~ .control-3 ~ .carousel-indicators li:nth-child(3) .carousel-bullet {
            color: #000;
            /*Set to match the Tailwind colour you want the active one to be */
        }
	html, body {
		margin : 0;
		padding : 0;
		height : 100%;
	}
	header { 
		width: 100%; 
		height: 15%;
		float : left;
	}
	#navi {
		width : 15%;
		height : 100%;
		float : left;
		background : grey;
		
	}
	section {
		width : 70%;
		height : 70%;
		margin:auto;
	}
	table {
		text-align : center;
	}
	.table-dark  td {
		vertical-align : middle;
		height:150px;
		font-size : 24px;
		
	}
	h3 {
		text-align : center;
		
	}
</style>
</head>
<body>
<header>
    <nav id="header" class="w-full z-30 top-0 py-1">
            <div class="order-1 md:order-2">
                <a class="flex items-center tracking-wide no-underline hover:no-underline font-bold text-gray-800 text-xl " href="main.jsp">

                    NORDICS
                </a>
            </div>

            <div class="order-2 md:order-3 flex items-center" id="nav-content">
				 <% if(id != null){ %>
					<a href="logout.jsp">로그아웃</a>
				<%} %>
            </div>
        </div>
    </nav>
	<h3>Admin page</h3>
</header>
<nav id="navi">
</nav>
<section>
	<table class="table table-dark">
		<%
			int sh_over = 0;
			int sh_ready = 0;
			int total = 0;
			rs = st.executeQuery("SELECT shipping_st FROM shipping_stat");
			while(rs.next()){
				if(rs.getInt(1) == 1){
					sh_over++;
				}else{
					sh_ready++;
				}
			}
			total = sh_over + sh_ready;
		%>
		<thead><tr><th>배송 완료</th><th>배송 준비</th><th>총 주문 건수</th></tr></thead>
		<tbody>
			<tr><td><%= sh_over%></td><td><%= sh_ready%></td><td><%= total%></td></tr>
		</tbody>
	</table>
	<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>아이디</th><th>비밀번호</th><th>이름</th><th>휴대폰 번호</th><th>포인트</th>
				</tr>
			</thead>
			<tbody>
				<%
					rs = st.executeQuery("SELECT * FROM account");
					while(rs.next()){
						if(rs.getString(1).equals("admin")){
							continue;
						}
				%>
					<tr><td><%= rs.getString(1)%></td><td><%= rs.getString(2)%></td><td><%= rs.getString(3)%></td><td><%= rs.getString(4)%></td><td><%= rs.getInt(7)%></td></tr>
				<% } %>
			</tbody>
	</table>
</section>
</body>
</html>
<%
	rs.close();
	st.close();
	connection.close();
%>