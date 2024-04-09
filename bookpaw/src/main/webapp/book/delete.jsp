<%@page import="Service.BookServiceImpl"%>
<%@page import="Service.BookService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String reqNo = request.getParameter("no");
	int no = reqNo == null ? 0 : Integer.parseInt(reqNo);
	
	BookService bookService = new BookServiceImpl();
	int result = bookService.delete(no);
	
	String root = request.getContextPath();
	if( result > 0 ) {
		// 삭제 성공 -> 목록으로 이동
		response.sendRedirect(root + "/book/list.jsp");
	}
	else {
		// 삭제 실패 -> 수정으로 이동
		response.sendRedirect(root + "/book/update.jsp?no=" + no);
	}
	
	

%>


