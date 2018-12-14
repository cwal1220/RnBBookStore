package Library.service;

import java.util.List;

import Library.dto.UserDto;
import Library.util.Paging;

public interface UserService {
	
	UserDto getUserById(String u_id);
	
	public int selectById(UserDto userDto);
	
	public int selectCntAll();
	
	public List<UserDto> selectPagingList(Paging paging);
	
	public UserDto selectView(UserDto user);
	
	public int deleteUser(String u_id);
	
	public int insertUser(UserDto userDto);
	
	public int updateUserScore(UserDto user);
	
}
