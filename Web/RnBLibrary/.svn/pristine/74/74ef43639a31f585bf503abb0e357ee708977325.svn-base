package Library.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Library.dto.NoticeDto;
import Library.util.Paging;

@Repository
public class NoticeDao {

	@Autowired SqlSession session;
	
	public int selectCntAll() {
		return session.selectOne("notice.selectCntAll");
	}
	
	public List<NoticeDto> selectPagingList(Paging paging) {
		return session.selectList("notice.selectPagingList", paging);
	}
	
	public NoticeDto selectView(NoticeDto notice) {
		return session.selectOne("notice.selectView", notice);
	}
	
	public int updateCnt(NoticeDto notice) {
		return session.update("notice.updateCnt", notice);
	}
	
	public int writeNotice(NoticeDto notice) {
		return session.insert("notice.insertNotice", notice);
	}
}
