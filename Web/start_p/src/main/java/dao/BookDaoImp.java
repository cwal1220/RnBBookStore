package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BookDTO;
import dto.PageDTO;
 
public class BookDaoImp implements BookDAO{
	
	private SqlSessionTemplate sqlSession;
	
	 public BookDaoImp() { 
	 }
	
	 public void setSqlSession(SqlSessionTemplate sqlSession) {
			this.sqlSession = sqlSession;
		}
	   
	@Override
	public void insert(BookDTO dto) {
		sqlSession.insert("book.insert",dto);
	}
 
	@Override
	public BookDTO select(int b_num) {
		return sqlSession.selectOne("book.content",b_num);
	}

	@Override
	public List<BookDTO> bookList(PageDTO pv) {
		return sqlSession.selectList("book.listb",pv);
	}

	@Override
	public int countdata() {
		return sqlSession.selectOne("book.count");
	}

	@Override 
	public List<BookDTO> search(String data) {
			return sqlSession.selectList("book.listc", data);
	} 

}
