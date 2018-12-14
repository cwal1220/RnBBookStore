package Library.service;

import java.util.List;

import Library.dto.BookDto;
import Library.util.PageDto;

public interface BookService {

	public void insert(BookDto dto);
	public BookDto select(int b_num);
	public List<BookDto> bookList(PageDto pv);
	public int countdata();
	public List<BookDto> search(String data);  
	public int updateBookStatus(BookDto book);
}
  