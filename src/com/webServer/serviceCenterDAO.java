package com.webServer;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.json.simple.JSONObject;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
	
	public String get_time() {
		
		SimpleDateFormat fm = new SimpleDateFormat ( "yy/MM/dd/ HH:mm");
		
		Date time = new Date();
		
		return fm.format(time);
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
//        System.out.println("hello holy " + accused_id);
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
	public String getDevelopers() throws SQLException {
		ResultSet rs = dm.dbLoad("SELECT * FROM developers", null, "select");
		JSONArray result = new JSONArray();
		while(rs.next()) {
			JSONObject obj = new JSONObject();
			obj.put("name", rs.getString("name"));
			obj.put("age", rs.getString("age"));
			obj.put("student_num", rs.getString("student_num"));
			obj.put("target", rs.getString("target"));
			obj.put("hobby", rs.getString("hobby"));
			obj.put("Technology_Available", rs.getString("Technology_Available"));
			obj.put("interesting", rs.getString("interesting"));
			obj.put("note", rs.getString("note"));
			obj.put("img_src", rs.getString("img_src"));
			result.add(obj);
		}
		return result.toString();
	}
	public String getQnaResults() throws SQLException {
		ResultSet rs = dm.dbLoad("SELECT * FROM qna ORDER BY date DESC;", null, "select");
		JSONArray result = new JSONArray();
		
		while(rs.next()) {
			JSONObject obj = new JSONObject();
			obj.put("qid", rs.getString("qid"));
			obj.put("title", rs.getString("title"));
			obj.put("writer", rs.getString("writer"));
			obj.put("admin_coment", rs.getString("admin_coment"));
			result.add(obj);
		}
		return result.toString();
	}
	public String getOneQnaResult(String qid) throws SQLException {
        JSONObject parameters = new JSONObject();

        parameters.put("1", qid);
		SimpleDateFormat fm = new SimpleDateFormat("yy/MM/dd hh:MM");
		ResultSet rs = dm.dbLoad("SELECT * FROM qna WHERE qid=?", parameters, "select");
        
		JSONArray result = new JSONArray();
		while(rs.next()) {
			JSONObject obj = new JSONObject();
			obj.put("qid", rs.getString("qid"));
			obj.put("title", rs.getString("title"));
			obj.put("writer", rs.getString("writer"));
			obj.put("content", rs.getString("content"));
			obj.put("date", fm.format(rs.getObject("date")));
			obj.put("admin_coment", rs.getString("admin_coment"));
			if(rs.getObject("admin_date")!=null)
				obj.put("admin_date", fm.format(rs.getObject("admin_date")));
			result.add(obj);
		}
		return result.toString();
	}
	public boolean inputQnaToDB(String writer, String title, String content) throws SQLException {
        JSONObject parameters = new JSONObject();
        System.out.println("fda!!" + title);
        parameters.put("1", title);
        parameters.put("2", writer);
        parameters.put("3", content);
		ResultSet rs = dm.dbLoad("INSERT INTO qna(title, writer, content, date) values(?,?,?,now())", parameters, "insert");
		return true;
	}
}
