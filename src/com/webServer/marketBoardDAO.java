package com.webServer;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import java.text.SimpleDateFormat;

public class marketBoardDAO {
	DatabaseManager dm = new DatabaseManager();
	
	public String getAllResult() throws SQLException {
		ResultSet rs = dm.dbLoad("SELECT * FROM market", null, "select");
		JSONArray result = new JSONArray();
		while(rs.next()) {
			JSONObject obj = new JSONObject();
			obj.put("mid", rs.getString("mid"));
			obj.put("Writer", rs.getString("Writer"));
			obj.put("Title", rs.getString("Title"));
			obj.put("Content", rs.getString("Content"));
			obj.put("Price", rs.getString("Price"));
			obj.put("Date", rs.getString("Date"));
			obj.put("Title", rs.getString("img_src"));

			
			result.add(obj);
		}
		return result.toString();
	}

public boolean inputmarketToDB(String Writer, String Title, String Price,String Content, String img_src) throws SQLException {
    JSONObject parameters = new JSONObject();
    parameters.put("1", Writer);
    parameters.put("2", Title);
    parameters.put("3", Content);
    parameters.put("4", Price);
    parameters.put("5", img_src);
//    System.out.println("hello holy " + accused_id);
	ResultSet rs = dm.dbLoad("INSERT INTO market(Writer,Title,Content,Price,Date,img_src) values(?,?,?,?,now(),?)", parameters, "insert");
//	JSONArray result = new JSONArray();
//	while(rs.next()) {
//		JSONObject obj = new JSONObject();
//		obj.put("nid", rs.getString("nid"));
//		obj.put("title", rs.getString("title"));
//		obj.put("writer", rs.getString("writer"));
//		result.add(obj);
//	}
//	return result.toString();
		return true;
	}
public String getOneMarketResults(String mid) throws SQLException {
    JSONObject parameters = new JSONObject();

    parameters.put("1", mid);
	SimpleDateFormat fm = new SimpleDateFormat("yy/MM/dd hh:MM");
	ResultSet rs = dm.dbLoad("SELECT * FROM market WHERE mid=?", parameters, "select");
    
	JSONArray result = new JSONArray();
	while(rs.next()) {
		JSONObject obj = new JSONObject();
		obj.put("mid", rs.getString("mid"));
		obj.put("Writer", rs.getString("Writer"));
		obj.put("Title", rs.getString("Title"));
		obj.put("Content", rs.getString("Content"));
		obj.put("Price", rs.getString("Price"));
		obj.put("Date", fm.format(rs.getObject("Date")));
		obj.put("img_src", rs.getString("img_src"));

		
		result.add(obj);
	}
	return result.toString();
}
}