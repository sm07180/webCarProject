package tip;

public class TTReplyVO {
	private int tt_id, tt_reply_id;
	private String user_id, tt_reply_content, tt_reply_date,car_nickname;
	
	public String getCar_nickname() {
		return car_nickname;
	}
	public void setCar_nickname(String car_nickname) {
		this.car_nickname = car_nickname;
	}
	public int getTt_id() {
		return tt_id;
	}
	public void setTt_id(int tt_id) {
		this.tt_id = tt_id;
	}
	public int getTt_reply_id() {
		return tt_reply_id;
	}
	public void setTt_reply_id(int tt_reply_id) {
		this.tt_reply_id = tt_reply_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getTt_reply_content() {
		return tt_reply_content;
	}
	public void setTt_reply_content(String tt_reply_content) {
		this.tt_reply_content = tt_reply_content;
	}
	public String getTt_reply_date() {
		return tt_reply_date;
	}
	public void setTt_reply_date(String tt_reply_date) {
		this.tt_reply_date = tt_reply_date;
	}
}
