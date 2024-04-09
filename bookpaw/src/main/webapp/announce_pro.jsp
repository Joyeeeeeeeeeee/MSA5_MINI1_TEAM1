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

	<header>
		<div class="nav container">
			<nav class="navigation">
				<a href="#" class="logo">도서대출서비스</a> <a href="main.html">Home</a> <a
					href="mypage.html">Mypage</a> <a href="adm.html">Administer</a> <a
					href="product01.html">lone</a>
				<button class="btnLogin-popup">Login</button>
				<box-icon type='solid' name='shopping-bag' id="cart-icon"></box-icon>
			</nav>
			<div class="cart">
				<h2 class="cart-title">나의책장</h2>
				<!--cantent-->
				<div class="cart-content"></div>
				<!--total-->
				<div class="total">
					<div class="total-title">total</div>
					<div class="total-price">₩0</div>
				</div>
				<!--buy button-->
				<button type="button" class="btn-buy">대출신청</button>
				<!--cart close-->
				<i class='bx bx-x' id="close-cart"></i>
			</div>
		</div>
	</header>

	<!-- 게시판 컨텐츠 -->
	<div class="container adm">
		<div class="header">
			<h1 class="adm_title">공지사항</h1>
			<!--  <nav id="tab-button-nav">
              <div class="tab-button" data-tab-section="tab-section-1">공지사항</div>
            </nav> -->
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
	
<%-- 		<div class="btn">
			<a href="<%= request.getContextPath() %>/announce/delete.jsp"><input
				type="button" name="" value="삭제"></a> <a
				href="<%= request.getContextPath() %>/announce_pro.jsp"><input
				type="button" name="" value="수정"></a> <a
				href="<%= request.getContextPath() %>/announce.jsp"><input
				type="button" name="" value="목록"></a>
		</div> --%>

	</div>
	<script>
        const $nav = document.querySelector('#tab-button-nav');
        const $sections = document.querySelectorAll('.tab-section');

        $nav.addEventListener('click', (e) => {
            if (!e.target.classList.contains('tab-button')) {
                return;
            }

            const focusedTabId = e.target.dataset.tabSection;

            $sections.forEach(($section) => {
                if ($section.id === focusedTabId) {
                    $section.removeAttribute('hidden');
                } else {
                    $section.setAttribute('hidden', true);
                }
            });
        });
    </script>
</table>
</body>
</html>
