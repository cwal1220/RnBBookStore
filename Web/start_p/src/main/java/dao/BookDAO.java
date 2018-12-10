package dao;

import java.util.List;

import dto.BookDTO;
import dto.PageDTO;

public interface BookDAO {
	public void insert(BookDTO dto);
	public BookDTO select(int b_num);
	public List<BookDTO> bookList(PageDTO pv);
	public int countdata();
	public List<BookDTO> search(String data);  
}
