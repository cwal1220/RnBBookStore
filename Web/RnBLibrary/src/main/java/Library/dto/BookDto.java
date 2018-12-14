package Library.dto;

import org.springframework.web.multipart.MultipartFile;

public class BookDto {

	private int b_num;
	private String b_id;
	private String b_title;	
	private String b_auth;
    private int b_stat;
    private String b_pub;
	private String b_cont;	
	private String b_genre;
    private String b_date;  
	private String b_mainpic;  
	private MultipartFile b_mainpic_file;
	
	@Override
	public String toString() {
		return "BookDto [b_num=" + b_num + ", b_id=" + b_id + ", b_title=" + b_title + ", b_auth=" + b_auth
				+ ", b_stat=" + b_stat + ", b_pub=" + b_pub + ", b_cont=" + b_cont + ", b_genre=" + b_genre
				+ ", b_date=" + b_date + ", b_mainpic=" + b_mainpic + ", b_mainpic_file=" + b_mainpic_file + "]";
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_auth() {
		return b_auth;
	}

	public void setB_auth(String b_auth) {
		this.b_auth = b_auth;
	}

	public int getB_stat() {
		return b_stat;
	}

	public void setB_stat(int b_stat) {
		this.b_stat = b_stat;
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

	public String getB_date() {
		return b_date;
	}

	public void setB_date(String b_date) {
		this.b_date = b_date;
	}

	public String getB_mainpic() {
		return b_mainpic;
	}

	public void setB_mainpic(String b_mainpic) {
		this.b_mainpic = b_mainpic;
	}

	public MultipartFile getB_mainpic_file() {
		return b_mainpic_file;
	}

	public void setB_mainpic_file(MultipartFile b_mainpic_file) {
		this.b_mainpic_file = b_mainpic_file;
	}
	
}
