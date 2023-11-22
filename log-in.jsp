<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	}
	.loginbox{
		margin:auto;
    	width: 400px;
    	height: 350px;
    	padding: 40px;
    	box-sizing: border-box;
	}

	.loginbox > h2{
    	font-size: 24px;
    	color: #6A24FE;
    	margin-bottom: 20px;
	}
	#login-form > input{
    	width: 100%;
    	height: 48px;
    	padding: 0 10px;
    	box-sizing: border-box;
    	margin-bottom: 16px;
    	border-radius: 6px;
    	background-color: #F8F8F8;
	}
	#login-form > input::placeholder{
    	color: #D2D2D2;
	}
	#login-form > input[type="submit"]{
    	color: #fff;
    	font-size: 16px;
    	background-color: #6A24FE;
    	margin-top: 20px;
	}
	a{
		text-decoration-line:none;
	}
</style>
<title>로그인</title>
</head>
<body>
	<div class="loginbox">
		<h2>LOGIN</h2>
		<form method="post" action="login_process.jsp" id="login-form">
			<input type="text" name="id" placeholder="ID">
			
			<input type="password" name="pwd" placeholder="Password">
			<input type="submit" value="로그인">
		</form>
		<p><a href="signUp.jsp" target="_self">회원가입</a></p>
	</div>
</body>
</html>