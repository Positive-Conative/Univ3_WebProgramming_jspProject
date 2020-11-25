package com.webServer;
import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class DatabaseManager {
	 private Connection conn;
	 private PreparedStatement pstmt;
	 private ResultSet rs;
	 private String dbURL = "";
	 private String dbID = "";
	 private String dbPW = "";
	 
	 public DatabaseManager() {
		 dbURL = "jdbc:mysql://conative.myds.me:32773/Hoseo_World?serverTimezone=UTC&characterEncoding=utf8";
		 dbID = "root";
		 dbPW = "dudwoalswo12";
	 }
	 public ResultSet dbLoad(String sql, JSONObject parameters) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);
			pstmt = conn.prepareStatement(sql);
			if(parameters != null) {
		         pstmt.setString(1, parameters.get("uid").toString());
			}
			rs = pstmt.executeQuery();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	 }
	 
//	 public String LoadTest() {
//		JSONArray Jarray = new JSONArray();
//		try {
//				Class.forName("com.mysql.cj.jdbc.Driver");
//		        conn = DriverManager.getConnection(dbURL, dbID, dbPW);
//		        pstmt = conn.prepareStatement("SELECT * FROM notice");
//		        rs = pstmt.executeQuery();
//		        
//		        while(rs.next()) {
//		        	JSONObject obj = new JSONObject();
//		        	obj.put("title", rs.getString("title"));
//		            obj.put("writer", rs.getString("writer"));
//		            Jarray.add(obj);
//		        }
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//		return Jarray.toString();
//	 }
}
