package com.webServer;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.json.simple.JSONObject;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.simple.JSONArray;

public class serviceCenterDAO {
	DatabaseManager dm = new DatabaseManager();
	
	public String getAllResult() throws SQLException {
		ResultSet rs = dm.dbLoad("SELECT * FROM notice", null, "select");
		JSONArray result = new JSONArray();
		while(rs.next()) {
			JSONObject obj = new JSONObject();
			obj.put("nid", rs.getString("nid"));
			obj.put("title", rs.getString("title"));
			obj.put("writer", rs.getString("writer"));
			result.add(obj);
		}
		return result.toString();
	}
	public String getOneResult(String uid) throws SQLException {
        JSONObject parameters = new JSONObject();

        parameters.put("1", uid);
        //parameters.put("2", uid);
		ResultSet rs = dm.dbLoad("SELECT * FROM notice WHERE nid=?", parameters, "select");
		//rs.setString(1, uid);
        
		JSONArray result = new JSONArray();
		while(rs.next()) {
			JSONObject obj = new JSONObject();
			obj.put("nid", rs.getString("nid"));
			obj.put("title", rs.getString("title"));
			obj.put("writer", rs.getString("writer"));
			obj.put("content", rs.getString("content"));
			result.add(obj);
		}
		return result.toString();
	}
	public boolean inputReportToDB(String reporter_id, String accused_id, String title, String content) throws SQLException {
        JSONObject parameters = new JSONObject();
        parameters.put("1", reporter_id);
        parameters.put("2", accused_id);
        parameters.put("3", title);
        parameters.put("4", content);
        System.out.println("hello holy " + accused_id);
		ResultSet rs = dm.dbLoad("INSERT INTO report(reporter_id, accused_id, title, content, write_date) values(?,?,?,?,now())", parameters, "insert");
//		JSONArray result = new JSONArray();
//		while(rs.next()) {
//			JSONObject obj = new JSONObject();
//			obj.put("nid", rs.getString("nid"));
//			obj.put("title", rs.getString("title"));
//			obj.put("writer", rs.getString("writer"));
//			result.add(obj);
//		}
//		return result.toString();
		return true;
	}
}
