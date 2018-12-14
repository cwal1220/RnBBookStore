package Library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Library.dao.UserDao;
import Library.dto.UserDto;
import Library.util.Paging;

@Service
public class UserServiceImpl implements UserService{

	@Autowired UserDao userDao;

	@Override
	public UserDto getUserById(String u_id) {
		return userDao.getUserById(u_id);
	}
	
	public int selectById(UserDto userDto) {
		return userDao.selectById(userDto);
	}
	
	public int selectCntAll() {
		return userDao.selectCntAll();
	}

	public List<UserDto> selectPagingList(Paging paging) {
		return userDao.selectPagingList(paging);
	}
	
	public UserDto selectView(UserDto user) {
		return userDao.selectView(user);
	}
	
	public int deleteUser(String u_id) {
		return userDao.deleteUser(u_id);
	}
	
	public int insertUser(UserDto user) {
		return userDao.insertUser(user);
	}

	@Override
	public int updateUserScore(UserDto user) {
		return userDao.updateUserScore(user);
	}
}
