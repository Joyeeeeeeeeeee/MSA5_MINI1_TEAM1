<%@page import="DTO.Book"%>
<%@page import="java.util.List"%>
<%@page import="Service.BookServiceImpl"%>
<%@page import="Service.BookService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Comptible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/product.css">
    <script src="js/jquery-3.7-1.js"></script>
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>

<%
    BookService bookService = new BookServiceImpl();
    int no = Integer.parseInt(request.getParameter("no"));
    int imgNo = Integer.parseInt(request.getParameter("img"));
    Book book = bookService.select(no);
%>

<jsp:include page="layout/link.jsp"></jsp:include>

<section class="shop container">
    <h2 class="section-title">도서 소개</h2>
    <div class="shop-content">
        <div class="product-boxxx">
            <img id="productImg" src="<%= request.getContextPath() %>/img?no=<%= imgNo %>" alt="" class="product-img">
            <h2 class="product-title">
                <!-- <%= book.getBname() %> -->
                <!-- <span class="author"><%= book.getAuthor() %></span> -->
                <i class='bx bxs-shopping-bag add-cart'></i>
            </h2>
        </div>
        <div class="shop-content-list">
            <div class="product-boxx">
                <h1 class="product-title2"><%= book.getBname() %></h1>
                <span class="">작가 <b><%= book.getAuthor() %></b></span><br><br>
                <span class="">분류 <b><%= book.getCategory() %></b></span><br><br>
                <span class="">번호 <b><%= book.getIsbn() %></b></span><br><br>
                <span class="">발행일 <b><%= book.getmake_Date() %></b></span><br><br>
                <span class="">보유 수량 <b><%= book.getTotal() %></b></span><br>
                <br>
                <hr>
                <div class="list_txt2">
                    <b><h2>책 소개</h2></b>
                    <%= book.getText() %>
                </div>
            </div>
        </div>
    </section>

    <script src="script/product.js"></script>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
    <!-- 푸터 -->
    <jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>
