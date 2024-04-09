<%@page import="Service.BookServiceImpl"%>
<%@page import="Service.BookService"%>
<%@page import="DTO.Book"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//필요한 정보  : 제목, 작성자, 분류, 도서번호, 수량, 날짜
	String reqNo = request.getParameter("no");
	int no = reqNo == null ? 0 : Integer.parseInt(reqNo);
	String bname = request.getParameter("bname");
    String isbn = request.getParameter("isbn");
    String author = request.getParameter("author");
    String category = request.getParameter("category");
    String make_Date = request.getParameter("make_Date");
    int total = Integer.parseInt(request.getParameter("total"));
    String text = request.getParameter("text");
	
    Book book = new Book(bname, isbn, author,  category,  make_Date,  total, text );
	book.setNo(no);
	
	BookService bookService = new BookServiceImpl();
	int result = bookService.update(book);
	
	String root = request.getContextPath();
	if( result > 0 ) {
		// 수정 성공
		response.sendRedirect(root + "/book/list.jsp");
	} else {
		// 수정 실패
		response.sendRedirect(root + "/book/update.jsp?no=" + no + "&msg=0");
	}
	
%>





