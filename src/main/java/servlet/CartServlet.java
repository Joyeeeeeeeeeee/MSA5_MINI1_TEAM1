package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DTO.Book;
import Service.BookService;
import Service.BookServiceImpl;

/**
 * 장바구니 추가 
 */
@WebServlet("/addCart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private BookService bookService;
	
    public CartServlet() {
        super();
        bookService = new BookServiceImpl();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String isbn = request.getParameter("isbn");
		String reqTotal = request.getParameter("total");
		String img = request.getParameter("img");
		PrintWriter writer = response.getWriter();
		int total = reqTotal == null ? 0 : Integer.parseInt( reqTotal );
		
		System.out.println("isbn : " + isbn);
		System.out.println("total : " + total);
		
		Book book = bookService.selectByISBN(isbn);
		book.setTotal(total);
		book.setFile(img);
		
		HttpSession session = request.getSession();
		
		List<Book> cartList = (List<Book>) session.getAttribute("cartList");
		if( cartList == null ) {
			System.out.println("카트 생성");
			writer.print("ADDCART");
			cartList = new ArrayList<Book>();
		}
		boolean duplicated = false;
		// 중복이면 수량 추가
		for (int i = 0; i < cartList.size(); i++) {
			String cartISBN = cartList.get(i).getIsbn();
			if( cartISBN != null && cartISBN.equals(isbn) ) {
				duplicated = true;
				int sum = cartList.get(i).getTotal() + total; 
				System.out.println("sum : " + sum);
				writer.print("ADDCART");
				cartList.get(i).setTotal(sum);
				break;
			}
		}
		// 중복이 아니면 추가
		if( !duplicated ) {
			System.out.println("카트 추가!!");
			writer.print("ADDCART");
			cartList.add(book);
		}
		
		session.setAttribute("cartList", cartList);

//		PrintWriter writer = response.getWriter();
		writer.print("SUCCESS");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}