<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="T1_Dto.Package" %>
<%@ page import="T1_Dto.Flight" %>

<%
String path = request.getContextPath();
%>
<link rel="styLesheet" href="<%=path%>/css/mypage.css" >

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
 <%
    String id = (String)session.getAttribute("id");
    %>
<header>
<h2>AcornTourPackageInfo</h2>
</header>

<nav>
<%if(id == null){ %>
<a href="mainIndex">홈페이지</a>
<a href="tourJoin">회원가입</a>
<a href="tourLogin">로그인</a>
<%} %>
<%if(id != null){ %>
<a href="mainIndex">홈페이지</a>
<a href="tourMypage">마이페이지</a>
<a href="logout">로그아웃</a>
<%} %>
</nav>

<section>

<table>
<caption>패키지 정보</caption>
<tr>
<td>패키지 번호</td>
<td>패키지 이름</td>
<td>일정</td>
<td>출국항공편</td>
<td>입국항공편</td>
<td>가격</td>
<td>여행지</td>
<td>호텔정보</td>
</tr>

<%
ArrayList<Package> list = (ArrayList<Package>)request.getAttribute("list");
	for(Package res : list){
%>
<tr>
<td> <%= res.getPk_num() %></td>
<td> <%= res.getPk_name()%></td>
<td> <%= res.getSchedule() %></td>
<td> <%= res.getDeparture() %></td>
<td> <%= res.getDestination() %></td>
<td> <%= res.getPrice() %></td>
<td> <%= res.getTrv_place() %></td>
<td> <%= res.getHt_key()%></td>
</tr>
<% } %>

</table>

<table>
<caption>항공권 정보</caption>
<tr>
<td>항공편번호</td>
<td>출발일</td>
<td>출발시간</td>
<td>도착일</td>
<td>도착시간</td>
<td>총 비행시간</td>
<td>항공사</td>
<td>항공사 분류</td>
<td>출발지</td>
<td>도착지</td>
</tr>

<%
ArrayList<Flight> flightlist = (ArrayList<Flight>)request.getAttribute("flightlist");
	for(Flight flight : flightlist){
%>
<tr>
<td> <%= flight.getFlight_num() %></td>
<td> <%= flight.getDep_date()%></td>
<td> <%= flight.getDep_time() %></td>
<td> <%= flight.getDes_date() %></td>
<td> <%= flight.getDes_time() %></td>
<td> <%= flight.getFlight_time() %></td>
<td> <%= flight.getAirline() %></td>
<td> <%= flight.getAlrline_class()%></td>
<td> <%= flight.getDep_place()%></td>
<td> <%= flight.getDes_place()%></td>
</tr>
<% } %>

</table>

</section>

<footer>
AcornTour Footer
</footer>

</body>
</html>