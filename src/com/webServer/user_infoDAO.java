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
	
	public boolean change_info(String num, String pw, String name, String phone, String address) throws SQLException{
		JSONObject parameters = new JSONObject();
		
        parameters.put("1", pw);
        parameters.put("2", name);
        parameters.put("3", phone);
        parameters.put("4", address);
        parameters.put("5", num);
        
        ResultSet rs = dm.dbLoad("UPDATE user_info Set pw=?, name=?, phone=?, address=? WHERE id=?", parameters, "insert");
		
		return true;
	}
	
	public String get_num() throws SQLException{ // 세션에서 num 받아오게 설정하기
		String num = "20161468";
		JSONObject parameters = new JSONObject();
		String get_id = null;
		parameters.put("1", num);
		ResultSet rs = dm.dbLoad("SELECT * FROM user_info WHERE id=?", parameters, "select");
		while(rs.next()) {
			get_id = rs.getString("id");
		}
		return get_id;
	}
	
	public int signin(String id, String pw) throws SQLException{
		JSONObject parameters = new JSONObject();
		
		String get_id = null;
		String get_pw = null;
		String get_pvalue = null;
		parameters.put("1", id);
		ResultSet rs = dm.dbLoad("SELECT * FROM user_info WHERE id=?", parameters, "select");
		
		while(rs.next()) {
			get_id = rs.getString("id");
			get_pw = rs.getString("pw");
		}
		
		if(get_id.equals(id) && get_pw.equals(pw))
		{
			rs = dm.dbLoad("SELECT DATEDIFF((SELECT penalty FROM user_info WHERE id=?), NOW()) AS pvalue;", parameters, "select");
			while(rs.next()) {
				get_pvalue = rs.getString("pvalue");
			}
			if(Integer.parseInt(get_pvalue)>0) {
				return -1;
			}
			return 1;
		}
		else
		{
			return 0;
		}
	}
	
	public boolean signup(String id, String pw, String salt, String name, String phone, String address) throws SQLException{
		JSONObject parameters = new JSONObject();
		
		parameters.put("1", id);
        parameters.put("2", pw);
        parameters.put("3", salt);
        parameters.put("4", name);
        parameters.put("5", phone);
		
        ResultSet rs = dm.dbLoad("INSERT INTO user_info(id, pw, salt, name, phone) values(?, ?, ?, ?, ?)", parameters, "insert");
        
		return true;
	}
}