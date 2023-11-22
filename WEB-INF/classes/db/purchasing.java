package db;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class purchasing
 */
@WebServlet("/purchasing")
public class purchasing extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public purchasing() {
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
		String purchased = "";
		ArrayList<item_db> list = null;
		String userid = (String)session.getAttribute("id");
		String addr1 = null;
		String addr2 = null;
		int u_pt = Integer.parseInt(request.getParameter("points"));
		if(session.getAttribute("cartlist") == null) {
			out.append("<!doctype html><html><head><title>구매 실패</title></head><body>")
			.append("<script>alert('구매할 아이템이 없습니다.'); history.back();</script>")
			.append("</body></html>");
			return;
		}
		list = (ArrayList<item_db>)session.getAttribute("cartlist");
		Connection connection = db_connect.getConnection();
		PreparedStatement pstmt;
		String qr2 = "SELECT addr1, addr2, points FROM account WHERE userid = ?";
		ResultSet rs;
		int p_old = 0;
		int p_new = 0;
		for(int i=0; i<list.size(); i++) {
			String id = list.get(i).getItemid();
			String category = list.get(i).getCategory();
			String itemName = list.get(i).getItemname();
			int pc = list.get(i).getStock();
			int stock = 0;
			try {
				String sql = "SELECT stock FROM "+ category + " WHERE itemid = ?";
				pstmt = connection.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					stock = rs.getInt(1);
				}
				stock = stock - pc;
				String qr = "UPDATE " + category + " SET stock = " + stock + " WHERE itemid = ?";
				pstmt = connection.prepareStatement(qr);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if(i == 0) {
				purchased += itemName;
			}else {
				purchased += "," + itemName;
			}
		}
		try {
			pstmt = connection.prepareStatement(qr2);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				addr1 = rs.getString(1);
				addr2 = rs.getString(2);
				p_old = rs.getInt(3);
			}
			p_new = p_old - u_pt;
			String qr3 = "UPDATE account SET points = " + p_new + " WHERE userid = ?";
			pstmt = connection.prepareStatement(qr3);
			pstmt.setString(1, userid);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			int s_id = 0;
			pstmt = connection.prepareStatement("SELECT count(*) FROM shipping_stat");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				s_id = rs.getInt(1);
			}
			pstmt = connection.prepareStatement("INSERT INTO shipping_stat VALUES(?, ?, ?, ?, ?, ?)");
			pstmt.setInt(1, s_id+1);
			pstmt.setString(2, userid);
			pstmt.setString(3, purchased);
			pstmt.setString(4, addr1);
			pstmt.setString(5, addr2);
			pstmt.setInt(6, 0);
			pstmt.executeUpdate();
			
			session.removeAttribute("cartlist");
			out.append("<!doctype html><html><head><title>구매 완료</title></head><body>")
			.append("<script>alert('구매가 완료 되었습니다.'); location.href='cart.jsp'; </script>")
			.append("</body></html>");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
