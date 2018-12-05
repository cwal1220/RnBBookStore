package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Controller4 {

	@RequestMapping
	public String methodTest() {
		return "/admin/noticeWrite";
	}
}
