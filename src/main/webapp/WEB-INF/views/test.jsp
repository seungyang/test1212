<%@page import="com.human.java.RentVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
테스트페이지입니다.
<br/>
리스트형태 (배열): ${rList} 
<br/>
리스트의 0번째 인덱스 : ${rList.get(0)} 
<br>
리스트의 0번째 인덱스 : ${rList[0]} 
<br>
리스트의 0번째 인덱스의 변수명 : ${rList.get(0).rentTitle} 
<br>
리스트의 0번째 인덱스의 변수명 : ${rList[0].rentTitle} 
<br>
배열과 같이 사용하는 반복문 활용 : JSTL 
<br>
기존모양
<% List<RentVO> rList = (List) request.getAttribute("rList");
	for( int i = 0 ; i < rList.size() ; i++ ) {%>
		<!-- html코드를 써야합니다. -->
		<%=rList.get(i).getRentTitle() %><br>
<% } %>
<br>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
EL & JSTL 모양
<c:forEach items="${rList}" var="rent">
	${rent.rentTitle}<br>
</c:forEach>
<br><br>
<hr>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<div class="container">
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
          	<c:forEach items="${rList}" var="rent">
	            <tr>
	            	<td>${rent.rentId }</td>
	            	<td>${rent.rentTitle }</td>
	            	<td>${rent.rentDirector }</td>
	            	<td>${rent.rentState }</td>
	            	<td>${rent.rentDate }</td>
	            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
</div>


</body>
</html>