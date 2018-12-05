package dto;

import java.util.Date;

public class RENTALS {

	private String u_id;		//사용자 id
	private String b_id;		//책 id
	private Date r_date;		//대여일
	
	@Override
	public String toString() {
		return "RENTALS [u_id=" + u_id + ", b_id=" + b_id + ", r_date=" + r_date + "]";
	}
	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getB_id() {
		return b_id;
	}
	public void setB_id(String b_id) {
		this.b_id = b_id;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	
}
