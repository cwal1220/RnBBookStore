package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView; 

import dao.BookDAO;
import dto.BookDTO;
import dto.PageDTO;

@Controller
public class IndexController {
	
	
	private BookDAO dao;
	private int currentPage=1;
	private PageDTO pdto; 
	


	public BookDAO getDao() {
		return dao;
	}


	public void setDao(BookDAO dao) {
		this.dao = dao;
	}
 

	/*
	  컨트롤러에서 등록된 index의 이름을 찾아서 등록한다.
       @RequestMapping("/index.do")
	 public String process() {
		 return "index";
	 }  
      */  
       
     //컨트롤러에서 등록된 index의 이름을 찾아서 등록한다.
       @RequestMapping("/register.do")
	 public String insertbook() {
		 return "registerBook";  
	 }
       
       
       
       
      
   
   	@RequestMapping(value = "bookwrite.do", method = RequestMethod.POST)
   	public ModelAndView insertimg(BookDTO dto,HttpServletRequest req) throws IllegalStateException, IOException {
   		System.out.println("ㅇㅇㅇㅇㅇ");
   		System.out.println(dto.getB_id());
   		System.out.println(dto.getB_title());
   		System.out.println(dto.getB_auth());  
   		System.out.println(dto.getB_mainpic_file());
   		
   	    MultipartFile multi=dto.getB_mainpic_file(); 
		
   			String name = multi.getOriginalFilename();
   			
   			System.out.println(name);
   			String root = req.getSession().getServletContext().getRealPath("/");
   			root += "temp" + File.separator;
   			File fe = new File(root);
   			if (!fe.exists()) {
   				fe.mkdirs();
   			}
   			File file = new File(root, name);
   			multi.transferTo(file);
   			
   			dto.setB_mainpic("temp/"+name);
   		 
   
   		
   		dao.insert(dto);
   		ModelAndView mav = new ModelAndView();
   		mav.setViewName("redirect:/register.do");
   		return mav;
   	} 
   	 
   	 //int b_num
	@RequestMapping("bookPage.do")
	public ModelAndView viewMethod(int currentPage, int b_num) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dao.select(b_num)); 
		mav.setViewName("bookPage"); 
		return mav;
	} 
	
	
	@RequestMapping("booksPage.do") 
	public ModelAndView viewMethod(int b_num) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dao.select(b_num)); 
		mav.setViewName("bookPage"); 
		return mav;
	} 
   	
   	
	@RequestMapping("book.do") 
	public ModelAndView listbook(PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		int totalRecord = dao.countdata();
		if(totalRecord>=1) { 
			if(pv.getCurrentPage()==0) {
				
				currentPage=1;
			}else {   
				currentPage=pv.getCurrentPage();
			}
			System.out.println(currentPage);
			System.out.println(totalRecord);
			
			
		 pdto = new PageDTO(currentPage, totalRecord);	
		 
		 mav.addObject("aList", dao.bookList(pdto));  
		 mav.addObject("pv", pdto);  
		}
		mav.setViewName("bookList");
		return mav;
		 
	}//end listMethod()////
	 
@RequestMapping("/search.do") 
    public @ResponseBody List<BookDTO> searchProcess(String data){
	 System.out.println("테스트트트");
	return dao.search(data);
	}	
 
	
  /*     
	@RequestMapping("bookView.do")
	public ModelAndView viewMethod(int num) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dao4.content(num));
		mav.setViewName("Boo");
		return mav;
	}   
    */    
}
