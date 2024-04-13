<%@page import="announce.DTO.Board"%>
<%@page import="java.util.List"%>
<%@page import="announce.Service.BoardServiceImpl"%>
<%@page import="announce.Service.BoardService"%>
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
<title>Insert title here</title>
</head>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Comptible" content="IE-edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="css/adm.css">
<link rel="stylesheet" href="css/product.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="script/product.js"></script>
<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
</head>

<body>

	<!-- 게시판 컨텐츠 -->
	<div class="container adm">
		<div class="header">
			<h1 class="adm_title">공지사항</h1>
		</div>
		<section id="tab-section-1" class="tab-section">
			<div class="adm_list">
				<table border="1" class="adm-table">
					<%
            		BoardService boardService = new BoardServiceImpl();
            		int no = Integer.parseInt( request.getParameter("no") );
            		Board board = boardService.select(no);
            		
            	%>
	<% if( board != null && board.getNo() > 0 ) { %>
	<form id="form" action="<%= request.getContextPath() %>/announce/update_pro.jsp" method="post">
		<input type="hidden" id="no" name="no" value="<%= board.getNo() %>" />
		<table border="1">
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" value="<%= board.getTitle() %>" />
				</td>
			</tr>	
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="userId" value="<%= board.getUserId() %>" />
				</td>
			</tr>	
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="5" cols="40" name="content">
						<%= board.getContent() %>
					</textarea>
				</td>
			</tr>	
		</table>
		<input type="submit" value="수정" /> 
		<button type="button" onclick="deletePro()">삭제</button> 
 	</form>
	<% } else { %>
		<h3>조회된 게시글이 없습니다.</h3>
	<% } %>
	<script>
	
		// 삭제 요청
		function deletePro() {
			const form = document.getElementById('form')
			const no = document.getElementById('no').value
			
			// action 속성을 삭제요청 경로로 변경
			form.action = 'announce/delete.jsp?no=' + no
			// 입력양식 폼 제출
			form.submit()
			
		}
	</script>

	</div>

</table>
</body>
</html>
