<%@page import="java.util.ArrayList"%>
<%@page import="DTO.Book"%>
<%@page import="java.util.List"%>
<%@page import="DAO.BookDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>도서 검색</title>
    <meta charset="UTF-8">
    <jsp:include page="/layout/meta.jsp"></jsp:include>
    <jsp:include page="/layout/link.jsp"></jsp:include>
</head>
<body>

<h2>도서 검색</h2>

<!-- 도서 검색 폼 -->
<form action="" method="get" id="bookSearch">
    <select name="key" id="searchKey">
        <option value="t">도서명</option>
        <option value="w">작가명</option>
    </select>
    <input type="text" name="query" id="searchQuery" placeholder="검색어를 입력해주세요.">
    <button type="submit" class="">검색</button>
</form>

<hr>

<%
    // DAO 인스턴스 생성
    BookDAO bookDAO = new BookDAO();

    // 사용자 입력값 가져오기
    String key = request.getParameter("key");
    String query = request.getParameter("query");

    // 사용자가 검색을 요청한 경우
    if (key != null && query != null) {
        // 도서 목록을 저장할 리스트
        List<Book> bookList = new ArrayList<>();

        // 도서 검색
        if (key.equals("t")) {
            // 도서명으로 검색
            bookList = bookDAO.searchByTitle(query);
        } else if (key.equals("w")) {
            // 작가명으로 검색
            bookList = bookDAO.searchByAuthor(query);
        }

        // 검색 결과가 있는 경우
        if (!bookList.isEmpty()) {
            %>
            <h3>검색 결과</h3>
            <table border="1" class="table_search">
                <tr>
                    <th class="th_bname ">도서명</th>
                    <th class="th_author">저자</th>
                    <th class="th_category">카테고리</th>
                    <!-- 필요한 다른 정보들도 표시할 수 있습니다. -->
                </tr>
                <%
                    // 검색 결과를 테이블에 출력
                    for (Book book : bookList) {
                        %>
                        <tr>
                            <!-- 각 게시물을 클릭하면 해당 게시물의 상세 정보 페이지로 이동 -->
                            <td class="td_bname"><a href="<%= request.getContextPath() %>/product_sub.jsp?no=<%= book.getNo() %>"><%= book.getBname() %></a></td>
                            <td class="td_author"><%= book.getAuthor() %></td>
                            <td class="td_category"><%= book.getCategory() %></td>
                            <!-- 필요한 다른 정보들도 표시할 수 있습니다. -->
                        </tr>
                        <%
                    }
                %>
            </table>
            <%
        } else {
            // 검색 결과가 없는 경우 메시지 출력
            %>
            <p>검색 결과가 없습니다.</p>
            <%
        }
    }
%>

<!-- 푸터 -->
<jsp:include page="../layout/footer.jsp"></jsp:include>

<!-- 스크립트 -->
<jsp:include page="/layout/script.jsp"></jsp:include>
<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>

</body>
</html>
