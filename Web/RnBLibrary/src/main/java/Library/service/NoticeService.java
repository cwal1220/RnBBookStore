package Library.service;

import java.util.List;

import Library.dto.NoticeDto;
import Library.util.Paging;

public interface NoticeService {
	
	public int selectCntAll();
	
	public List<NoticeDto> selectPagingList(Paging paging);
	
	public NoticeDto selectView(NoticeDto notice);
	
	public int updateCnt(NoticeDto notice);
	
	public int writeNotice(NoticeDto notice);

}
