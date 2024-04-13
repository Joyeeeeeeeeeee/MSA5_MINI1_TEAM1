<%@page import="DTO.Users"%>
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
    <title>도서 목록</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Comptible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/product.css">
 
    <script src="js/jquery-3.7-1.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="script/script.js"></script>
<!--     <script src="http://code.jquery.com/jquery-1.9.1.js"></script> -->
</head>
<body>
     <jsp:include page="/layout/header.jsp" />
     
     <script>
    $(document).ready(function() {
        $('.add-cart').click(function() {
            
        });
    });
</script>
    


<%

Users loginUser = (Users) session.getAttribute("loginUser");

if(loginUser == null){
    loginUser = new Users();
}

	String root = request.getContextPath();
	
    // 한 페이지당 보여줄 레코드 수
    int recordsPerPage = 12;
    
    // 현재 페이지 번호
    int currentPage;
    if(request.getParameter("currentPage") == null){
        currentPage = 1; // 디폴트로 1페이지를 보여줌
    } else {
        currentPage = Integer.parseInt(request.getParameter("currentPage")); // 요청된 페이지 번호를 가져옴
    }
    
    // BookService를 사용하여 도서 목록을 가져옴
    BookService bookService = new BookServiceImpl();
    List<Book> bookList = bookService.list();
    
    // 전체 도서 목록의 크기
    int rows = bookList.size();
    
    // 전체 페이지 수 계산
    int nOfPages = rows / recordsPerPage; // 전체 레코드 수를 한 페이지당 보여줄 레코드 수로 나눔
    if (rows % recordsPerPage > 0) {
        nOfPages++; // 남은 레코드가 한 페이지 이상인 경우 페이지 수를 하나 더 추가
    }
    
    // 현재 페이지에 보여줄 도서 목록(subList) 계산
    List<Book> subList;
    int startIndex = (currentPage - 1) * recordsPerPage; // 시작 인덱스 계산
    int endIndex = Math.min(startIndex + recordsPerPage, rows); // 끝 인덱스 계산
    subList = bookList.subList(startIndex, endIndex); // 전체 목록에서 해당 페이지에 해당하는 부분 목록을 가져옴
    
    // 페이지 당 보여줄 페이지 수 설정
    int pageLength = 5;
    int totalPages = (int) Math.ceil((double) rows / recordsPerPage); // 전체 페이지 수 계산
    int startPage = Math.max(1, currentPage - (pageLength / 2)); // 페이지 목록의 시작 페이지 계산
    int endPage = Math.min(startPage + pageLength - 1, totalPages); // 페이지 목록의 끝 페이지 계산
    if (endPage == totalPages && totalPages > pageLength) {
        startPage = endPage - pageLength + 1;
    }
%>
	<c:set var="root" value="<%= root %>"></c:set>
    
    <!-- 헤더 -->
    <jsp:include page="layout/link.jsp"></jsp:include>
    
    <!-- 컨텐츠 영역 -->
    
    <section class="shop container">
     <h2 class="section-title">도서 목록</h2>
     
     
      <%if(loginUser.getUser_level()==10){ %>
		<div class="btn_write">
			<a href="<%=request.getContextPath()%>/book_insert.jsp"><input
				type="button" name="" value="도서 등록"></a>
						</div>
							 <%} %>
     
     
     <div class="shop-container">
     <% if( bookService == null || subList.size() == 0 ) { %>
        <tr>
            <td colspan="5">조회된 게시글이 없습니다.</td>
        </tr>
        <% } else {
                for(Book book: subList) {
        %>
        <div class="shop-content">
            <div class="product-box">
                <a class="img-box" href="product_sub.jsp?no=<%= book.getNo() %>&img=<%= book.getFile_no() %>">
                	<img src="<%= request.getContextPath() %>/img?no=<%=book.getFile_no()%>" alt="" class="product-img">
                </a>
              <div class="txt_area">
                <h2 class="product-title"><%= book.getBname() %></h2>
                <span class="author"><%= book.getAuthor() %></span><br>
                <h5><%= book.getTotal() %>　권 보유중</h5>
                <i class='bx bxs-shopping-bag add-cart' data="<%= book.getIsbn() %>"></i>
              </div>  
            </div>
        </div>
        <%       }
            }
        %>
        
     </div>
   
<%-- 페이징 처리 --%>
<% if(nOfPages > 1){ %> <%-- 페이지가 1페이지 이상 존재할 때만 유효. --%>
    <ul class="pagination">
        <!-- 이전 페이지로 이동하는 버튼. 현재 페이지가 1페이지인 경우는 현재 페이지로 이동하도록 설정. -->
        <li class="page-item <%= currentPage == 1 ? "disabled" : "" %>">
            <a class="page-link" href="<%= currentPage == 1 ? "#" : request.getRequestURI() + "?currentPage=" + (currentPage - 1) %>">Previous</a>
        </li>
        <!-- 페이지 번호를 나타내는 버튼. 현재 페이지에 해당하는 버튼은 활성화된 상태로 표시. -->
        <% for(int i=1; i<=nOfPages; i++){ %>
            <li class="page-item <%= i == currentPage ? "active" : "" %>">
                <a class="page-link" href="<%= request.getRequestURI() %>?currentPage=<%= i %>"><%= i %></a>
            </li>
        <% } %>
        <!-- 다음 페이지로 이동하는 버튼. 현재 페이지가 마지막 페이지인 경우는 현재 페이지로 이동하도록 설정. -->
        <li class="page-item <%= currentPage == nOfPages ? "disabled" : "" %>">
            <a class="page-link" href="<%= currentPage == nOfPages ? "#" : request.getRequestURI() + "?currentPage=" + (currentPage + 1) %>">Next</a>
        </li>
    </ul>
<% } %>



    
    </section>

	<script>
		var root = "${ root }"
	</script>
    <script src="script/product.js"></script>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
    <!-- 푸터 -->
   	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>