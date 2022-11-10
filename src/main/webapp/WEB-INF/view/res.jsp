<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="T1_Dto.package_info" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<%String path = request.getContextPath();%>
<script src="<%=path %>/js/res.js"></script>
<link rel="styLesheet" href="<%=path%>/css/res.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function abc(obj) {
	let body = obj.parentElement;
	let select = body.querySelector("#persons");
	let option = select.value;
	$.ajax({
			type:"get",
		 dataType:"json",
		 data:{ option : option } ,
		 url:"/Team1_ex4/resperson.do",
		 success: function( data, textStatus){
			 console.log("ajax success");
		 },
		 error: function( data, textStatus){			 
		 },		 
		 complete:function(data, textStatus){
			 console.log("ajax complete");
		 }	 
	});
	
}
</script>
</head>
<body>

<% String price= (String)request.getAttribute("price");%>

<%String id = (String)session.getAttribute("id");%>
<header>
<h2>AcornTourReservation</h2>
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

<form name="frm" action="reservation" method="post">

<table>
<caption><h1>예약자 정보</h1></caption>

	<tr>
		<th>성함</th><td><input type = "text" name ="name" Placeholder=""></td>
	</tr>
	<tr>
		<th>영문이름</th><td><input type = "text" name ="eng_name" Placeholder="ex) LimYoungbin"></td>
	</tr>
	<tr>
		<th>생년월일</th><td><input type = "text" name ="birth" Placeholder="ex) 981125"></td>
	</tr>
	<tr>
		<th>휴대폰번호</th><td><input type = "text" name ="phone" Placeholder="ex) 010-7143-7327"></td>
	</tr>
	<tr>
		<th>성별</th>
		<td>
		<input type="radio" name = "gender" value ="남">남
		<input type="radio" name = "gender" value ="여">여
		</td>
	</tr>
	
</table>

<table>
	<caption><h3>최종결제금액</h3></caption>
	
	<tr>
		<th>인원</th>
		<td>
			<select id="persons" name="persons" onchange="abc(this)">
					<option value="">선택하세요</option>
					<option value="1">1인</option>
					<option value="2">2인</option>
					<option value="3">3인</option>
					<option value="4">4인</option>
					<option value="5">5인</option>
					<option value="6">6인</option>
					<option value="7">7인</option>
					<option value="8">8인</option>
					<option value="9">9인</option>
					<option value="10">10인</option>
				</select>
		</td>
	</tr>
	
	<tr>
		<td colspan ="2">
		<span>유류할증료&제세공과금 포함</span>
		</td>
	</tr>
	
	<tr>
		<th>총 상품금액</th>
		<td>가격 : <%=price%> 원</td>
	</tr>
	
	<tr>	
		<th>선택사항 추가금액</th>
		<td>0원</td>
	</tr>
	
	<tr>	
		<th>-선택관광-</th>
		<td>0원</td>
	</tr>
	
	<tr>	
		<th>-호텔변경-</th>
		<td>0원</td>
	</tr>

</table>

<table>
	<tr>
		<th>약관동의</th>
		
	</tr>
	
	<tr>
		<th>국내여행 특별약관 (필수)</th>
		<td>
		<input type="radio" name = "chk1">동의합니다.
		<input type="radio" name = "chk1">동의하지 않습니다.
		</td>
	</tr>
	
	<tr>
		<th>개인정보 수집 및 이용 동의 (필수)</th>
		<td>
		<input type="radio" name = "chk2">동의합니다.
		<input type="radio" name = "chk2">동의하지 않습니다.
		</td>
	</tr>
	
	<tr>
		<th>개인정보 제3자 제공 동의 (필수)</th>
		<td>
		<input type="radio" name = "chk3">동의합니다.
		<input type="radio" name = "chk3">동의하지 않습니다.
		</td>
	</tr>
	
	<tr>
		<th>민감정보 수집 및 이용 (필수)</th>
		<td>
		<input type="radio" name = "chk4">동의합니다.
		<input type="radio" name = "chk4">동의하지 않습니다.
		</td>
	</tr>
	
	<tr>
		<th>위치정보 이용약관 (필수)</th>
		<td>
		<input type="radio" name = "chk5">동의합니다.
		<input type="radio" name = "chk5">동의하지 않습니다.
		</td>
	</tr>

</table>

<div>
	<button type="button" onclick="check()">결제하기</button>
	<button type="button" onclick="location.href='mainIndex.html'">결제취소</button>
</div>

</form>

</section>

<footer>
AcornTour Footer
</footer>

</body>
</html>