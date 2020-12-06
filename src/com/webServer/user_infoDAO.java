package com.webServer;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.json.simple.JSONObject;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.tomcat.dbcp.dbcp2.SQLExceptionList;
import org.json.simple.JSONArray;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.Base64;

public class user_infoDAO {
	DatabaseManager dm = new DatabaseManager();
	
	public static String encrypt(String str) {
        byte[] crypted = null;
        String key = "webprogramming";
        String iv = key.substring(0, 16);
        try {
 
            SecretKeySpec skey = new SecretKeySpec(key.getBytes(), "AES");
 
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, skey, new IvParameterSpec(iv.getBytes()));
            crypted = cipher.doFinal(str.getBytes("UTF-8"));
        } catch(Exception e) {
            System.out.println(e.toString());
        }
 
        String enStr = new String(Base64.encodeBase64(crypted));
 
        return enStr;
    }
	
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