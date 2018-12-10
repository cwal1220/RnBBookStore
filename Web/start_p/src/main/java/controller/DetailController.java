package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.MemDAO;
import dto.MemDTO;
import dto.PersonDTO;

@Controller
public class DetailController {
	
	private MemDAO dao;
	
	
     public MemDAO getDao() {
		return dao;
	}




	public void setDao(MemDAO dao) {
		this.dao = dao;
	}

 


	@RequestMapping("/detail.do")
     public String process() {
    	 return "detail";
     }//end process
	
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public ModelAndView insert(MemDTO dto) {
		System.out.println(dto.getMemNum());
		System.out.println(dto.getMemId());
		System.out.println(dto.getMemPass());
		System.out.println(dto.getMemEmail());
		dao.insert(dto); //
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/index.do");
		return mav;
	}
	
	@RequestMapping("/login.do")
	public String loginProcess() {
		return "loginForm";
	}
	
	@RequestMapping("/logpro.do")
	public String logCheckProcess(String returnUrl, PersonDTO dto, HttpSession session) {
		   
		//DB에 해당사용자가 존재하면
		
		if(dto.getId().equals("kim")&&dto.getPass().equals("1234")) {
			session.setAttribute("chk", dto.getId());
			if(returnUrl!="") {
				return "redirect:/"+returnUrl;
			}
		}
		return "redirect:/index.do";
	}//end logCheckProcess()
	
	@RequestMapping("/logout.do")
	public String logoutProcess(HttpSession session) {
		session.removeAttribute("chk");
		return "redirect:/index.do";
	}
	
	@RequestMapping("/websocket.do")
	public String webSocket() {
		return "websocket";
	}
	
/*	
	@RequestMapping("event.do") 
	public ModelAndView listthumb() {
		ModelAndView mav = new ModelAndView();
		
		
		 mav.addObject("eventList", dao.eventList);  
		  
		}
		
		mav.setViewName("list");
		 
		return mav;
		
	}//end listMethod()
	*/
	
	
}//end class

