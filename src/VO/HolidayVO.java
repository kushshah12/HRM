package VO;

import java.util.Date;

public class HolidayVO {
	int id;
	String leaveName;
	String date;
	String remark;
	String leaveCastegory;
	String fyear;
	
	public String getFyear() {
		return fyear;
	}
	public void setFyear(String fyear) {
		this.fyear = fyear;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLeaveName() {
		return leaveName;
	}
	public void setLeaveName(String leaveName) {
		this.leaveName = leaveName;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getLeaveCastegory() {
		return leaveCastegory;
	}
	public void setLeaveCastegory(String leaveCastegory) {
		this.leaveCastegory = leaveCastegory;
	}
	
	
	
}
