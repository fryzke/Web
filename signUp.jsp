<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	*{
    	padding: 0;
    	margin: 0;
    	border: none;
	}
	body{
    	font-size: 14px;
    	font-family: 'Roboto', sans-serif;
    	text-align:center;
	}.signUp-box{
		margin:auto;
    	width: 400px;
    	height: 350px;
    	padding: 40px;
    	box-sizing: border-box;
	}

	.signUp-box > h2{
    	font-size: 24px;
    	color: #6A24FE;
    	margin-bottom: 20px;
	}
	#signUp-form > input{
    	width: 100%;
    	height: 48px;
    	padding: 0 10px;
    	box-sizing: border-box;
    	margin-bottom: 16px;
    	border-radius: 6px;
    	background-color: #F8F8F8;
	}
	#signUp-form > input::placeholder{
    	color: #D2D2D2;
	}
	#signUp-form > input[type="submit"]{
    	color: #fff;
    	font-size: 16px;
    	background-color: #6A24FE;
    	margin-top: 20px;
	}
	p{
		font-size:5px;
	}
</style>
</head>
<body>
<div class="signUp-box">
	<h2>회원 가입</h2>
	<form method="post" id="signUp-form" action="InsertDB.jsp">
		<input type="text" name="userID" placeholder="ID">
		<input type="password" name="userPWD" placeholder="password">
		<input type="text" name="userName" placeholder="name">
		<input type="text" name="call" placeholder="010-xxxx-xxxx">
		<input type="text" name="addr1" placeholder="우편번호">
		<input type="text" name="addr2" placeholder="주소">
		<input type="submit" value="가입하기">
	</form>
</div>

</body>
</html>