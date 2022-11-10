<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="T1_Dto.package_info" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%String path = request.getContextPath();%>
<link rel="styLesheet" href="<%=path%>/css/detail.css">

</head>
<body>

<%String id = (String)session.getAttribute("id");%>
<header>
<h2>AcornTourPackageDetail</h2>
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

<div>
<h3>패키지 투어별 상세일정</h3>

<%package_info tour = (package_info)request.getAttribute("info");%>

<table> 

<tr>
<td>패키지번호 : <%=tour.getPk_num()%></td>
<td>패키지이름 : <%=tour.getPk_name()%></td>
<td>일정 : <%=tour.getSchedule() %></td>
<td>출국항공편 : <%=tour.getDeparture()%></td>
<td>입국항공편 : <%=tour.getDestination()%></td>
<td>가격 : <%=tour.getPrice()%> ~부터</td>
<td>여행지 : <%=tour.getTrv_place()%> </td>	
<td>호텔예약번호 : <%=tour.getHotel_number()%></td>
<td><button onclick="location.href='reservation?price=<%=tour.getPrice()%>'">예약하기</button> </td>
</tr>

</table>

<table> 

<tr>
<td>출국항공편 : <%=tour.getFlight_num()%></td>
<td>출발일 : <%=tour.getDep_date()%></td>
<td>출발 시간 : <%=tour.getDep_time() %></td>
<td>도착일 : <%=tour.getDes_date()%></td>
<td>도착시간 : <%=tour.getDes_time()%></td>
<td>총 비행시간 : <%=tour.getFlight_time()%></td>
<td>항공사 : <%=tour.getAirline()%> </td>	
<td>항공사 분류 : <%=tour.getAlrline_class()%></td>
<td>출발지 : <%=tour.getDep_place()%></td>
<td>도착지 : <%=tour.getDes_place()%></td>
</tr>

</table>

<table> 

<tr>
<td>출국항공편 : <%=tour.getFlight_num1()%></td>
<td>출발일 : <%=tour.getDep_date1()%></td>
<td>출발 시간 : <%=tour.getDep_time1() %></td>
<td>도착일 : <%=tour.getDes_date1()%></td>
<td>도착시간 : <%=tour.getDes_time1()%></td>
<td>총 비행시간 : <%=tour.getFlight_time1()%></td>
<td>항공사 : <%=tour.getAirline1()%> </td>	
<td>항공사 분류 : <%=tour.getAlrline_class1()%></td>
<td>출발지 : <%=tour.getDep_place1()%></td>
<td>도착지 : <%=tour.getDes_place1()%></td>
</tr>

</table>

<table> 

<tr>
<td>호텔예약번호 : <%=tour.getHt_key()%></td>
<td>호텔명 : <%=tour.getHt_name()%></td>
<td>주소 : <%=tour.getHt_ad()%></td>
<td>객실 타입 : <%=tour.getRoom_type()%></td>
<td>체크인 & 아웃 : <%=tour.getCheck_time()%></td>
<td>객실 제공 : <%=tour.getAmenities()%></td>
<td>호텔 제공 : <%=tour.getHt_offers()%> </td>
</tr>

</table>

</div>

</section>

<footer>
AcornTour Footer
</footer>

</body>
</html>
