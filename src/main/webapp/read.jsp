<%@page import="DTO.Users"%>
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
   <jsp:include page="/layout/meta.jsp"></jsp:include>
 	<jsp:include page="/layout/link.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/layout/header.jsp"></jsp:include>
	<%
		BoardService boardService = new BoardServiceImpl();
		int no = Integer.parseInt( request.getParameter("no") );
		Board board = boardService.select(no);
		
		Users loginUser = (Users) session.getAttribute("loginUser");
		
		if(loginUser == null){
		    loginUser = new Users();
		}
		
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
	
 <%if(loginUser.getUser_level()==10){ %>
<div class="btn">
 <a href="<%= request.getContextPath() %>/update.jsp?no=<%= board.getNo() %>">
<input type="button" name="" value="수정"></a>
						</div>
							 <%} %>
	
	
	</div>
	
	<!-- 푸터 -->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	
	<!-- 스크립트 -->
	<jsp:include page="/layout/script.jsp"></jsp:include>
<!--      <script src="../script/product.js"></script> -->
      <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>

	
</body>
</html>









