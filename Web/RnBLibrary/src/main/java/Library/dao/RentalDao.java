package Library.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Library.dto.RentalDto;
import Library.dto.RentalInfoDto;

@Repository
public class RentalDao {

	@Autowired SqlSession session;
	
	public List<RentalDto> getListByUId(String u_id)
	{
		return session.selectList("rental.getListByUId", u_id);
	}
	
	public List<RentalInfoDto> getRentalJoinBookList(String u_id)
	{
		return session.selectList("rental.getRentalJoinBookList", u_id);
	}
	
	public RentalInfoDto getRentalInfoByBid(String b_id)
	{
		return session.selectOne("rental.getRentalInfoByBid", b_id);
	}
	
	public void insertRental(RentalDto rental) throws Exception
	{
		session.insert("rental.insert", rental);
	}
	
	public void deleteRental(RentalDto rental) throws Exception
	{
		session.insert("rental.delete", rental);
	}
}
