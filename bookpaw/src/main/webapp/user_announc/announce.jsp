<%@page import="announce.DTO.Board"%>
<%@page import="java.util.List"%>
<%@page import="announce.Service.BoardServiceImpl"%>
<%@page import="announce.Service.BoardService"%>
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
<title>공지사항</title>
</head>

<html lang="en">
<head>
    <meta charset="UTF-8">
   <jsp:include page="/layout/meta.jsp"></jsp:include>
 	<jsp:include page="/layout/link.jsp"></jsp:include>
</head>
 	
<body>
      	<jsp:include page="/layout/header.jsp"></jsp:include>


    <!-- 게시판 컨텐츠 -->
    <div class="container adm">
        <div class="header">
            <h1 class="adm_title">공지사항</h1>
           <!--  <nav id="tab-button-nav">
              <div class="tab-button" data-tab-section="tab-section-1">공지사항</div>
            </nav> -->
        </div>
        <section id="tab-section-1" class="tab-section">
            <div class="adm_list">
                <table border="1" class="adm-table">
                    <colgroup>
                        <col width="2%"/>
                        <col width="10%"/>
                        <col width="55%"/>
                        <col width="13%"/>
                        <col width="10%"/>
                     <%--    <col width="10%"/> --%>
                    </colgroup>
                    <tr>
                       <!--  <th scope="col"><input type="checkbox"></th> -->
                        <th scope="col">no</th>
                        <th scope="col">제목</th>
                        <th scope="col">내용</th>  
                        <th scope="col">작성자</th>
                        <th scope="col">작성일</th>
                    </tr>
                    <% 
                        BoardService boardService = new BoardServiceImpl();
                        List<Board> boardList = boardService.list();
                        if( boardList == null || boardList.size() == 0 ) { %>
                            <tr>
                                <td colspan="5">조회된 게시글이 없습니다.</td>
                            </tr>
                        <% } else {
                            for(Board board : boardList) {
                        %>
                            <tr>
                               <!--  <th scope="col"><input type="checkbox"></th> -->
                                <td><%= board.getNo() %></td>
                                <td><a href="<%= request.getContextPath() %>/user_announc/read.jsp?no=<%= board.getNo() %>"><%= board.getTitle() %></a></td>
                                <td><%= board.getContent() %></td>
                                <td><%= board.getUserId() %></td>
                                <td><%= board.getRegDate() %></td>
                            </tr>
                        <% } 
                    } %>
                </table>
            </div>
        </section>


    </div>
	<!-- 푸터 -->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	
	<!-- 스크립트 -->
	<jsp:include page="/layout/script.jsp"></jsp:include>
<!--      <script src="../script/product.js"></script> -->
      <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
	
</body>
</html>
