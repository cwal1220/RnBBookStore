package Library.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import Library.dto.NoticeDto;
import Library.dto.UserDto;
import Library.service.NoticeService;
import Library.service.UserService;
import Library.util.Paging;

@Controller
@RequestMapping(value="/admin") 
public class AdminController {

	@Autowired UserService userService;
	@Autowired NoticeService noticeService;
	
	private Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@RequestMapping(value="/loginForm.do", method=RequestMethod.GET)
	public String loginForm() {
		
		return "/admin/loginForm";
	}
		
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "/admin/loginForm";
	}
	
	@RequestMapping(value="/loginForm.do", method=RequestMethod.POST)
	public String loginForm(UserDto userDto, HttpSession session) {
		
		logger.info("관리자 로그인 컨트롤러 실행");
		logger.info("AdminController_loginForm : " + userDto.toString());
		
		int loginSuccess = userService.selectById(userDto);
		
		if(loginSuccess >=1) {
			logger.info("로그인 성공");
			session.setAttribute("admin", true);
			session.setAttribute("id", userDto.getU_id());
			return "redirect:/admin/userList.do";
			
		} else {
			logger.info("로그인 실패");
			return "/admin/loginForm";
		}
	}
	
	@RequestMapping(value="/noticeWrite.do", method=RequestMethod.GET)
	public String writeForm() {
		
		return "/admin/write";
	}
	
	@RequestMapping(value="/noticeWrite.do", method=RequestMethod.POST)
	public String writeProc(NoticeDto noticeDto) {
		
		logger.info("관리자 공지사항 작성 컨트롤러 실행");
		System.out.println(noticeDto.toString());
		noticeService.writeNotice(noticeDto);
		
		return "redirect:/noticeList.do";
	}
	
	@RequestMapping(value="/userList.do")
	public ModelAndView list(ModelAndView mav, @RequestParam(defaultValue="0", required=false)int curPage) {
		
		int totalCount = userService.selectCntAll();
		System.out.println(totalCount+"");
		
		Paging paging = new Paging(totalCount, curPage);
		
		List<UserDto> userList = userService.selectPagingList(paging);
		System.out.println(userList.toString());
		
		mav.addObject("userList", userList);
		mav.addObject("paging", paging);
		
		mav.setViewName("/admin/userList");
		
		return mav;
	}
	
	@RequestMapping(value="/deleteUser.do", method=RequestMethod.GET)
	public String deleteUser(String u_id) {
		
		logger.info("관리자 회원탈퇴 컨트롤러 실행");
		System.out.println(u_id);
		userService.deleteUser(u_id);
		
		return "redirect:/admin/userList.do";
	}
	
	@RequestMapping(value="/insertUser.do", method=RequestMethod.GET)
	public String insertUser() {
		
		return "/admin/userInsertForm";
	}
	
	@RequestMapping(value="/insertUser.do", method=RequestMethod.POST)
	public String insertUserProc(UserDto user) {
		
		logger.info("관리자 회원등록 컨트롤러 실행");
		System.out.println(user.toString());
		userService.insertUser(user);
		
		return "redirect:/admin/userList.do";
	}
	
}
