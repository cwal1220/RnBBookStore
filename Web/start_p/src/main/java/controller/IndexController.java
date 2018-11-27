package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	//컨트롤러에서 등록된 index의 이름을 찾아서 등록한다.
       @RequestMapping("/index.do")
	 public String process() {
		 return "index";
	 }       
}
