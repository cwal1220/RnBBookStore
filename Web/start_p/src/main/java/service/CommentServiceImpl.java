package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CommentDAO;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired CommentDAO commmentDao;
}
