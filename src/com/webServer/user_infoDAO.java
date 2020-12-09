package com.webServer;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.json.simple.JSONObject;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import org.apache.tomcat.dbcp.dbcp2.SQLExceptionList;
import org.json.simple.JSONArray;

import java.security.MessageDigest;

public class user_infoDAO {
	DatabaseManager dm = new DatabaseManager();
	
	public static String encrypt(String planText) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			md.update(planText.getBytes());
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			StringBuffer hexString = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				String hex = Integer.toHexString(0xff & byteData[i]);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}
			return hexString.toString();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
	
	public String get_authority(String num) throws SQLException{
		
		JSONObject parameters = new JSONObject();
		
		String get_authority = null;
		parameters.put("1", num);
		ResultSet rs = dm.dbLoad("SELECT authority FROM user_info WHERE id=?", parameters, "select");
		while(rs.next()) {
			get_authority = rs.getString("authority");
		}
		
		return get_authority;
	}
	
	public boolean change_info(String num, String pw, String name, String phone, String address) throws SQLException{
		JSONObject parameters = new JSONObject();
		
		//pw = encrypt(pw);
		
        parameters.put("1", pw);
        parameters.put("2", name);
        parameters.put("3", phone);
        parameters.put("4", address);
        parameters.put("5", num);
        
        ResultSet rs = dm.dbLoad("UPDATE user_info Set pw=?, name=?, phone=?, address=? WHERE id=?", parameters, "insert");
		
		return true;
	}
	
	public JSONObject get_info(String num) throws SQLException{ // 세션에서 num 받아오게 설정하기
		JSONObject parameters = new JSONObject();
		String get_id = null;
		String get_name = null;
		String get_phone = null;
		String get_address = null;
		parameters.put("1", num);
		ResultSet rs = dm.dbLoad("SELECT * FROM user_info WHERE id=?", parameters, "select");
		while(rs.next()) {
			get_id = rs.getString("id");
			get_name = rs.getString("name");
			get_phone = rs.getString("phone");
			get_address = rs.getString("address");
		}
		
		JSONObject result = new JSONObject();
		result.put("1", get_id);
		result.put("2", get_name);
		result.put("3", get_phone);
		result.put("4", get_address);
		
		return result;
	}
	
	public int signin(String id, String pw) throws SQLException{
		JSONObject parameters = new JSONObject();
		
		String get_id = null;
		String get_pw = null;
		String get_pvalue = null;
		
		//pw = encrypt(pw);
		
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
	
	public int signup(String id, String pw, String name, String phone) throws SQLException{
		JSONObject parameters_s = new JSONObject();
		
		JSONObject parameters = new JSONObject();
		
		System.out.println(id);
		System.out.println(pw);
		System.out.println(name);
		System.out.println(phone);
		
		pw = encrypt(pw);
		
		parameters_s.put("1", id);

		parameters.put("1", id);
    	parameters.put("2", pw);
        parameters.put("3", name);
        parameters.put("4", phone);
		
        String exist = null;
        
        ResultSet rs = dm.dbLoad("SELECT EXISTS(SELECT id FROM user_info WHERE id=?) AS isChk", parameters, "select");
        
        while(rs.next())
        {
        	exist = rs.getString("id");
        }
        
        if(exist.equals("1")){
        	return 2;
        }
        else if(exist.equals("0")){
        	
        	rs = dm.dbLoad("INSERT INTO user_info VALUES(?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT)", parameters, "insert");
        	
        	return 1;
        }
        else {
        	return 0;
        }
	}
	
	public String get_board(String id) throws SQLException{
		JSONObject parameters = new JSONObject();
		parameters.put("1", id);
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		ResultSet rs = dm.dbLoad("SELECT Num, Title, Date FROM board WHERE Writer=? ORDER BY Date DESC;", parameters, "select");
		JSONArray result = new JSONArray();
		while(rs.next()) {
			JSONObject obj = new JSONObject();
			obj.put("Num", rs.getString("Num"));
			obj.put("Title", rs.getString("Title"));
			obj.put("Date", fm.format(rs.getObject("Date")));
			result.add(obj);
		}
		System.out.println(result);
		return result.toString();
	}
	
	public String get_market(String id) throws SQLException{
		JSONObject parameters = new JSONObject();
		parameters.put("1", id);
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		ResultSet rs = dm.dbLoad("SELECT mid, Title, Date FROM market WHERE Writer=? ORDER BY Date DESC;", parameters, "select");
		JSONArray result = new JSONArray();
		while(rs.next()) {
			JSONObject obj = new JSONObject();
			obj.put("mid", rs.getString("mid"));
			obj.put("Title", rs.getString("Title"));
			obj.put("Date", fm.format(rs.getObject("Date")));
			result.add(obj);
		}
		System.out.println(result);
		return result.toString();
	}
}