package Library.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import Library.dto.NoticeDto;
import Library.service.NoticeService;
import Library.util.Paging;

@Controller
public class NoticeController {

	@Autowired NoticeService noticeService;
	private Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@RequestMapping(value="/noticeList.do")
	public ModelAndView list(ModelAndView mav, @RequestParam(defaultValue="0", required=false)int curPage) {
		
		int totalCount = noticeService.selectCntAll();
		System.out.println(totalCount+"");
		
		Paging paging = new Paging(totalCount, curPage);
		
		List<NoticeDto> noticeList = noticeService.selectPagingList(paging);
		System.out.println(noticeList.toString());
		
		mav.addObject("noticeList", noticeList);
		mav.addObject("paging", paging);
		
		mav.setViewName("/user/noticeList");
		
		return mav;
	}
	
	@RequestMapping(value="/noticeView.do", method=RequestMethod.GET)
	public String view(Model model, NoticeDto notice) {
		
		logger.info("공지사항 리스트 컨트롤러 실행");
		
		int check = noticeService.updateCnt(notice);
		NoticeDto newNotice = noticeService.selectView(notice);
		logger.info("newNotice : " + newNotice.toString());
		
		model.addAttribute("notice", newNotice);
		
		return "/user/noticeView";
		
	}
}
