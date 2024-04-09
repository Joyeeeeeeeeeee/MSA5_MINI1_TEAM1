<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Comptible" content="IE-edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="../css/product.css">
<script src="js/jquery-3.7-1.js"></script>
<jsp:include page="/layout/header.jsp"></jsp:include>
</head>
<body>

	<section class="shop container">
		<form action="<%=request.getContextPath()%>/book/insert_pro.jsp"
			method="post" enctype="multipart/form-data">
			<h2 class="section-title">도서 등록</h2>

			<div class="shop-content">
				<div class="product-box">
					<img src="" alt="" class="product-img">
					<h2 class="product-title">aeroready shirt</h2>
				</div>

				<div class="shop-content-list">
					<div class="product-box">
						<label>책제목</label> <input type="text" name="bname" value=""
							placeholder="책제목" class="product_txt"> <label>고유번호</label>
						<input type="text" name="isbn" value="" placeholder="고유번호"
							class="product_txt"> <label>작가</label> <input type="text"
							name="author" value="" placeholder="작가" class="product_txt">
						<label>분류</label> <input type="text" name="category" value=""
							placeholder="분류" class="product_txt"> <label>발행일자</label>
						<input type="text" name="make_Date" value="" placeholder="발행일자"
							class="product_txt"> <label>수량</label> <input
							type="number" name="total" value="" placeholder="수량"
							class="product_txt"> <label>책표지</label> <input
							type="file" name="file1" value="" id="file1" class="product_txt" />
						<input type="submit" value="업로드" /> <img id="previewImage"
							src="#" alt="책 표지 미리보기" style="display: none;"> <label>책
							소개</label> <input type="text" name="text" value="" placeholder="내용"
							class="product_txt" id="textarea">
					</div>
					<div class="btn">
						<input type="submit" value="등록" />
					</div>
				</div>
				<!-- 					<a href="list.jsp"><input type="button" name="" value="목록"></a> -->
			</div>
		</form>
	</section>

	<script src="script/product.js"></script>
	<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>

</body>
</html>
