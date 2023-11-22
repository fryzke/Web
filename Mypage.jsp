<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="db.db_connect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>My page</title>
<link rel="stylesheet" href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css"/>
<link href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap" rel="stylesheet">

<style>
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
	nav {
		width : 15%;
		height : 70%;
		float : left;
		background : grey;
		
	}
	.li {
		padding : 10px;
	}
	.a{
		color : white;
		text-decoration-line:none;
	}
	section {
		width : 70%;
		height : 70%;
		float : left;
		padding: 10px;
		
	}
	aside { width: 15%; height: 70%; float: left;}
    footer { width: 100%; height: 15%; clear: both;}
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
        #menu-bar{
       		margin:auto;
        	height : 30px;
        	width : 850px;
        }
        #menu-bar ul li {
        	list-style : none;
        	float : left;
        	line-height:30px;
        	vertical-align : middle;
        	text-align:center;
        	padding : 10px;
        }
        #menu-bar a {
        	color : black;
        	text-decoration : none;
        	display : block;
        	width : 150px;
        	font-size : 24px;
        }
        section > div {
        	font-size:30px;
        }
        table {
        	width : 70%;
			height : 70%;
        }
        tr{
        	border-bottom : 1px dotted grey;
        }
</style>
</head>
<body>
<%
		String id = null;
		if(session.getAttribute("id") != null){
			id = (String)session.getAttribute("id");
		}
		String link;
		if(id != null){
			link = "Mypage.jsp";
		}else{
			link = "log-in.jsp";
		}
		
		Connection connection = db_connect.getConnection();
		PreparedStatement pstmt = connection.prepareStatement("SELECT userid, points FROM account WHERE userid = ?");
		pstmt.setString(1, id);
		ResultSet rs;
		
		rs = pstmt.executeQuery();
		
	%>
    <header id="header" class="w-full z-30 top-0 py-1">
        <div class="w-full container mx-auto flex flex-wrap items-center justify-between mt-0 px-6 py-3">

            <label for="menu-toggle" class="cursor-pointer md:hidden block">
                <svg class="fill-current text-gray-900" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20">
                    <title>menu</title>
                    <path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z"></path>
                </svg>
            </label>
            <input class="hidden" type="checkbox" id="menu-toggle" />

            <div class="hidden md:flex md:items-center md:w-auto w-full order-3 md:order-1" id="menu">
                <div>
                    <ul class="md:flex items-center justify-between text-base text-gray-700 pt-4 md:pt-0">
                        <li><a class="inline-block no-underline hover:text-black hover:underline py-2 px-4" href="#">Shop</a></li>
                        <li><a class="inline-block no-underline hover:text-black hover:underline py-2 px-4" href="#">About</a></li>
                    </ul>
                </div>
            </div>

            <div class="order-1 md:order-2">
                <a class="flex items-center tracking-wide no-underline hover:no-underline font-bold text-gray-800 text-xl " href="main.jsp">
                    <svg class="fill-current text-gray-800 mr-2" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                        <path d="M5,22h14c1.103,0,2-0.897,2-2V9c0-0.553-0.447-1-1-1h-3V7c0-2.757-2.243-5-5-5S7,4.243,7,7v1H4C3.447,8,3,8.447,3,9v11 C3,21.103,3.897,22,5,22z M9,7c0-1.654,1.346-3,3-3s3,1.346,3,3v1H9V7z M5,10h2v2h2v-2h6v2h2v-2h2l0.002,10H5V10z" />
                    </svg>
                    NORDICS
                </a>
            </div>

            <div class="order-2 md:order-3 flex items-center" id="nav-content">
				<!-- 로그인/장바구니 -->
                <a class="inline-block no-underline hover:text-black" href=<%=link%>>
                    <svg class="fill-current hover:text-black" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                        <circle fill="none" cx="12" cy="7" r="3" />
                        <path d="M12 2C9.243 2 7 4.243 7 7s2.243 5 5 5 5-2.243 5-5S14.757 2 12 2zM12 10c-1.654 0-3-1.346-3-3s1.346-3 3-3 3 1.346 3 3S13.654 10 12 10zM21 21v-1c0-3.859-3.141-7-7-7h-4c-3.86 0-7 3.141-7 7v1h2v-1c0-2.757 2.243-5 5-5h4c2.757 0 5 2.243 5 5v1H21z" />
                    </svg>
                </a>

                <a class="pl-3 inline-block no-underline hover:text-black" href="cart.jsp">
                    <svg class="fill-current hover:text-black" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                        <path d="M21,7H7.462L5.91,3.586C5.748,3.229,5.392,3,5,3H2v2h2.356L9.09,15.414C9.252,15.771,9.608,16,10,16h8 c0.4,0,0.762-0.238,0.919-0.606l3-7c0.133-0.309,0.101-0.663-0.084-0.944C21.649,7.169,21.336,7,21,7z M17.341,14h-6.697L8.371,9 h11.112L17.341,14z" />
                        <circle cx="10.5" cy="18.5" r="1.5" />
                        <circle cx="17.5" cy="18.5" r="1.5" />
                    </svg>
                </a>
				 <% if(id != null){ %>
					<a href="logout.jsp">로그아웃</a>
				<%} %>
            </div>
        </div>
        <div id="menu-bar">
		<ul>
			<li><a href="itempage.jsp?category=toy">TOY</a></li>
			<li><a href="itempage.jsp?category=snack">SNACK</a></li>
			<li><a href="itempage.jsp?category=care">CARE</a></li>
			<li><a href="itempage.jsp?category=health">HEALTH</a></li>
			<li><a href="board.jsp">Q&A</a></li>
		</ul>
		</div>
    </header>
<nav id="nav">
	<ul>
		<li class="li"><a class="a" href="Mypage.jsp">회원 정보</a></li>
		<li class="li"><a class="a" href="cart.jsp">장바구니</a></li>
		<li class="li"><a class="a" href="withdraw.jsp">회원 탈퇴</a></li>
	</ul>
</nav>
<section>
<div><%=id %>님 환영합니다!</div>
<hr>
	<table>
		<tr><td>아이디</td><td><%=id %></td></tr>
		<%while(rs.next()){ %>
		<tr><td>적립금</td><td><%= rs.getInt(2) %></td></tr>
		<%
			}
			pstmt = connection.prepareStatement("SELECT count(customerid) FROM shipping_stat WHERE customerid= ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
		
		%>
		<tr><td>총 주문 횟수</td><td><%= rs.getInt(1) %></td></tr>
		<%} %>
	</table>
</section>
<aside></aside>
<footer></footer>
</body>
</html>