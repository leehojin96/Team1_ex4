<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="T1_Dto.Customer" %>

<%String path = request.getContextPath();%>
<script src="<%=path %>/js/update.js"></script>
<link rel="styLesheet" href="<%=path%>/css/mypage.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>

</head>
<body>
 <%
    String id = (String)session.getAttribute("id");
 	Customer customer = (Customer)request.getAttribute("customer");
    %>
<header>
<h2>AcornTourMypageUpdate</h2>
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
<a href="tourMypageUpdate">회원정보수정</a>
<a href="logout">로그아웃</a>
<%} %>
</nav>

<section>

<form name="updatefrm" action="tourMypageUpdate" method="post">
<table>
<tr><td>이름</td><td><input type="text" name = "name" value=<%=customer.getName()%> readonly></td></tr>
<tr><td>아이디</td><td><input type="text" name = "id" value=<%=customer.getId()%> readonly></td></tr>
<tr><td>현재 비밀번호</td><td><input type="text" name = "pw" value=<%=customer.getPw()%>></td></tr>
<tr><td>새 비밀번호</td><td><input type="password" name = "new_pw"></td></tr>
<tr><td>비밀번호확인</td><td><input type="password" name = "pwcheck"></td></tr>
<tr><td>현재 휴대폰번호</td><td><input type="text" name = "phone" value=<%=customer.getPhone()%> readonly></td></tr>
<tr><td>새 휴대폰번호</td><td><input type="text" name = "new_phone" placeholder="ex) 010-1234-5678"></td></tr>
	<tr>
		<td>주민번호</td>
		<td><input type="text" name = "birth" value=<%=customer.getBirth()%> readonly></td>
	</tr>
<tr colspan="2">
<td>
<button type="button" onclick="update()">수정완료</button>
</td>
<td>
<button type="button" onclick="location.href='tourMypage'">수정취소</button>
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