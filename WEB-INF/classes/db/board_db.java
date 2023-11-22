package db;

public class board_db {
	private int logid;
	private String log_title;
	private String writer;
	private String log_date;
	private String log_content;
	private int ans_st;
	public int getLogid() {
		return logid;
	}
	public void setLogid(int logid) {
		this.logid = logid;
	}
	public String getLog_title() {
		return log_title;
	}
	public void setLog_title(String log_title) {
		this.log_title = log_title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getLog_date() {
		return log_date;
	}
	public void setLog_date(String log_date) {
		this.log_date = log_date;
	}
	public String getLog_content() {
		return log_content;
	}
	public void setLog_content(String log_content) {
		this.log_content = log_content;
	}
	public int getAns_st() {
		return ans_st;
	}
	public void setAns_st(int ans_st) {
		this.ans_st = ans_st;
	}

}
