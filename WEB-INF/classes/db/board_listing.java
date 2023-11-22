package db;

import java.sql.*;
import java.util.ArrayList;

public class board_listing {
	private Connection connection;
	private ResultSet rs;
	
	public board_listing() {
		connection =  db_connect.getConnection();
	}
	
	public String getDate() {
		try {
			PreparedStatement pstmt = connection.prepareStatement("SELECT now()");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	public int getNum() {
		String qr = "SELECT logid FROM customer_log ORDER BY logid DESC";
		try {
			PreparedStatement pstmt = connection.prepareStatement(qr);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int write(String log_title, String userID, String log_content) {
		String qr = "INSERT INTO customer_log VALUES(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = connection.prepareStatement(qr);
			pstmt.setInt(1,  getNum());
			pstmt.setString(2, log_title);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, log_content);
			pstmt.setInt(6, 0);
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	public ArrayList<board_db> getList(int pageNum){
		String qr = "SELECT * FROM customer_log WHERE logid < ? ORDER BY logid DESC LIMIT 10";
		ArrayList<board_db> list = new ArrayList<board_db>();
		try {
			PreparedStatement pstmt = connection.prepareStatement(qr);
			pstmt.setInt(1,  getNum() - (pageNum -1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				board_db log = new board_db();
				log.setLogid(rs.getInt(1));
				log.setLog_title(rs.getString(2));
				log.setWriter(rs.getString(3));
				log.setLog_date(rs.getString(4));
				log.setLog_content(rs.getString(5));
				log.setAns_st(rs.getInt(6));
				list.add(log);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean nextPage(int pageNum) {
		String qr = "SELECT * FROM customer_log WHERE logid < ?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(qr);
			pstmt.setInt(1, getNum() - (pageNum -1)*10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public board_db getLog(int logid) {
		String qr = "SELECT * FROM customer_log WHERE logid = ?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(qr);
			pstmt.setInt(1, logid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				board_db bd = new board_db();
				bd.setLogid(rs.getInt(1));
				bd.setLog_title(rs.getString(2));
				bd.setWriter(rs.getString(3));
				bd.setLog_date(rs.getString(4));
				bd.setLog_content(rs.getString(5));
				return bd;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}