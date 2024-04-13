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
   <jsp:include page="/layout/meta.jsp"></jsp:include>
 	<jsp:include page="/layout/link.jsp"></jsp:include>
<title>도서 정보 수정</title>
</head>
<body>	

<jsp:include page="/layout/header.jsp"></jsp:include>

	<%
		BookService bookService = new BookServiceImpl();
		int no = Integer.parseInt( request.getParameter("no") );
		Book book = bookService.select(no);
		
%>
	<% if( book != null && book.getNo() > 0 ) { %>
	<form id="form" action="<%= request.getContextPath() %>/book/update_pro.jsp" method="post">
		<input type="hidden" id="no" name="no" value="<%= book.getNo() %>" />

   <section class="shop container">
     <h2 class="section-title">도서 정보 수정</h2>
     
     <div class="shop-content">
        <!--  <div class="product-box">
            <img src="" alt="" class="product-img"> -->
           <!--  <h2 class="product-title">도서</h2> -->
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
                  <!--  <form action="../fileupload01_pro.jsp" method="post" enctype="multipart/form-data"> 
	                   <input type="file" name="file1" value="" id="file1" class="product_txt" />
	                   <input type="submit" value="업로드" />
                   </form> -->
                   <img id="previewImage" src="#" alt="책 표지 미리보기" style="display:none;"> 
                <label>책 내용</label>
                <input type="text" name="text" value="<%= book.getText() %>" class="product_txt" id="textarea" >
           </div>
             </div>
				<div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
				<input class="btn btn-primary btn-lg px-4 me-sm-3" type="submit" value="완료" />
				<button class="btn btn-outline-light btn-lg px-4" type="button" onclick="deletePro()">삭제</button>
				 <a href="product.jsp"><input class="btn btn-outline-light btn-lg px-4" type="button" name="" value="목록"></a>
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
			form.action = 'book/delete.jsp?no=' + no
			// 입력양식 폼 제출
			form.submit()
			
		}
	</script>
	
</body>
</html>