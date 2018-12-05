package dto;

public class USERS {

	private String u_id;		//id
	private String u_name;		//이름
	private String u_tel;		//전화번호
	private String u_addr;		//주소
	private String u_dept;		//부서
	private String u_rank;		//직급
	
	@Override
	public String toString() {
		return "USERS [u_id=" + u_id + ", u_name=" + u_name + ", u_tel=" + u_tel + ", u_addr=" + u_addr + ", u_dept="
				+ u_dept + ", u_rank=" + u_rank + "]";
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_tel() {
		return u_tel;
	}

	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}

	public String getU_addr() {
		return u_addr;
	}

	public void setU_addr(String u_addr) {
		this.u_addr = u_addr;
	}

	public String getU_dept() {
		return u_dept;
	}

	public void setU_dept(String u_dept) {
		this.u_dept = u_dept;
	}

	public String getU_rank() {
		return u_rank;
	}

	public void setU_rank(String u_rank) {
		this.u_rank = u_rank;
	}
	
}
