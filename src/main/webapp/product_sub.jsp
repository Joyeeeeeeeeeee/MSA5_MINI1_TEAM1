<%@page import="DTO.Users"%>
<%@page import="DTO.Book"%>
<%@page import="java.util.List"%>
<%@page import="Service.BookServiceImpl"%>
<%@page import="Service.BookService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<head>
<meta charset="UTF-8">
<jsp:include page="/layout/meta.jsp"></jsp:include>
<jsp:include page="/layout/link.jsp"></jsp:include>
</head>
<body>
   <jsp:include page="layout/header.jsp"></jsp:include>

   <%
   BookService bookService = new BookServiceImpl();
   int no = Integer.parseInt(request.getParameter("no"));
   int imgNo = Integer.parseInt(request.getParameter("img"));
   Book book = bookService.select(no);
   
   Users loginUser = (Users) session.getAttribute("loginUser");

   if(loginUser == null){
       loginUser = new Users();
   }
   %>

   <jsp:include page="layout/link.jsp"></jsp:include>

   <section class="py-5">
      <div class="container px-4 px-lg-5 my-5">
         <div class="row gx-4 gx-lg-5 align-items-center">
            <div class="col-md-5">
               <img class="card-img-top mb-5 mb-md-0" id="productImg" style="padding:5%;border: 5px solid #e9e9e9; border-radius: 23px;"
                  class="product-img"
                  src="<%=request.getContextPath()%>/img?no=<%=imgNo%>"
                  alt="..." />
            </div>
            <div class="col-md-6">
               <h1 class="display-5 fw-bolder">도서소개</h1>
               <div class="fs-5 mb-5">
                  <!--book.getBname()e() %> -->
                  <!-- <span class="author"book.getAuthor()r() %></span> -->
                  <span class="text-decoration-line-through">                
                  <i class='bx bxs-shopping-bag add-cart' data="<%= book.getIsbn() %>">
                  </i></span>
               </div>
                  <h1 class="product-title2"><%=book.getBname()%></h1>
               <div class="text"> <!-- -center --><br>
                  <div class="text-muted text-decoration-line-through">
                     <span class=""><b>작가</b> <%=book.getAuthor()%></span>
                  </div><br>
                  <div class="text-muted text-decoration-line-through">
                     <span class=""><b>분류</b> <%=book.getCategory()%></span>
                  </div><br>
                  <div class="text-muted text-decoration-line-through">
                     <span class=""><b>번호</b> <%=book.getIsbn()%></span>
                  </div><br>
                  <div class="text-muted text-decoration-line-through">
                     <span class=""><b>발행일</b> <%=book.getmake_Date()%></span>
                  </div><br>
                  <div class="text-muted text-decoration-line-through">
                     <span class=""><b>보유 수량</b> <%=book.getTotal()%></span>
                  </div><br>
               </div>
               <p class="fw-bolder form-control"><%=book.getText()%></p>
                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                <%if(loginUser.getUser_level()==10){ %>
                      <a class="btn btn-primary btn-lg px-4 me-sm-3" href="<%= request.getContextPath() %>/book_update.jsp?no=<%= book.getNo() %>">수정</a>
               <%} %>
                      <a class="btn btn-outline-light btn-lg px-4" href="product.jsp">목록</a>
<!--                       <a class="btn btn-outline-light btn-lg px-4" href="book/list.jsp"><input type="button" name="" value="도서 관리 페이지"></a> -->
                </div>
            </div>
         </div>
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
