package com.webServer;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.json.simple.JSONObject;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.simple.JSONArray;

public class noticeDAO {
	DatabaseManager dm = new DatabaseManager();
	
	public String getAllResult() throws SQLException {
		ResultSet rs = dm.dbLoad("SELECT * FROM notice", null);
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
        
        parameters.put("uid", uid);
		ResultSet rs = dm.dbLoad("SELECT * FROM notice WHERE nid=?", parameters);
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
	
}
