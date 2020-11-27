package com.webServer;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.json.simple.JSONObject;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.tomcat.dbcp.dbcp2.SQLExceptionList;
import org.json.simple.JSONArray;

public class user_infoDAO {
	DatabaseManager dm = new DatabaseManager();
	
	public boolean signin(String id, String pw) throws SQLException{
		JSONObject parameters = new JSONObject();
		
		String get_id = null;
		String get_pw = null;
		
		parameters.put("1", id);
		ResultSet rs = dm.dbLoad("SELECT * FROM user_info WHERE id=?", parameters, "select");
		
		while(rs.next()) {
			get_id = rs.getString("id");
			get_pw = rs.getString("pw");
		}
		
		if(get_id.equals(id) && get_pw.equals(pw))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	public boolean signup(String id, String pw, String salt, String name, String phone, String address) throws SQLException{
		JSONObject parameters = new JSONObject();
		
		parameters.put("1", id);
        parameters.put("2", pw);
        parameters.put("3", salt);
        parameters.put("4", name);
        parameters.put("5", phone);
        parameters.put("6", address);
		
        ResultSet rs = dm.dbLoad("INSERT INTO user_info(id, pw, salt, name, phone, adress) values(?, ?, ?, ?, ?, ?)", parameters, "insert");
        
		return true;
	}
}