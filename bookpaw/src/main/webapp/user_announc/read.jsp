<%@page import="announce.DTO.Board"%>
<%@page import="java.util.List"%>
<%@page import="announce.Service.BoardService"%>
<%@page import="announce.Service.BoardServiceImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 조회</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Comptible" content="IE-edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="../css/product.css">
<link rel="stylesheet" href="../css/adm.css">
<script src="js/jquery-3.7-1.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<jsp:include page="/layout/link.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
	<%
		BoardService boardService = new BoardServiceImpl();
		int no = Integer.parseInt( request.getParameter("no") );
		Board board = boardService.select(no);
		
	%>
	
	
	<div class="container adm">
		<div class="header">
			<h1 class="adm_title">공지사항</h1>
		</div>
		<section id="tab-section-1" class="tab-section">
			<div class="adm_list">
				<table border="1" class="adm-table">
	<% if( board != null || board.getNo() > 0 ) { %>
	<table border="1">
		<tr>
			<th>제목</th>
			<td><%= board.getTitle() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%= board.getUserId() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%= board.getContent() %></td>
		</tr>
	</table>
	
	<% } else { %>
	<h3> 조회된 게시글이 없습니다.</h3>
	<% } %>
	
	</table>
	</div>
	</section>
	</div>

	<script src="../script/product.js"></script>
	<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>

	<!-- 푸터 -->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>









