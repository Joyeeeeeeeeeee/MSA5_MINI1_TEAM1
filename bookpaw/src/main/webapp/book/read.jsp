<%@page import="DTO.Book"%>
<%@page import="Service.BookService"%>
<%@page import="Service.BookServiceImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Comptible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="../css/product.css">
    <script src="js/jquery-3.7-1.js"></script>
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <jsp:include page="/layout/header.jsp"></jsp:include>
</head>
<body>
<%
		BookService bookService = new BookServiceImpl();
		int no = Integer.parseInt( request.getParameter("no") );
		Book book = bookService.select(no);
		
%>
	<% if( book != null || book.getNo() > 0 ) { %>
<form action="<%= request.getContextPath()%>/book/insert_pro.jsp">
   <header>
     <div class="nav container">
    </div>
   </header>

   <section class="shop container">
     <h2 class="section-title">도서 정보 조회</h2>
     
     <div class="shop-content">
         <div class="product-box">
            <img src="" alt="" class="product-img">
            <h2 class="product-title">aeroready shirt</h2>
        </div>
        
        <div class="shop-content-list">
            <div class="product-box">
                <label>책제목</label>
                  <input type="text" name="bname" value="<%= book.getBname() %>" class="product_txt" readonly>
                <label>고유번호</label>
                  <input type="text" name="isbn" value="<%= book.getIsbn() %>" class="product_txt" readonly>
                <label>작가</label>
                  <input type="text" name="author" value="<%= book.getAuthor() %>" class="product_txt" readonly>
                <label>분류</label>
                  <input type="text" name="category" value="<%= book.getCategory() %>" class="product_txt" readonly>
                <label>발행일자</label>
                  <input type="text" name="make_Date" value="<%= book.getmake_Date() %>" class="product_txt" readonly>
                <label>수량</label>
                   <input type="number" name="total" value="<%= book.getTotal() %>" placeholder="수량" class="product_txt" readonly>
                <label>책표지</label>
                   <form action="../fileupload01_pro.jsp" method="post" enctype="multipart/form-data"> 
	                   <input type="file" name="file1" value="" id="file1" class="product_txt" />
	                   <input type="submit" value="업로드" />
                   </form>
                   <img id="previewImage" src="#" alt="책 표지 미리보기" style="display:none;"> 
                <label>책 내용</label>
                <input type="text" name="text" value="<%= book.getText() %>" class="product_txt" id="textarea" readonly>
           </div>
           <div class="btn">
            <a href="<%= request.getContextPath() %>/book/update.jsp?no=<%= book.getNo() %>"><input type="button" name="" value="수정"></a>
           <a href="list.jsp"><input type="button" name="" value="목록"></a>
        </div>
       
   </section>

      <script src="script/product.js"></script>
      <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
       </form>
       <% } else { %>
		<h3>조회된 게시글이 없습니다.</h3>
	<% } %>
</body>
</html>