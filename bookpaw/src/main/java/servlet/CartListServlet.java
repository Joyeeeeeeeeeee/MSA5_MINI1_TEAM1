package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import DTO.Book;

/**
 * 세션 카트 목록
 */
@WebServlet("/cartList")
public class CartListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public CartListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<Book> cartList = (List<Book>) session.getAttribute("cartList");
		
		List<Map<String, String>> cartMapList = new ArrayList<Map<String,String>>();
		
		PrintWriter writer = response.getWriter();
		if( cartList != null )
		for (Book cart : cartList) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("isbn", cart.getIsbn());
			map.put("title", cart.getBname());
			map.put("total", cart.getTotal()+"");
			cartMapList.add(map);
		}
		else {
			writer.print(0);
			return;
		}
			
		
		Map<String, List<Map<String, String>>> map = new HashMap<String, List<Map<String, String>>>();
		map.put("data", cartMapList);
		JSONObject json = new JSONObject(map);
		
		response.setContentType("application/json");
		writer.print(json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}







