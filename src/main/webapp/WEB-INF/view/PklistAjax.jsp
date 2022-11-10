<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.util.ArrayList" %>
  <%@page import="T1_Dto.package_info" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

 .detail{
 display:none;
 height: 100px;
 border-style: dotted;

 }
 a{
 text-decoration: none;
 }
 ul{
 list-style: none;
 }
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function package_list( obj){

let li  = obj.parentElement;	
let noTag  = li.querySelector("#no");
let no =  noTag.value;
//alert( no);
$.ajax(
		{
			 type:"get",
			 dataType:"json",
			 data:{ no : no} ,
			 url:"/package_list.do",	    
			 success: function( data, textStatus){
		        console.log( data);	  //콘솔에서 json 데이터 확인하기 			        
		        let pk_name = data.pk_name;
		        let trv_place = data.trv_place;
		        let price = data.price;
		        let schedule =data.schedule;
		        
		          
		        let pk_nameTag  = li.querySelector("#pk_name");
		        let trv_placeTag  = li.querySelector("#trv_place");
		        let priceTag  = li.querySelector("#price");
		        let scheduleTag  = li.querySelector("#schedule");
		        
		        pk_nameTag.value= pk_name;	
		        trv_placeTag.value=trv_place;
		        priceTag.value= price;
		        scheduleTag.value =schedule;
		      
			 }
			 ,
			 error: function( data, textStatus){			 
			 },		 
			 complete:function(data, textStatus){
				 alert("여행을 떠나요");
			 }	 
		}
	 );
}
</script>

<script>
//ajax로 데이터받기
function toggle(obj){  
    let li  = obj.parentElement;
    let detail  = li.querySelector(".detail");
    let flagTag  =  li.querySelector("#flag");
  
    let flag = flagTag.value;
   
    if( flag ==0){
       package_list(obj);         	
    	//package_list();   
        detail.style.display="block";
        flagTag.value=1;
    }else{      
        detail.style.display="none";
        flagTag.value=0;;
    }
}


</script>


</head>
<body>
 <%
    String id = (String)session.getAttribute("id");
    %>
<header>AcornTour</header>
	
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
	
	<div>
	<h2 id="id">고객님만을 위한 추천 패키지여행
	<img src = "/images/img1"  alt=""/> 
	</h2>	
	<section>
	
<h3>아시아/유럽/미주</h3>
<div class="wrap"> 

<ul id="list">
<li><a href="package_detail?pk_num=Pj123"><img src=" "><p>[슈퍼세이브] 행복한 오사카여행<br> 12월 20일부터 12월 23일까지 [로칸1일숙박] 바쁜 당신을 위한 추천 상품// </p><p>여행기간 2박3일<br>★4.2</p></a>	
<button onclick="toggle(this)">상품요약보기</button>
	<div  class="detail">
	
			<input id="flag" type="hidden" value="0">
		<input id="no" type="hidden"  value="Pj123"/>	 
		 
		 <div id="info">
		     힐링+휴양 / 세이브투어
		     <input type="text"  id="pk_name" >	<br>
		     투어도시	
		     <input type="text"  id="trv_place" ><br>
		     가격(원)		
		     <input type="text"  id="price" ><br>
		     일정	
		     <input type="text"  id="schedule" ><br>	
		  </div>

	</div>
</li> 

<li><a href="package_detail?pk_num=PA987"><img src=" "><p>[마감임박!!] 로스앤젤레스 관광<br>12월 10일부터 12월 17일일까지 미주여행 고민중이라면! [슈퍼세이브] 가족단위 추천 상품// </p><p>여행기간 8일<br>★4.5</p></a>
<button  onclick="toggle(this)">상품요약보기</button>
	<div  class="detail">
	
		<input id="flag" type="hidden" value="0">
		<input id="no" type="hidden"  value="PA987"/>	 
		 
		 <div id="info">
		     관광+쇼핑 / 얼리버드 
		     <input type="text"  id="pk_name" ><br>
		     투어도시		
		     <input type="text"  id="trv_place" ><br>	
		     가격(원)	
		     <input type="text"  id="price" ><br>	
		     일정
		     <input type="text"  id="schedule" ><br>		     
		  </div>

	</div>
</li> 

<li><a href="package_detail?pk_num=PU456 "><img src=" "><p>[크리스마스 마켓투어포함] 영국 런던 깊이보기<br>12월 25일부터 12월 31일까지 크리스마스부터 연말분위기 유럽감성찬스!  [추천도1위] 크리스마스를 느끼고 싶은 당신을 위한 선택!// </p><p>여행기간 6박7일<br>★4.7</p></a>
<button  onclick="toggle(this)">상품요약보기</button>
    <div class="detail" >
	
		<input id="flag" type="hidden" value="0">
		<input id="no" type="hidden"  value="PU456"/>	 
		 
		 <div id="info">
		     레저+투어포함 / 인기투어
		     <input type="text"  id="pk_name" ><br>
		     투어도시		
		     <input type="text"  id="trv_place" ><br>	
		     가격(원)	
		     <input type="text"  id="price" ><br>	
		     일정
		     <input type="text"  id="schedule" ><br>			     
		  </div>
	
    </div>
    </li> 

<li><a href=" "><img src=" "><p>[얼리버드 & 슈퍼세이브] 보라카이<br>10월 31일부터 11월 13일까지 즐기는 보라카이 특별 할인 찬스!  [슈퍼세이브] 알뜰한 해외여행을 준비하는 당신을 위한 선택! 가성비 추천 상품// </p><p>여행기간 4/5/6일<br>★4.2</p></a>
<button  onclick="toggle(this)">상품요약보기</button>
    <div class="detail" >
       <input type="hidden" value="0">
		   힐링+휴양 / 얼리버드
		     <input type="text"  id="pk_name" ><br>
		     투어도시		
		     <input type="text"  id="trv_place" ><br>	
		     가격(원)	
		     <input type="text"  id="price" ><br>	
		     일정
		     <input type="text"  id="schedule" ><br>		

</ul>
</div>
				
	</section>
	
	<footer>
		AcornTour Footer
	</footer>


</div>


</body>
</html>