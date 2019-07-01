package notify;

import java.sql.Date;

public class NotifyVO {
	private int notify_id,no,readcnt;
	private String notify_title,notify_content;
	private Date notify_date;
	
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public int getNotify_id() {
		return notify_id;
	}
	public void setNotify_id(int notify_id) {
		this.notify_id = notify_id;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}

	public String getNotify_title() {
		return notify_title;
	}
	public void setNotify_title(String notify_title) {
		this.notify_title = notify_title;
	}
	public String getNotify_content() {
		return notify_content;
	}
	public void setNotify_content(String notify_content) {
		this.notify_content = notify_content;
	}
	public Date getNotify_date() {
		return notify_date;
	}
	public void setNotify_date(Date notify_date) {
		this.notify_date = notify_date;
	}
	
	
	
	
	
}
