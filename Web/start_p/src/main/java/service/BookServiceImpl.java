package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BookDAO;

@Service
public class BookServiceImpl implements BookService{
	
	@Autowired BookDAO bookDao;
}
