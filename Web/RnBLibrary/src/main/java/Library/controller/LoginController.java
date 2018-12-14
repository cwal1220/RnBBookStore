package Library.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Library.dto.RentalDto;
import Library.dto.RentalInfoDto;
import Library.dto.UserDto;
import Library.service.RentalService;
import Library.service.UserService;


@Controller
public class LoginController {
	
	@Autowired
	UserService service;
	
	@Autowired
	RentalService rentalService;
	
	@RequestMapping("/login.do")
	public String loginPage() {
		return "login/loginForm";
	}
	
	@RequestMapping(value = "/loginProg.do", method = RequestMethod.POST)
	public String loginProg(String u_id, HttpSession session, HttpServletRequest req)
	{
		
		UserDto users = service.getUserById(u_id);
		
		if(users != null)
		{
			System.out.println(users);
//			List<RentalDto> list = rentalService.getListByUId(u_id);
			List<RentalInfoDto> list = rentalService.getRentalJoinBookList(u_id);
			session.setAttribute("user", users);
			session.setAttribute("rental_size", list.size());
			req.setAttribute("rental_list", list);
			// TEST CODE
			if(list != null)
				for(RentalInfoDto r : list)
					System.out.println(r);
			else
				System.out.println("List is null...");
			return "login/loginSuccess";
			
		}
		else
		{
			System.out.println("NULL!!!");
			return "login/loginFail";
		}
	}
	
}
