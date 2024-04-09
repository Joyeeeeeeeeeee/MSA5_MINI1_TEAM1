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
%>
<c:set var="root" value="<%= root %>"></c:set>
   <script src="script/header.js" defer></script>

   <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
   <script src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
	<style>
		/* reset */
		* { margin: 0; padding: 0; box-sizing: border-box; }
		a { text-decoration: none;  }
		ul { list-style-type: none; }
		header {
			margin:0;
/* 			background-color:grey !important; */
			align-items: center !important;
			
/* 			color:black !important; */
		}	

		.navigation .logo {
			margin:0;
			padding:0;
/* 			color:black !important; */
			font-weight:bold;
			font-size:22px;
			border:none;
			text-decoration:none;
			align-items: center;
			text-align : center;
			
		}
		
		.navigation a {
			align-items: center;
			text-align : center;
		}

		

		
	</style>
   <header>
     <div class="nav-container">
        <nav class="navigation">
           <a href="#" class="logo">도서대출서비스</a>
            <ul class="nav_list">
            	<li><a href="main.jsp">소개</a></li>
            	<li><a href="product.jsp">대여</a></li>
            	<li><a href="announce.jsp">공지사항</a></li>
            	<li><a href="mypage.jsp">마이페이지</a></li>
            	<li><a href="adm.jsp">관리자 페이지</a></li>
            	<li><a href="<%=root%>/searched.jsp">검색</a></li> 
            </ul>
            <ul class="navbar_icon">
        	<box-icon type='solid' name='shopping-bag' id="cart-icon" color="white" ></box-icon>
<!--             <button class="btnLogin-popup"><a href="index.jsp">Login</a></button>  -->
            <li class="btnLogin-popup"><a href="index.jsp"><ion-icon name="person-outline"></ion-icon>
   				</a></li>
            </ul>
     	 </nav>
        <div class="cart">
            <h2 class="cart-title">나의책장</h2>
            content
            <div class="cart-content">
            	<c:forEach var="cart" items="${ cartList }">
            		<div class="cart-box" id="${ cart.bname }">
			            <img src="/bookpaw/img?no=0" alt="" class="cart-img">
			            <div class="detail-box">
				            <div class="cart-product-title">${ cart.bname }</div>
				            <div class="cart-price"></div>
				            <input type="number" class="cart-quantity" value="${ cart.total }">
			            </div>
			            <!--remove cart-->
			            <i class="bx bxs-trash-alt cart-remove"></i>
		            </div>
            		
            	</c:forEach>
            	
            </div>
            total
            <div class="total">
                <div class="total-title">total</div>
                <div class="total-price">0 <span>권</span></div>
            </div>
<!--             buy button -->
            <button type="button" class="btn-buy" onclick="goLent()">대출신청</button>
<!--             cart close -->
            <i class='bx bx-x' id="close-cart"></i>
        </div>
        <a href="#" class="navbar_toogleBtn">
			<ion-icon name="menu-outline"></ion-icon>
		</a>
    </div>
   </header>
   
   
   
   
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
   
   
   
   