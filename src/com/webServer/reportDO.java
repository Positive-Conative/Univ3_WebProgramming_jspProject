package com.webServer;

import java.sql.SQLException;

public class reportDO {
	private String reporter="";
	private String accused="";
	private String title="";
	private String content="";
	
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public String getAccused() {
		return accused;
	}
	public void setAccused(String accused) {
		this.accused = accused;
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
		da.inputReportToDB(this.reporter, this.accused, this.title, this.content);
	}
}
