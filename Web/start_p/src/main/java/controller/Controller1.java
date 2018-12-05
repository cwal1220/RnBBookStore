package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Controller1 {

	@RequestMapping(value="/user/bookList.do")
	public String methodTest() {
		return "/user/bookList";
	}
}
