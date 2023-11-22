<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null;

	if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
	}
    if(id == null){
		out.println("<script>alert('로그인 후 사용 가능합니다.');");
		out.println("location.href='log-in.jsp'</script>");
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width", initial-scale="1">
<title>게시글 작성</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style>
	form>table {
		text-align:center;
		border: solid 1px #dddddd;
	}
	form>table>th{
		text-align:center;
		backgroundColor: #eeeeee;
	}
	textarea {
		height: 480px;
		
	}

</style>
</head>
<body>
	<div>
		<div>
			<form method="post" action="writeInsert.jsp">
				<table class="table talbe-striped">
					<thead><tr><th colspan="2">문의</th></tr></thead>
					<tbody>
						<tr><td>제목:</td><td><input type="text" class="form-control" name="log_title"></td></tr>
						<tr><td>내용</td><td><textarea class="form-control" name="log_content" maxlength="2048"></textarea></td></tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="작성">
			</form>
		</div>
	</div>
</body>
</html>