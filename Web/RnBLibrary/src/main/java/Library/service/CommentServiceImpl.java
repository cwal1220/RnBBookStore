package Library.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Library.dao.CommentDao;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired CommentDao commentDao;
}
