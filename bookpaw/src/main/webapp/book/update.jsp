<%@page import="Service.BookServiceImpl"%>
<%@page import="DTO.Book"%>
<%@page import="Service.BookService"%>
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
<title>도서 정보 수정</title>
 <link rel="stylesheet" href="../css/product.css">
 <jsp:include page="/layout/header.jsp"></jsp:include>
</head>
<body>	
	<%
		BookService bookService = new BookServiceImpl();
		int no = Integer.parseInt( request.getParameter("no") );
		Book book = bookService.select(no);
		
%>
	<% if( book != null && book.getNo() > 0 ) { %>
	<form id="form" action="<%= request.getContextPath() %>/book/update_pro.jsp" method="post">
		<input type="hidden" id="no" name="no" value="<%= book.getNo() %>" />
   <header>
     <div class="nav container">
<!--         <a href="#" class="logo">Eommerce</a> -->
<!--         <box-icon type='solid' name='shopping-bag' id="cart-icon"></box-icon> -->
<!--         <div class="cart"> -->
<!--             <h2 class="cart-title">my cart</h2> -->
            
<!--             cantent -->
<!--             <div class="cart-content"> -->
<!--             </div> -->
<!--             total -->
<!--             <div class="total"> -->
<!--                 <div class="total-title">total</div> -->
<!--                 <div class="total-price">₩0</div> -->
<!--             </div> -->
<!--             buy button -->
<!--             <button type="button" class="btn-buy">buy now</button> -->
<!--             cart close -->
<!--             <i class='bx bx-x' id="close-cart"></i> -->
<!--         </div> -->
    </div>
   </header>

   <section class="shop container">
     <h2 class="section-title">도서 정보 수정</h2>
     
     <div class="shop-content">
         <div class="product-box">
            <img src="" alt="" class="product-img">
            <h2 class="product-title">aeroready shirt</h2>
<!--             <span class="price">₩3000</span> -->
<!--             <i class='bx bxs-shopping-bag add-cart'></i> -->
        </div>
        
        <div class="shop-content-list">
            <div class="product-box">
                <label>책제목</label>
                  <input type="text" name="bname" value="<%= book.getBname() %>" class="product_txt" >
                <label>고유번호</label>
                  <input type="text" name="isbn" value="<%= book.getIsbn() %>" class="product_txt" >
                <label>작가</label>
                  <input type="text" name="author" value="<%= book.getAuthor() %>" class="product_txt" >
<!--                 <label>게시물 번호</label> -->
<!--                   <input type="text" name="" value="" placeholder="게시물 번호"class="product_txt"> -->
                <label>분류</label>
                  <input type="text" name="category" value="<%= book.getCategory() %>" class="product_txt" >
                <label>발행일자</label>
                  <input type="text" name="make_Date" value="<%= book.getmake_Date() %>" class="product_txt" >
                <label>수량</label>
                   <input type="number" name="total" value="<%= book.getTotal() %>"  class="product_txt" >
                <label>책표지</label>
                   <form action="../fileupload01_pro.jsp" method="post" enctype="multipart/form-data"> 
	                   <input type="file" name="file1" value="" id="file1" class="product_txt" />
	                   <input type="submit" value="업로드" />
                   </form>
                   <img id="previewImage" src="#" alt="책 표지 미리보기" style="display:none;"> 
                <label>책 내용</label>
                <input type="text" name="text" value="<%= book.getText() %>" class="product_txt" id="textarea" >
           </div>
            <div class="btn">
				<input type="submit" value="수정 완료" /> 
				<button type="button" onclick="deletePro()">삭제</button>
				 <a href="list.jsp"><input type="button" name="" value="목록"></a>
				 <a href="<%= request.getContextPath() %>/book/read.jsp?no=<%= book.getNo() %>"><input type="button" name="" value="돌아가기"></a>
			 </div> 
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
	
</body>
</html>