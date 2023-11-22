package db;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class add_cart
 */
@WebServlet("/addCart")
public class add_cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public add_cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String userid = null;
		if(session.getAttribute("id") != null){
			userid = (String)session.getAttribute("id");
		}
		else {
			out.println("<script>alert('로그인 후 사용 가능합니다.');");
			out.println("location.href='log-in.jsp'</script>");
			return;
	    }
		ArrayList<item_db> list = (ArrayList<item_db>) session.getAttribute("cartlist");
		if (list == null) { 
			list = new ArrayList<item_db>();
			session.setAttribute("cartlist", list);
		}
		item_listing item_list = new item_listing();
		String category = request.getParameter("category");
		String itemid = request.getParameter("itemid");
		int st = Integer.parseInt(request.getParameter("pc"));
		item_list.insertList(list, category, itemid, st);
		
		String back = "itemView.jsp?category="+category+"&itemid="+itemid;
		session.setAttribute("cartlist", list);
		out.append("<!doctype html><html><head><title>추가 완료</title></head><body>")
		.append("<script>alert('장바구니에 추가 되었습니다.'); location.href='")
		.append(back)
		.append("';</script>")
		.append("</body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
