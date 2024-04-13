package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DTO.Book;
import DTO.Lent;
import DTO.Users;
import Service.BookService;
import Service.BookServiceImpl;
import Service.LentService;
import Service.LentServiceImpl;

/**
 * 대출 신청
 */
@WebServlet("/lent")
public class LentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private LentService lentService;
	private BookService bookService;
    public LentServlet() {
        super();
        lentService = new LentServiceImpl();
        bookService = new BookServiceImpl();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<Book> cartList = (List<Book>) session.getAttribute("cartList");
		PrintWriter writer = response.getWriter();
		
		String root = request.getContextPath();
		// 로그인 여부
		Users loginUser = (Users) session.getAttribute("loginUser");
		if( loginUser == null ) {
			writer.print("NO USER");
			return;
		}
		
		// 카트여부
		if( cartList == null ) {
			System.out.println("카트 없음");
			writer.print("FAIL");
			return;
		}
		
		for (int i = 0; i < cartList.size(); i++) {
			Book book = cartList.get(i);
			Lent lent = new Lent();
			
			lent.setIsbn( book.getIsbn() );
			lent.setBname( book.getBname() );
			lent.setUser_num( loginUser.getUser_num() );
			book.setIsbn(book.getIsbn());
			lentService.lent_insert(lent);
			bookService.lentTotal(book);
		}
		session.setAttribute("cartList", null);
		writer.print("SUCCESS");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}














