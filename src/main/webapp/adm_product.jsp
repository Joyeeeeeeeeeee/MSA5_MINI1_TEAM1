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
    <link rel="stylesheet" href="css/product.css">
    <script src="js/jquery-3.7-1.js"></script>
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
</head>
<body>
  

   <section class="shop container">
     <h2 class="section-title">shop pruducts</h2>
     <div class="shop-content">
         <div class="product-box">
            <img src="img/book01.jpg" alt="" class="product-img">
            <h2 class="product-title">aeroready shirt</h2>
            <span class="price">₩3000</span>
            <i class='bx bxs-shopping-bag add-cart'></i>
        </div>
        <div class="shop-content-list">
            <div class="product-box">
                <label>수량</label>
                   <input type="number" name="" value="" placeholder="수량" class="product_txt">
                <label>게시물 번호</label>
                  <input type="text" name="" value="" placeholder="게시물 번호"class="product_txt">
                <label>책제목</label>
                  <input type="text" name="" value="" placeholder="책제목"class="product_txt">
                <label>작가</label>
                  <input type="text" name="" value="" placeholder="작가"class="product_txt">
                <label>분류</label>
                  <input type="text" name="" value="" placeholder="분류"class="product_txt">
                <label>발행일자</label>
                  <input type="text" name="" value="" placeholder="발행일자"class="product_txt">
                <label>고유번호</label>
                  <input type="text" name="" value="" placeholder="고유번호"class="product_txt">
                <label>책 소개</label>
                <textarea></textarea> 
           </div>
           <div class="btn">
            <input type="button" name="" value="삭제">
            <input type="button" name="" value="저장">
           <a href="/adm_sub.html"><input type="button" name="" value="수정"></a>
           <a href="/adm.html"><input type="button" name="" value="목록"></a>
        </div>
   </section>

      <script src="script/product.js"></script>
      <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
</body>
</html>