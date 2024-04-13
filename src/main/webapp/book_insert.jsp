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
<link rel="stylesheet" href="css/product.css">
<script src="js/jquery-3.7-1.js"></script>
<jsp:include page="/layout/header.jsp"></jsp:include>
</head>
<body>

 <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <form  class="row" action="<%=request.getContextPath()%>/book/insert_pro.jsp"method="post" enctype="multipart/form-data">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image" style="background-image: url(img/1234.jpg);"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">도서등록</h1>
                            </div>
                            <form class="user">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label>책제목</label> 
                                     <input type="text" id="exampleFirstName" name="bname" value=""placeholder="책제목" class="form-control form-control-user product_txt"placeholder="First Name"> 
                                    </div>
                                    <div class="col-sm-6">
                                    <label>고유번호</label>
                              <input type="text" name="isbn" value="" placeholder="고유번호" id="exampleLastName"class="form-control form-control-user product_txt">
                                    </div>
                                </div>
                                <div class="form-group">
                                <label>작가</label> 
                                   <input type="text" id="exampleInputEmail" name="author" value="" placeholder="작가" class="form-control form-control-user product_txt">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label>분류</label> <input type="text"id="exampleInputPassword" name="category" value=""placeholder="분류" class="form-control form-control-user product_txt">
                                    </div>
                                    <div class="col-sm-6">
                                    <label>발행일자</label>
                               <input type="text"id="exampleRepeatPassword" name="make_Date" value="" placeholder="발행일자"class="form-control form-control-user product_txt"> 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">                           
                                   <label>수량</label> 
                                   <input type="number" id="exampleRepeatPassword" name="total" value="" placeholder="수량" class="form-control form-control-user product_txt">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label>책표지</label> 
                                    <input type="file" name="file1" value="" id="file1" class="form-control form-control-user product_txt" />
                                    </div> 
                                    <div class="col-sm-6">                          
                                   <!-- <label>업로드</label> 
                                   <input type="submit" name="" value="업로드" placeholder="업로드" class="form-control form-control-user product_txt"> -->
                                    </div>
                                </div>
                                <div class="form-group row" style="margin-bottom: 3%;">
                                    <div class="col-sm-12">
                                    <label>책소개</label> 
                                    <textarea name="text" class="form-control form-control-user product_txt" id="textarea" cols="50" rows="8"><c:out value="${content}" /></textarea> 
                                    </div>
                                </div>
                                <input class="btn btn-primary btn-user btn-block" style="smargin-top: 3%;" type="submit" value="등록" />
                                <hr>
                            </form>
                        </div>
                    </form>
                </div>
            </div>
        </div> 

   <script src="script/product.js"></script>
   <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>

</body>
</html>
