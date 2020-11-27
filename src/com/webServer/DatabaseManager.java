package com.webServer;
import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class DatabaseManager {
	 private Connection conn;
	 private PreparedStatement pstmt;
	 private ResultSet rs;
	 private int rs_insert;
	 private String dbURL = "";
	 private String dbID = "";
	 private String dbPW = "";
	 
	 public DatabaseManager() {
		 dbURL = "jdbc:mysql://conative.myds.me:32773/Hoseo_World?serverTimezone=UTC&characterEncoding=utf8";
		 dbID = "root";
		 dbPW = "dudwoalswo12";
	 }
	 @SuppressWarnings("unchecked")
	public ResultSet dbLoad(String sql, JSONObject parameters, String flag) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);
			pstmt = conn.prepareStatement(sql);
			if(parameters != null) {
//				System.out.println("asdf : " + parameters.keySet());
				parameters.forEach((key, value)
						-> {
							try {
								System.out.println(Integer.parseInt(key.toString()) +", "+ value.toString());
								pstmt.setString(Integer.parseInt(key.toString()), value.toString());
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						});
					    //-> System.out.println("key: " + key + ", value: " + value));
		         //pstmt.setString(1, parameters.get("uid").toString());
				
			}
			switch(flag) {
			case "select":
				rs = pstmt.executeQuery();
				break;
			case "insert":
				rs_insert = pstmt.executeUpdate();
				break;
			}
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
