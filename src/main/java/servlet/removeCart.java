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
 * 장바구니 삭제
 */
@WebServlet("/removeCart")
public class removeCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public removeCart() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		String bname = request.getParameter("bname");
		System.out.println(bname);
		PrintWriter writer = response.getWriter();

		HttpSession session = request.getSession();
		List<Book> cartList = (List<Book>) session.getAttribute("cartList");
		

		if ( cartList != null ) {
			for (int i = 0; i < cartList.size(); i++) {
				String cartBname = cartList.get(i).getBname();
				if( bname.equals( cartBname ) ) {
					cartList.remove(i);
					System.out.println("카트에서 삭제");
				}
			}
		}
		session.setAttribute("cartList", cartList);
		writer.print("SUCCESS");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
