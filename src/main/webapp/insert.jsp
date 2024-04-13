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
   <jsp:include page="/layout/meta.jsp"></jsp:include>
    <jsp:include page="/layout/link.jsp"></jsp:include>
<title>게시글 쓰기</title>
</head>
<body>

   <jsp:include page="/layout/header.jsp"></jsp:include>
<div class="wrap">
 <div class="container">
   <h1 style="text-align: center;">게시글 쓰기</h1>
   
   <form action="<%= request.getContextPath()%>/announce/insert_pro.jsp">
      <!-- update.jsp table 태그 -->
      <table border="1" class="adm-section">
      <colgroup>
        <col width="20%" />
      <col width="80%" />
      </colgroup>
         <tr>
            <th>제목</th>
            <td>
               <input type="text" name="title" value="" style="width:100%; padding: 10px; width: 100%; border-radius: 10px;">
            </td>
         </tr>   
         <tr>
            <th>작성자</th>
            <td>
               <input type="text" name="userId" value="" style="width:100%; padding: 10px; width: 100%;border-radius: 10px;"/>
            </td>
         </tr>   
         <tr>
            <th>내용</th>
            <td>
               <textarea rows="5" cols="40" name="content" style="width:100%;padding: 10px; width: 100%; border-radius: 10px;"></textarea>
            </td>
         </tr>   
      </table>
      <div class="btn">
      <input type="submit" value="등록" /> </div>
   </form>
   </div>
</div>


   <jsp:include page="layout/footer.jsp"></jsp:include>
   
</body>
</html>