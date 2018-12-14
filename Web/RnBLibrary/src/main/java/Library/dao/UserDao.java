package Library.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Library.dto.UserDto;
import Library.util.Paging;


@Repository
public class UserDao {

	@Autowired SqlSession session;
	
	public UserDto getUserById(String u_id)	{
		return session.selectOne("users.getUserById", u_id);
	}
	
	public int selectById(UserDto userDto) {
		return session.selectOne("users.selectById", userDto);
	}
	
	public int selectCntAll() {
		return session.selectOne("users.selectCntAll");
	}
	
	public List<UserDto> selectPagingList(Paging paging) {
		return session.selectList("users.selectPagingList", paging);
	}
	
	public UserDto selectView(UserDto userDto) {
		return session.selectOne("users.selectView", userDto);
	}
	
	public int deleteUser(String u_id) {
		return session.delete("users.deleteUser", u_id);
	}
	
	public int insertUser(UserDto user) {
		return session.insert("users.insertUser", user);
	}
	
	public int updateUserScore(UserDto user) {
		return session.update("users.updateUserScore", user);
	}
}
