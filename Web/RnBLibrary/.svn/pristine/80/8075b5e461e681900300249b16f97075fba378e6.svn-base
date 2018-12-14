package Library.service;

import java.util.List;

import Library.dto.RentalDto;
import Library.dto.RentalInfoDto;

public interface RentalService {
	
	public List<RentalDto> getListByUId(String u_id);
	
	public List<RentalInfoDto> getRentalJoinBookList(String u_id);
	
	public RentalInfoDto getRentalInfoByBid(String b_id);
	
	public void insertRental(RentalDto rental) throws Exception;
	
	public void deleteRental(RentalDto rental) throws Exception;
}
