package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Menu1Controller {
	@RequestMapping("/menu1.do")
	public String process() {
		return "menu1";
	}

	@RequestMapping("/bookList.do")
	public String bookList() {
		return "bookList";
		
	}
	
	@RequestMapping("/bookDetail.do")
	public String bookDetail() {
		return "bookDetail";
		
	}
}
