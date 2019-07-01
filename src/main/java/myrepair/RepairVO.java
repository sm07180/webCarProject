package myrepair;

public class RepairVO {
	private String repair_id, repair_name, repair_term, repair_mile;
	private String goal_date, left_date, left_mileage, diff_mileage, repair_comment;
	private String recent_mileage;
	
	public String getRecent_mileage() {
		return recent_mileage;
	}
	public void setRecent_mileage(String recent_mileage) {
		this.recent_mileage = recent_mileage;
	}
	public String getRepair_comment() {
		return repair_comment;
	}
	public void setRepair_comment(String repair_comment) {
		this.repair_comment = repair_comment;
	}
	public String getDiff_mileage() {
		return diff_mileage;
	}
	public void setDiff_mileage(String diff_mileage) {
		this.diff_mileage = diff_mileage;
	}
	public String getLeft_mileage() {
		return left_mileage;
	}
	public void setLeft_mileage(String left_mileage) {
		this.left_mileage = left_mileage;
	}
	public String getRepair_id() {
		return repair_id;
	}
	public void setRepair_id(String repair_id) {
		this.repair_id = repair_id;
	}
	public String getRepair_name() {
		return repair_name;
	}
	public void setRepair_name(String repair_name) {
		this.repair_name = repair_name;
	}
	public String getRepair_term() {
		return repair_term;
	}
	public void setRepair_term(String repair_term) {
		this.repair_term = repair_term;
	}
	public String getRepair_mile() {
		return repair_mile;
	}
	public void setRepair_mile(String repair_mile) {
		this.repair_mile = repair_mile;
	}
	public String getGoal_date() {
		return goal_date;
	}
	public void setGoal_date(String goal_date) {
		this.goal_date = goal_date;
	}
	public String getLeft_date() {
		return left_date;
	}
	public void setLeft_date(String left_date) {
		this.left_date = left_date;
	}
}
