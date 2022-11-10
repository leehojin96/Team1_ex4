<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>

<%String path = request.getContextPath();%>
<script src="<%=path %>/js/join.js"></script>

</head>
<body>
 <%
    String id = (String)session.getAttribute("id");
    %>
<header>
<h2>AcornTourJoin</h2>
</header>

<nav>
<%if(id == null){ %>
<a href="mainIndex">홈페이지</a>
<a href="package_list">패키지 여행 목록</a>
<a href="tourJoin">회원가입</a>
<a href="tourLogin">로그인</a>
<%} %>
<%if(id != null){ %>
<a href="mainIndex">홈페이지</a>
<a href="package_list">패키지 여행 목록</a>
<a href="tourMypage">마이페이지</a>
<a href="logout">로그아웃</a>
<%} %>
</nav>

<section>

<form name="joinfrm" action="tourJoin" method="post">
<table>
<tr><td>이름</td><td><input type="text" name = "name"></td></tr>
<tr><td>아이디</td><td><input type="text" name = "id" placeholder="ex) 1234@naver.com"></td></tr>
<tr><td>비밀번호</td><td><input type="password" name = "pw"></td></tr>
<tr><td>비밀번호확인</td><td><input type="password" name = "pwcheck"></td></tr>
<tr><td>휴대폰번호</td><td><input type="text" name = "phone" placeholder="ex) 010-1234-5678"></td></tr>
	<tr>
		<td>주민번호</td>
		<td><input type="text" name = "birth" placeholder="ex) 990101-1234567"></td>
	</tr>
<tr><td>성별</td><td><input type="radio" name = "gender" value="남">남<input type="radio" name = "gender">여</td></tr>
<tr colspan="2">
<td>
<button type="button" onclick="join()">가입하기</button>
<button type="button" onclick="location.href='mainIndex'">가입취소</button>
</td>
</tr>

</table>
</form>

</section>

<footer>
AcornTour Footer
</footer>

</body>
</html>