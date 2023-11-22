<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db.db_connect" %>
<%@page import="db.item_listing" %>
<%@page import="db.item_db" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css"/>
<link href="https://fonts.googleapis.com/css?family=Work+Sans:200,400&display=swap" rel="stylesheet">
<style>
	header { 
		width: 100%; 
		height: 15%;
		float : left;
	}
	section {
		width : 70%;
		height : 70%;
		margin:auto;
	}
	#div {
		text-align : left;
		font-size : 36px;
		color : black;
	}
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
		#p_input {
			background-color : #F8F8F8;
			padding : 10px;
		}
	
</style>
<title>문의 게시판</title>

</head>
<body class="bg-white text-gray-600 work-sans leading-normal text-base tracking-normal">
	<%
		String id = null;
		if(session.getAttribute("id") != null){
			id = (String)session.getAttribute("id");
		}
		String link = "Mypage.jsp";
		if(id != null){
			if(id.equals("admin")){
				link = "adminpage.jsp";
			}else{
				link = "Mypage.jsp";
			}
		}else{
			out.println("<script>alert('로그인 후 사용 가능합니다.');");
			out.println("location.href='log-in.jsp'</script>");
		}
			item_listing item_list = new item_listing();
			ArrayList<item_db> list = new ArrayList<item_db>();
			long total = 0;
			int pt = 0;	
		
			Connection connection = db_connect.getConnection();
			String sql = "SELECT points FROM account WHERE userid = ?";
			ResultSet rs;
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				pt = rs.getInt(1);
			}
			if(session.getAttribute("cartlist") != null) {
				list = (ArrayList<item_db>)session.getAttribute("cartlist");
			}
		%>
<header>
 <nav id="header" class="w-full z-30 top-0 py-1">
        <div class="w-full container mx-auto flex flex-wrap items-center justify-between mt-0 px-6 py-3">

            <label for="menu-toggle" class="cursor-pointer md:hidden block">
                <svg class="fill-current text-gray-900" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20">
                    <title>menu</title>
                    <path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z"></path>
                </svg>
            </label>
            <input class="hidden" type="checkbox" id="menu-toggle" />

            <div class="hidden md:flex md:items-center md:w-auto w-full order-3 md:order-1" id="menu">
                <nav>
                    <ul class="md:flex items-center justify-between text-base text-gray-700 pt-4 md:pt-0">
                        <li><a class="inline-block no-underline hover:text-black hover:underline py-2 px-4" href="#">Shop</a></li>
                        <li><a class="inline-block no-underline hover:text-black hover:underline py-2 px-4" href="#">About</a></li>
                    </ul>
                </nav>
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
    </nav>
</header>
<section>
	<div id="div">장바구니</div>
	<form method="post" action="/IP_pro/purchasing">
	<table class="table">
		<thead class="thead-dark">
			<tr><th>상품명</th><th>수량</th><th>가격</th></tr>
		</thead>
		<tbody>
		
		<% for(int i=0; i<list.size(); i++){ %>
		<tr>
				<td><%= list.get(i).getItemname()%></td>
				<td><input type="text" name="itemstock" value=<%= list.get(i).getStock() %> readonly/></td>
				<td><input type="text" name="itemprice" value=<%= list.get(i).getPrice()*list.get(i).getStock() %> disabled></td>
		</tr>
		<%
			total += list.get(i).getPrice()*list.get(i).getStock();
			}
		%>
		</tbody>
	</table>
	<div>
		포인트 사용 | 보유 포인트 <%= pt %> <input id="p_input" type="text" name="points" value="0">
	</div>
	<div>
		<button class="btn btn-primary" type="button" onclick="use_point()">사용하기</button>
		<button class="btn btn-primary" type="button" onclick="p_back()">되돌리기</button>
		<br><br>
		총 금액 
		<div id="parent"><%= total %></div>
		<input class="btn btn-primary" type="submit" value="구매하기">
		<button class="btn btn-primary" type="button" onclick="deleteAll()">장바구니 삭제</button>
	</div>
	</form>
	<script>
		function use_point(){
			let parent = document.getElementById("parent");
			let p = parseInt(document.getElementById("p_input").value);
			let total_m = <%= total%>;
			let user_points = <%= pt%>;
			
			total_m = total_m - p;
			parent.innerHTML = total_m;
		}
		function p_back(){
			let parent = document.getElementById("parent");
			parent.innerHTML = <%=total%>;
		}
		function deleteAll(){
			location.href="delete_cart.jsp";
			
		}
	</script>
</section>
    <footer class="container mx-auto bg-white py-8 border-t border-gray-400">
        <div class="container flex px-3 py-8 ">
            <div class="w-full mx-auto flex flex-wrap">
                <div class="flex w-full lg:w-1/2 ">
                    <div class="px-3 md:px-0">
                        <h3 class="font-bold text-gray-900">About</h3>
                        <p class="py-4">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas vel mi ut felis tempus commodo nec id erat. Suspendisse consectetur dapibus velit ut lacinia.
                        </p>
                    </div>
                </div>
                <div class="flex w-full lg:w-1/2 lg:justify-end lg:text-right">
                    <div class="px-3 md:px-0">
                        <h3 class="font-bold text-gray-900">Social</h3>
                        <ul class="list-reset items-center pt-3">
                            <li>
                                <a class="inline-block no-underline hover:text-black hover:underline py-1" href="#">Add social links</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>