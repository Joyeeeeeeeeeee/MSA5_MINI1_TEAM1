<%@page import="Service.BookService"%>
<%@page import="Service.BookServiceImpl"%>
<%@page import="Service.UserServiceImpl"%>
<%@page import="Service.UserService"%>
<%@page import="DTO.Users"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="Service.LentServiceImpl"%>
<%@page import="Service.LentService"%> 
<%@page import="DTO.Lent"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String mode = request.getParameter("mode");

if(mode.equals("lent_update")){
	int num = Integer.parseInt(request.getParameter("num").replace("&quot;", ""));
	String status = request.getParameter("status").replace("&quot;", "");
	String book = request.getParameter("book").replace("&quot;", "");
	String isbn = request.getParameter("isbn").replace("&quot;", "");
	
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	Date lateDate = formatter.parse(request.getParameter("lateDate").replace("&quot;", ""));
	Date lentDate = formatter.parse(request.getParameter("lentDate").replace("&quot;", ""));
	 
	 
	
	Lent lent = new Lent();
	lent.setBname(book);
	lent.setLent_num(num);
	lent.setLate_date(lateDate);
	lent.setLent_date(lentDate);
	lent.setIsbn(isbn);
	lent.setStatus(status);
	
	
	
	LentService lentService = new LentServiceImpl();
	int result = lentService.lent_update(lent);
	
	out.print(result);
	
	return ;
}
//반납 처리

if(mode.equals("lent_return")){
	int num = Integer.parseInt(request.getParameter("num").replace("&quot;", ""));	
	String isbn = request.getParameter("isbn").replace("&quot;", "");
	LentService lentService = new LentServiceImpl();
	BookService bookService = new BookServiceImpl();
	int result = lentService.lent_return(num);
	int result2 = bookService.returnTotal(isbn);
	out.print(result);
	
	return ;
}


if(mode.equals("lent_delete")){
	int num = Integer.parseInt(request.getParameter("num").replace("&quot;", ""));	
	LentService lentService = new LentServiceImpl();
	int result = lentService.lent_delete(num);
	
	out.print(result);
	
	return ;
}




if(mode.equals("user_update")){
	int num = Integer.parseInt(request.getParameter("num").replace("&quot;", ""));
	String name = request.getParameter("name").replace("&quot;", "");
	String birth = request.getParameter("birth").replace("&quot;", "");
	String address = request.getParameter("address").replace("&quot;", "");
	String phone = request.getParameter("phone").replace("&quot;", "");
	int user_level = Integer.parseInt(request.getParameter("user_level").replace("&quot;", ""));
	
	Users user = new Users();
	user.setUser_num(num);
	user.setName(name);
	user.setBirth(birth);
	user.setAddress(address);
	user.setPhone(phone);
	user.setUser_level(user_level);
	
	
	
	UserService userService = new UserServiceImpl();
	int result = userService.user_update(user);
	
	out.print(result);
	
	return ;
}


if(mode.equals("user_delete")){
	int num = Integer.parseInt(request.getParameter("num").replace("&quot;", ""));	
	LentService lentService = new LentServiceImpl();
	int result = lentService.lent_delete(num);
	
	out.print(result);
	
	return ;
}
%>
