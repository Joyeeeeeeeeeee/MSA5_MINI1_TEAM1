<%@page import="DTO.Users"%>
<%@page import="DTO.Book"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String root = request.getContextPath();
    
    List<Book> cartList = (List<Book>) session.getAttribute("cartList");
    pageContext.setAttribute("cartList", cartList);
    
    Users loginUser = (Users) session.getAttribute("loginUser");

    if(loginUser == null){
        loginUser = new Users();
    }

    int level = loginUser.getUser_level();

%>


<c:set var="root" value="<%= root %>"></c:set>

   <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
   <script src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <head>
    <body>

        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content />
        <meta name="author" content />
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/stylesss.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    </head>
    
    
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
           <!-- Navigation-->
            <!-- BS5 에서는 fixed-top 을 주면 헤더 고정가능 -->
            <nav class="navbar navbar-expand-lg navbar-darks fixed-top" style="background:#FFE04A;display:fixed;top:0;left:0;z-index:9999">
                <div class="container px-5">
                    <a class="navbar-brand" href="<%=root %>/main.jsp"><img
					src="img/logo03.png" alt="..."></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" href="<%=root %>/main.jsp">메인</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=root %>/product.jsp">대여</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=root %>/searched.jsp">도서찾기</a></li>
						<li class="nav-item"><a class="nav-link" href="<%=root %>/announce.jsp">공지사항</a></li>
						
						
             			  <%if(loginUser.getId()!=null){ %>
						
						<li class="nav-item"><a class="nav-link" href="<%=root %>/mypage.jsp"><%=(level==10?"관리자":"마이") %>페이지</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">내책장</a>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="navbarDropdownBlog">
								<li><a class="dropdown-item" href="<%=root %>/mypage.jsp">마이페이지</a></li>
								<li><a class="dropdown-item" href="<%=root %>/blog-post.jsp">커뮤니티</a></li>
								<li><a class="dropdown-item" href="<%=root %>/lib/logout.jsp">로그아웃</a></li>
							</ul>
						</li>
						<%}else{ %>
						<li class="nav-item"><a class="nav-link" href="<%=root %>/index.jsp">로그인</a></li>
						<%} %>
                           <!--  <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio">
                                    <li><a class="dropdown-item" href="bookList.jsp">책장</a></li>
                                    <li><a class="dropdown-item" href=myBook.jsp>내서재</a></li>
                                </ul>
                            </li> -->
                        </ul>
                          <ul class="navbar_icon">
        	<box-icon type='solid' name='shopping-bag' id="cart-icon" color="white" ></box-icon>
<!--             <button class="btnLogin-popup"><a href="index.jsp">Login</a></button>  -->
<!--             <li class="btnLogin-popup"><a href="index.jsp"><ion-icon name="person-outline"></ion-icon> -->
<!--    				</a></li> -->
            </ul>
    </div>
            <div class="cart" style="background:#F5F7F8;box-shadow: -17px -10px 16px -13px #a1a1a1;">
            <h2 class="cart-title">나의책장</h2>
           <!--  content -->
            <div class="cart-content">
            	<c:forEach var="cart" items="${ cartList }">
            		<div class="cart-box" id="${ cart.bname }">
			          <img src="/team01/img?no=${ cart.file_no }" alt="" class="cart-img">
			            <div class="detail-box">
				            <div class="cart-product-title">${ cart.bname }</div>
<!-- 				            <div class="cart-price"></div> -->
				            <div class="cart-totla">1 권</div>
				            
			            </div>
			            <!--remove cart-->
			            <i class="bx bxs-trash-alt cart-remove" data="${ cart.bname }"></i>
		            </div>
            		
            	</c:forEach>
            	
            </div>
           <!--  total -->
           <!--  <div class="total">
                <div class="total-title">total</div>
                <div class="total-price">0 <span>권</span></div>
            </div> -->
<!--             buy button -->
            <div class="d-grid gap-3 justify-content-center">
    			<button class="btn btn-primary btn-lg px-4 me-sm-3 btn-buy" type="button" onclick="goLent()">대출신청</button>
			</div>
<!--             cart close -->
            <i class='bx bx-x' id="close-cart"></i>
        </div>
            </nav>
            // 화살표
      <div>
         <div class="fixed-top"style="height: 123px;background: transparent;">
         <button class="left_b"style="position: absolute; border: 0;left: 10%;
                   background: transparent; bottom: 0;" type="button" onclick="history.back()">
                   <box-icon name='left-arrow-alt'style="width: 45px; height: 45px;color:#FFE04A"></button>
         <button class="right_b"style="position: absolute; border: 0;right: 10%;
         background: transparent; bottom: 0;" type="button" onclick="history.forward()">
                <box-icon name='right-arrow-alt' style="width: 45px;
    height: 45px;color:#FFE04A"></box-icon></button>
          </div>
    </div>
            </main>
            </body>
            
            
<script>
   		var root = "${ root }"
   		// 대출 신청
   		function goLent() {
   			
   			const check = confirm('대출신청을 하시겠습니까?')
   			
   			if( !check ) return
   			
   			let url = root + "/lent"
   			
   			$.ajax({
   		        type            : 'GET',                 // 요청 메소드
   		        url             :  url,                    // 요청 URL
//    		        data            :  data,                   // 요청 데이터
   		        contentType     : 'application/json',      // 요청 데이터 타입
   		        dataType        : 'html',                 // 응답 데이터 타입
   		        // 요청 성공 
   		        success         : function(response, status) {
   		        	alert(response)
   		        	if( response == 'NO USER' ) {
   		        		alert("로그인이 필요합니다.")
   		        		location.href = root + "/index.jsp"
   		        	}
   		        	if( response == 'SUCCESS' ) {
   		        		location.href = root + "/mypage.jsp"
   		        	}
   		        },
   		        // 에러
   		        error           : function(xhr, status) {
   		            // xhr      : XMLHttpRequest 객체
   		            // status   : 응답 상태
   		            alert('에러 발생')
   		        }
   		        
   		    })
   			
   			
   		}
   
   </script>
   
   <%if(!request.getServletPath().equals("/main.jsp") && !request.getServletPath().equals("/blog-home.jsp") && !request.getServletPath().equals("/blog-post.jsp")){ %>
<script>
$("#navbarDropdownBlog").click(function(){
	$(this).toggleClass('show');
	$(".dropdown-menu").toggleClass('show');
});

$(".navbar-toggler").click(function(){
	$("#navbarSupportedContent").toggleClass('show');
});
</script>

   
<%}%>