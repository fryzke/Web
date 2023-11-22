package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class item_listing {
	private Connection connection;
	private ResultSet rs;
	
	public item_listing() {
		connection =  db_connect.getConnection();
	}
	
	public void insertList(ArrayList<item_db> list, String category, String id, int pc){
		String sql = "SELECT itemid, itemname, price FROM " +category+" WHERE itemid = ?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				item_db item = new item_db();
				item.setItemid(rs.getString(1));
				item.setItemname(rs.getString(2));
				item.setStock(pc);
				item.setPrice(rs.getInt(3));
				item.setCategory(category);
				list.add(item);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
