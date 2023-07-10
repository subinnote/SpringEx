<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/navbar-fixed/">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="/resources/css/style.css" rel="stylesheet" rel="stylesheet">
<script type="text/javascript">
function requestAction(url){
	viewForm.action=url;
	viewForm.submit();
	}
</script>

</head>
<body>
<%@ include file="../common/header.jsp" %>

<main class="container">
  <div class="bg-light p-5 rounded">
    <h1>게시판</h1>
    <p class="lead">부트스트래블 이용한 게시판 만들기</p>
    <a class="btn btn-lg btn-primary" href="/board/list" role="button">리스트 &raquo;</a>
  </div>
  <p></p>
  <!-- 글쓰기 -->
  <div class="list-group w-auto">
 
  <form method="post" name="viewForm">
   	<div class="mb-3">
  		<label for="title" class="form-label">제목</label>
		<input type="text" id="title" name="title" class="form-control" value="${board.title }">
	</div>
	<div class="mb-3">
  		<label for="content" class="form-label">내용</label>
		<input type="text" id="content" name="content" class="form-control" value="${board.content }">
	</div>
	<div class="mb-3">
  		<label for="writer" class="form-label">작성자</label>
		<input type="text" id="writer" name="writer" class="form-control" value="${board.writer }">
	</div>	
	<div class="d-grid gap-2 d-md-flex justify-content-md-center">
		<!-- bno 값이 있으면 수정하기 -->
		<c:if test="${not empty board.bno}" var="res">
	  		<input type="text" name="bno" value="${board.bno}" hidden>
			<button type="submit" class="btn btn-lg btn-primary"
				onclick="requestAction('/board/editAction')">수정하기</button>
		</c:if>
		<!-- 없으면 등록하기 -->
		<c:if test="${not res }">
			<button type="submit" class="btn btn-lg btn-primary">등록하기</button>
		</c:if>
		<button type="reset" class="btn btn-lg btn-primary">초기화</button>
	</div>
  </form>
  
  </div>
</main>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>