package com.webServer;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.json.simple.JSONObject;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import org.json.simple.JSONArray;

public class adminDAO {
	DatabaseManager dm = new DatabaseManager();
	SimpleDateFormat fm = new SimpleDateFormat("yy/MM/dd hh:MM");
	
	public String qnaComment() throws SQLException {
		ResultSet rs = dm.dbLoad("SELECT * FROM qna WHERE admin_coment IS NULL ORDER BY DATE ASC", null, "select");
		JSONArray result = new JSONArray();
		while(rs.next()) {
			JSONObject obj = new JSONObject();
			obj.put("qid", rs.getString("qid"));
			obj.put("title", rs.getString("title"));
			obj.put("writer", rs.getString("writer"));
			obj.put("date", fm.format(rs.getObject("date")));
			
			result.add(obj);
		}
		return result.toString();
	}
	public boolean inputQnaDB(String qid, String admin_coment) throws SQLException {
        JSONObject parameters = new JSONObject();
        parameters.put("1", admin_coment);
        parameters.put("2", Integer.parseInt(qid));
		ResultSet rs = dm.dbLoad("UPDATE qna SET admin_coment=?, admin_date=NOW() WHERE qid=?", parameters, "insert");

		return true;
	}
	public String getReport() throws SQLException {
		ResultSet rs = dm.dbLoad("SELECT * FROM report ORDER BY write_date ASC", null, "select");
		JSONArray result = new JSONArray();
		while(rs.next()) {
			JSONObject obj = new JSONObject();
			obj.put("rid", rs.getString("rid"));
			obj.put("reporter_id", rs.getString("reporter_id"));
			obj.put("accused_id", rs.getString("accused_id"));
			obj.put("title", rs.getString("title"));
			obj.put("content", rs.getString("content"));
			obj.put("write_date", fm.format(rs.getObject("write_date")));
			
			result.add(obj);
		}
		return result.toString();
	}
	public String getOneReport(String rid) throws SQLException {
        JSONObject parameters = new JSONObject();

        parameters.put("1", rid);
		ResultSet rs = dm.dbLoad("SELECT * FROM report WHERE rid=?", parameters, "select");
        
		JSONArray result = new JSONArray();
		while(rs.next()) {
			JSONObject obj = new JSONObject();
			obj.put("rid", rs.getString("rid"));
			obj.put("reporter_id", rs.getString("reporter_id"));
			obj.put("accused_id", rs.getString("accused_id"));
			obj.put("title", rs.getString("title"));
			obj.put("content", rs.getString("content"));
			obj.put("write_date", fm.format(rs.getObject("write_date")));
			result.add(obj);
		}
		return result.toString();
	}
	public boolean inputUserDB(String id, int penalty) throws SQLException {
        JSONObject parameters = new JSONObject();
        if(penalty>0) {
            parameters.put("1", penalty);
            parameters.put("2", id);
            System.out.println(penalty+ id);
            ResultSet rs = dm.dbLoad("UPDATE user_info SET penalty=DATE_ADD(NOW(), INTERVAL ? DAY) WHERE id=?", parameters, "insert");
        }
		return true;
	}
}
