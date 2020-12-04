package com.webServer;

import java.sql.SQLException;

public class qnaDO {
	private String writer="";
	private String title="";
	private String content="";
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void SendToDAO() throws SQLException{
		serviceCenterDAO da = new serviceCenterDAO();
		da.inputQnaToDB(this.writer, this.title, this.content);
	}
}
