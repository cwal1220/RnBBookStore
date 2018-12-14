package Library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Library.dao.RentalDao;
import Library.dto.RentalDto;
import Library.dto.RentalInfoDto;

@Service
public class RentalServiceImpl implements RentalService{

	@Autowired RentalDao rentalDao;

	@Override
	public List<RentalDto> getListByUId(String u_id) {
		return rentalDao.getListByUId(u_id);
	}

	@Override
	public List<RentalInfoDto> getRentalJoinBookList(String u_id) {
		return rentalDao.getRentalJoinBookList(u_id);
	}

	@Override
	public void insertRental(RentalDto rental) throws Exception {
		rentalDao.insertRental(rental);
	}

	@Override
	public void deleteRental(RentalDto rental) throws Exception {
		rentalDao.deleteRental(rental);
		
	}

	@Override
	public RentalInfoDto getRentalInfoByBid(String b_id) {
		return rentalDao.getRentalInfoByBid(b_id);
	}
}
