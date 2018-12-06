package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.RentalDAO;

@Service
public class RentalServiceImpl implements RentalService{

	@Autowired RentalDAO rentalDao;
}
