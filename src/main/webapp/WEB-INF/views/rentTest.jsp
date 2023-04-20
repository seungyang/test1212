<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<style type="text/css">

#button-addon2{
    width: 100% !important;
    height: 50%;
    display: inline-block;
}
#button-addon3{
    width: 100% !important;
    height: 50%;
    display: inline-block;
}

.input-group.mb-3{

	margin: 16px 0px;
}

</style>  
</head>
<body>
<div class="container">
	<div class="col-lg-4 mx-auto text-center pt-5">
		<h2 class="mb-5">대여관리</h2>
	</div>
	
	<!-- form 태그의 위치 : 내가 옮겨야하는 데이터의 묶음, 모든 데이터 + 버튼이 담겨잇는 가장sdiv -->
	<form action="getMovieList" method="get" id="frm">
		<div class="row mb-3 text-center mx-auto ">
	      <div class="col-md-8 themed-grid-col">
	      	<div class="row">
	      		<div class="col-md-1 themed-grid-col"></div>
		          <div class="col-md-10 themed-grid-col">
					<div class="input-group mb-3">
					  <div class="input-group-text">
		<!-- 			    <input class="form-check-input mt-0" type="checkbox" value="" aria-label="Checkbox for following text input"> -->
							<input class="form-check-input" type="checkbox" value="" id="flexCheck1" aria-label="Checkbox for following text input">
						     <label class="form-check-label" for="flexCheck1">&nbsp;&nbsp;제 목</label>
					  </div>
					  <input type="text" id="title" class="form-control" name="rentTitle" aria-label="Text input with checkbox" disabled>
					</div>
				  </div>
		          <div class="col-md-1 themed-grid-col"></div>
	        </div>
	        <div class="row">
		          <div class="col-md-1 themed-grid-col"></div>
		          <div class="col-md-10 themed-grid-col">
					<div class="input-group mb-3">
					  <div class="input-group-text">
		<!-- 			    <input class="form-check-input mt-0" type="checkbox" value="" aria-label="Checkbox for following text input"> -->
							<input class="form-check-input" type="checkbox" value="" id="flexCheck2" aria-label="Checkbox for following text input">
						     <label class="form-check-label" for="flexCheck2">&nbsp;&nbsp;감 독</label>
					  </div>
					  <input type="text" id="director" class="form-control" name="rentDirector" aria-label="Text input with checkbox" disabled>
					</div>
				  </div>
		          <div class="col-md-1 themed-grid-col"></div>
	        </div>
	        
		  </div>
	      <div class="col-md-4 themed-grid-col">
			<button class="btn btn-outline-secondary" type="button" id="button-addon2">기본 검색</button>
			<button class="btn btn-outline-secondary" type="button" id="button-addon3">ajax 검색</button>
		  </div>
	    </div>
    </form>
    <div class="table-responsive">
        <table class="table table-striped table-sm text-center">
          <thead>
            <tr>
              <th scope="col">순번</th>
              <th scope="col">제목</th>
              <th scope="col">감독</th>
              <th scope="col">대여상태</th>
              <th scope="col">반납일자</th>
            </tr>
          </thead>
          <tbody>
          <c:if test="${not empty rList}">
                <c:forEach items="${rList}" var="rent">
		            <tr>
		            	<td>${rent.rentId }</td>
		            	<td>${rent.rentTitle }</td>
		            	<td>${rent.rentDirector }</td>
		            	<td>${rent.rentState }</td>
		            	<td>${rent.rentDate }</td>
		            </tr>
	            </c:forEach>
            </c:if>
<%--             <c:choose> --%>
<%--             	<c:when test="${empty rList }"></c:when> --%>
<%--             	<c:when test="${not empty rList}"></c:when> --%>
<%--             	<c:otherwise></c:otherwise> --%>
<%--             </c:choose> --%>
          </tbody>
        </table>
      </div>
</div>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		let chkBtn1 = $('#flexCheck1')
		let chkBtn2 = $('#flexCheck2')
		$('#flexCheck1').click(chkDisabled);
		
		$('#flexCheck2').click(chkDisabled);
		
		$('#button-addon2').click(function(){
			if ( chkBtn1.is(':checked') || chkBtn2.is(':checked') ){
				
				alert('올바른체크');
				
				createTag();
			}else {
				
				alert('검색항목을 체크해주세요');
				
			}
		});
				
				
		function chkDisabled(){
			var thisInput = $(this).parent().next();
			
			if(thisInput.is(":disabled")){
				thisInput.val('test1');
				thisInput.attr("disabled",false); 
			}else{
				thisInput.val('');
				thisInput.attr("disabled",true); 
			}
		}
		
		
		function createTag(){
			
// 			let arr = ['존윅','슬램덩크','아바타'];
		
			// 제일 안좋은 코드
// 			if ( '검색어' == '존윅' ) {
// 				alert('존윅태그추가');
// 			}
			
// 			if ( '검색어' == '슬램덩크' ) {
// 				alert('슬램덩크태그추가');
// 			}
			
// 			if ( '검색어' == '아바타' ) {
// 				alert('아바타태그추가');
// 			}
			// 배열에 담은 형태
// 			if ( '검색어' == arr[0] ) {
// 				alert('존윅태그추가');
// 			}
			
// 			if ( '검색어' == arr[1] ) {
// 				alert('슬램덩크태그추가');
// 			}
			
// 			if ( '검색어' == arr[2] ) {
// 				alert('아바타태그추가');
// 			}
					
			
			// 자동화
// 			for( var i = 0; i < arr.length;i++){
// 				if ( '검색어' == arr[i] ) {
// 					alert('태그추가');
// 				}else {
// 					// 무시
// 				}
// 			}
			
			
// 			let tagHtml = "<tr>"+
// 	              "<td>1</td> "+
// 	              "<td>"+ arr[2] +"</td> "+
// 	              "<td>감독2</td> "+
// 	              "<td>날짜2</td> "+
// 	              "<td>상태2</td> "+
// 	            "</tr>"
			
			
// 			$('.table > tbody').append(tagHtml);

			// 클릭이 되었을때 할 행동
			// 검색어 준비
			// 검색어를 통해서 대상들을 검색
			// -- 대상 : 데이터베이스 ( 우리 서버에 있는 공공 데이터 )
			// -- 대상과 연결을 돕는 언어 : JAVA + Spring(MVC패턴)
			// 결과를 화면에 출력
			
			// 검색어 준비 (추가할부분 체크가 되엇을때)
			let title = $('#title').val();
			let director = document.getElementById('director').value;
			
			console.log(title);
			console.log(director);
			
			// JAVA 라는 언어 : DB와 연결을 돕는 언어이며, 파일일 뿐입니다.
			// DB 라는 공간에 있는 데이터를 탐색, 추가, 수정, 삭제...
			// DB 탐색 : SELECT 영화제목, 감독, 상태, 일자  FROM 영화정보테이블
			// 위 쿼리를 실행하기위에 JAVA를 이용해서 DB에 연결
			// JAVA를 효율적으로 코딩하기위해 필요한 구조가  MVC 디자인 패턴
			// M odel
			// - JAVA를 이용해서 DB에 연결하는 과정에 대한 파일, 로직
			// V iew
			// - JSP, html, css, js등 화면에 출력하고자 하는 파일, 페이지
			// C ontroller
			// - 화면과 로직에 대해서 연결해주는 파일, 연결점
			
			// 화면에서 로직을 사용하기위해서는 연결점이 되는 곳을 호출
			// 호출 > 요청,제출,정해놓은키워드 > Controller에 있는 Mapping
			// 요청하는 방법 : 
			// - 1. a태그를 이용한 href링크
			// - 2. submit() 기능을 활용한  form태그의 action 경로
			// - 3. 자바스크립트를 이용한 코딩
			//      - location.href = "" 요청
			//      - 태그에 대한 코딩으로 요청 (*)
			$('#frm').submit();
			
// 			document.getElementById('frm').submit();
			
			// 코딩을 통한 2번 기능을 활성화
			// 요청할이름 : getMovieList
			// 요청방법 :  form태그의 action 경로로 submit() 기능 구현
			
			
			
			// 호출된 포인트에서 아래 작업을 해야합니다.		
			// 검색어를 통해서 대상들을 검색
			// -- 대상 : 데이터베이스 ( 우리 서버에 있는 공공 데이터 )
			// -- 대상과 연결을 돕는 언어 : JAVA + Spring(MVC패턴)
			
			
		}
	});
	
	// ajax 사용하기위한 부분
	$(function(){
		
		$('#button-addon3').click(function(){

			// ajax주요 키(옵션)
			// 1. url : 요청할 주소, controller 에 있는 맵핑명
			// 2. data : 요청과 함께 서버에 보낼 문자열, JSON 객체
			// 3. type : 전송할 방법, *post or get
			// 4. success : 요청이 성공이 되면 실행되는 함수 (callback), function(){ } 으로 생성
			// 5. dataType : 서버에서 받아온 데이터의 형식(자료형)
			// 6. error : 요청이 실패하면 실행되는 함수(callback), function(){ } 으로 생성
			
			// JS 를 이용해서 채워주기 ! (*) null 중요합니다. java에서 실제로 null인지
			let title = $('#title').val();
			let director = document.getElementById('director').value;
			
			let inputData = { rentTitle : title ,rentDirector : director } ;
			
			// 작은 form 태그 > 실행이 되면 나오는 결과를 success로 표현
			$.ajax( {
				url : "ajax",
				data : inputData,
				type : "post",
				success : function(ajaxData){ 
					alert(ajaxData);		
					// 태그를 만드는 작업 (*)기존태그는 지우고
					let tagHtml = "<tr>"+
			              "<td>1</td> "+
			              "<td>제목2</td> "+
			              "<td>감독2</td> "+
			              "<td>날짜2</td> "+
			              "<td>상태2</td> "+
			            "</tr>"
					$('.table > tbody').append(tagHtml);
				},
				error : function(){ 
					alert('실패');
				}				
			} );
			
			
		});
		
	})
	
	
	

</script>

</html>