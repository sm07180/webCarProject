package myrecord;

public class RecordVO {
	private String record_id, record_date, oil, oil_cost, repair_id, repair_cost,
			car_mileage, user_id, memo, station, year_month, repair_name, rank;
	private double avg_mileage;
	
	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getRepair_name() {
		return repair_name;
	}

	public void setRepair_name(String repair_name) {
		this.repair_name = repair_name;
	}

	public String getYear_month() {
		return year_month;
	}

	public void setYear_month(String year_month) {
		this.year_month = year_month;
	}

	public String getRecord_id() {
		return record_id;
	}

	public void setRecord_id(String record_id) {
		this.record_id = record_id;
	}

	public String getRecord_date() {
		return record_date;
	}

	public void setRecord_date(String record_date) {
		this.record_date = record_date;
	}

	public String getOil() {
		return oil;
	}

	public void setOil(String oil) {
		this.oil = oil;
	}

	public String getOil_cost() {
		return oil_cost;
	}

	public void setOil_cost(String oil_cost) {
		this.oil_cost = oil_cost;
	}

	public String getRepair_id() {
		return repair_id;
	}

	public void setRepair_id(String repair_id) {
		this.repair_id = repair_id;
	}

	public String getRepair_cost() {
		return repair_cost;
	}

	public void setRepair_cost(String repair_cost) {
		this.repair_cost = repair_cost;
	}

	public String getCar_mileage() {
		return car_mileage;
	}

	public void setCar_mileage(String car_mileage) {
		this.car_mileage = car_mileage;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getStation() {
		return station;
	}

	public void setStation(String station) {
		this.station = station;
	}

	public double getAvg_mileage() {
		return avg_mileage;
	}

	public void setAvg_mileage(double avg_mileage) {
		this.avg_mileage = avg_mileage;
	}
	
	
	
	
}
