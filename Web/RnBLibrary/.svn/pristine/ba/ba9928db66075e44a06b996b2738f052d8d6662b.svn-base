package Library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Library.dao.NoticeDao;
import Library.dto.NoticeDto;
import Library.util.Paging;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired NoticeDao noticeDao;

	public int selectCntAll() {
		return noticeDao.selectCntAll();
	}

	public List<NoticeDto> selectPagingList(Paging paging) {
		return noticeDao.selectPagingList(paging);
	}
	
	public NoticeDto selectView(NoticeDto notice) {
		return noticeDao.selectView(notice);
	}
	
	public int updateCnt(NoticeDto notice) {
		return noticeDao.updateCnt(notice);
	}
	
	public int writeNotice(NoticeDto notice) {
		return noticeDao.writeNotice(notice);
	}
}
