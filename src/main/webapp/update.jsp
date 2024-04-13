<%@page import="announce.Service.BoardServiceImpl"%>
<%@page import="announce.DTO.Board"%>
<%@page import="announce.Service.BoardService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
   <jsp:include page="/layout/meta.jsp"></jsp:include>
 	<jsp:include page="/layout/link.jsp"></jsp:include>
<title>게시글 수정</title>
</head>
<body>	
<jsp:include page="/layout/header.jsp"></jsp:include>
	<%
		BoardService boardService = new BoardServiceImpl();
		int no = Integer.parseInt( request.getParameter("no") );
		Board board = boardService.select(no);
		
	%>
	<h1>게시글 수정</h1>
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
		<div class="btn">
		<input type="submit" value="수정" /> 
		<input type="button" value="삭제" onclick="deletePro()">
		</div>
		<!-- <div class="delete_btn">
		
		</div> -->
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
			form.action = 'delete.jsp?no=' + no
			// 입력양식 폼 제출
			form.submit()
			
		}
	</script>
	
<!-- 푸터 -->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	
	<!-- 스크립트 -->
	<jsp:include page="/layout/script.jsp"></jsp:include>
<!--      <script src="../script/product.js"></script> -->
      <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
</body>
</html>














