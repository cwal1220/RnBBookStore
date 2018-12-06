package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired NoticeDAO noticeDao;
}
