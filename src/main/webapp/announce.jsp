<%@page import="DTO.Users"%>
<%@page import="announce.DTO.Board"%>
<%@page import="announce.DAO.BoardDAO"%>
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
<style>
    table.adm-table {
        width: 100%;
        border-collapse: collapse;
    }
    table.adm-table th, table.adm-table td {
        padding: 10px;
        text-align: center;
    }
    table.adm-table th {
        background-color: #fff;
    }
    /* 각 열에 맞게 너비 조정 */
    table.adm-table col:nth-child(1) {
        width: 2%;
    }
    table.adm-table col:nth-child(2) {
        width: 10%;
    }
    table.adm-table col:nth-child(3) {
        width: 55%;
    }
    table.adm-table col:nth-child(4) {
        width: 13%;
    }
    table.adm-table col:nth-child(5) {
        width: 10%;
    }
</style>
</head>

<html lang="en">
<head>
    <meta charset="UTF-8">
   <jsp:include page="/layout/meta.jsp"></jsp:include>
 	<jsp:include page="/layout/link.jsp"></jsp:include>
 	
</head>
 	
<body>
      	<jsp:include page="/layout/header.jsp"></jsp:include>
<%
Users loginUser = (Users) session.getAttribute("loginUser");

if(loginUser == null){
    loginUser = new Users();
}

%>

    <!-- 게시판 컨텐츠 -->
    <div class="container adm">
        <div class="header">
            <h1 class="adm_title">공지사항</h1>
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
                                <td><a href="<%= request.getContextPath() %>/read.jsp?no=<%= board.getNo() %>"><%= board.getTitle() %></a></td>
                                <td><%= board.getContent() %></td>
                                <td><%= board.getUserId() %></td>
                                <td><%= board.getRegDate() %></td>
                            </tr>
                        <% } 
                    } %>
                </table>
            </div>
            
            		 <%if(loginUser.getUser_level()==10){ %>
						<div class="btn">
							<a href="<%=request.getContextPath()%>/insert.jsp"><input
								type="button" name="" value="글쓰기"></a>
						</div>
							 <%} %>
        </section>
				
				

    </div>
	<!-- 푸터 -->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	
	<!-- 스크립트 -->
	<jsp:include page="/layout/script.jsp"></jsp:include>
<!--      <script src="../script/product.js"></script> -->
      <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
	
</body>
</html>
