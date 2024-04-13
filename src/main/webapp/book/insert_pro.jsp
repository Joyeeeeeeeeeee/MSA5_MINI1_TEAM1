
<%@page import="DTO.Img"%>
<%@page import="Service.ImgServicelmpl"%>
<%@page import="Service.ImgService"%>
<%@page import="java.io.File"%>
<%@page import="java.util.UUID"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="Service.BookServiceImpl"%>
<%@page import="Service.BookService"%>
<%@page import="DTO.Book"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
DiskFileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);

//요청 파싱
List<FileItem> items = upload.parseRequest(request);
Map<String, String> fieldMap = new HashMap<>();
for (FileItem item : items) {
	if (item.isFormField()) {
		String fieldName = item.getFieldName();
		String fieldValue = item.getString("UTF-8");
		fieldMap.put(fieldName, fieldValue);
	} else {
		//fileName = item.getName();
	}
}

// 필요한 정보  : 제목, 작성자, 분류, 도서번호, 수량, 날짜
String bname = fieldMap.get("bname");
String author = fieldMap.get("author");
String category = fieldMap.get("category");
// String uniqueId = UUID.randomUUID().toString();
// String isbn = category + '_' + uniqueId;
String isbn = fieldMap.get("isbn");
String make_Date = fieldMap.get("make_Date");
String totalStr = fieldMap.get("total");
String text = fieldMap.get("text");
int total = 0;
if (totalStr != null && !totalStr.isEmpty()) {
	total = Integer.parseInt(totalStr);
}


Book book = new Book(bname, isbn, author, category, make_Date, total, text);

BookService bookService = new BookServiceImpl();
int result = bookService.insert(book);

String root = request.getContextPath();
if (result > 0) {
	// 등록 성공

	// 파일 저장 경로 설정
	String uploadPath = "C:\\upload\\"+isbn;

	// 디렉토리 생성
	File uploadDir = new File(uploadPath);
	if (!uploadDir.exists()) {
	    uploadDir.mkdir();
	}

	// 파일 저장
	for (FileItem item : items) {
	    if (!item.isFormField()) {
	        String fileName = new File(item.getName()).getName();
	        File storeFile = new File(uploadPath + File.separator + fileName);
	        item.write(storeFile);
	        
	        Img img = new Img();
	    	img.setFile_name(fileName);
	    	img.setImg_type(1);
	    	img.setIsbn(isbn);
	    	
	    	
	    	ImgService imgService = new ImgServicelmpl();
	    	int result2 = imgService.insert(img);
	        
	    }
	}
	
	
	
	response.sendRedirect(root + "/product.jsp");
} else {
	// 등록 실패
	response.sendRedirect(root + "/book/insert.jsp?msg=0");
}
%>