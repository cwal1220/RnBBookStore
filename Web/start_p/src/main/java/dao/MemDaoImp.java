package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.MemDTO;

public class MemDaoImp implements MemDAO{
	
	private SqlSessionTemplate sqlSession;
	
	 public MemDaoImp() {
	 }
	
	 public void setSqlSession(SqlSessionTemplate sqlSession) {
			this.sqlSession = sqlSession;
		}
	   
	@Override
	public void insert(MemDTO dto) {
		sqlSession.insert("join.insert",dto);
	}
/*	
	@Override
	public List<MemDTO> listmem() {
	 	//System.out.println(sqlSession.selectList("fnq.list",pv).size());
		return sqlSession.selectList("join.list",pv); 
	}
*/ 	
/*
	@Override
	public FnqDTO content(int num) {
		return sqlSession.selectOne("fnq.content",num); 
	}

	

	@Override 
	public int countdata() { 
		return sqlSession.selectOne("fnq.count");
	}

	@Override
	public void delete(int num) { 
		sqlSession.delete("fnq.delete",num);
	}

	@Override
	public FnqDTO updateNum(int fnqNum) { 
		System.out.println(fnqNum);
		return sqlSession.selectOne("fnq.content",fnqNum); 
	}

	@Override
	public void update(FnqDTO dto) {
		sqlSession.update("fnq.update", dto); 
		
	}

*/
	



	

	 
	
}
 