package dto;

import java.util.Date;

public class BOOKS {

	private String b_id;	//id
	private String title;	//제목
	private String b_auth;	//저자
	private String b_pub;	//출판사
	private String b_cont;	//줄거리
	private String b_genre;	//장르
	private Date b_date;	//출간일
	private int b_stat;		//대여상태
	
	@Override
	public String toString() {
		return "BOOKS [b_id=" + b_id + ", title=" + title + ", b_auth=" + b_auth + ", b_pub=" + b_pub + ", b_cont="
				+ b_cont + ", b_genre=" + b_genre + ", b_date=" + b_date + ", b_stat=" + b_stat + "]";
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getB_auth() {
		return b_auth;
	}

	public void setB_auth(String b_auth) {
		this.b_auth = b_auth;
	}

	public String getB_pub() {
		return b_pub;
	}

	public void setB_pub(String b_pub) {
		this.b_pub = b_pub;
	}

	public String getB_cont() {
		return b_cont;
	}

	public void setB_cont(String b_cont) {
		this.b_cont = b_cont;
	}

	public String getB_genre() {
		return b_genre;
	}

	public void setB_genre(String b_genre) {
		this.b_genre = b_genre;
	}

	public Date getB_date() {
		return b_date;
	}

	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}

	public int getB_stat() {
		return b_stat;
	}

	public void setB_stat(int b_stat) {
		this.b_stat = b_stat;
	}
	
}
