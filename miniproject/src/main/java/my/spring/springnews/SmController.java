package my.spring.springnews;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.SmDAO;
import vo.SmMemberVO;
@Controller
public class SmController {
	@Autowired
	SmDAO dao;
	
	@RequestMapping(value = "/newsmain", method = RequestMethod.GET)
	public ModelAndView newsmain(SmMemberVO vo){
		ModelAndView mav = new ModelAndView();
		List<SmMemberVO> list = dao.listAll();
		mav.addObject("list", list);
		mav.setViewName("news");
		return mav;
	}
	
	@RequestMapping(value = "/listOne", method = RequestMethod.GET)
	public ModelAndView listone(SmMemberVO vo, int id){
		ModelAndView mav = new ModelAndView();
		SmMemberVO listone = dao.listOne(id);
		List<SmMemberVO> list = dao.listAll();
		mav.addObject("listone", listone);
		mav.addObject("list", list);				
		mav.setViewName("news");
		return mav;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete(SmMemberVO vo, int id){
		ModelAndView mav = new ModelAndView();
		dao.delete(id);
		List<SmMemberVO> list = dao.listAll();
		mav.addObject("list", list);
		mav.setViewName("news");
		return mav;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView search(SmMemberVO vo, String keyword, String searchType){
		ModelAndView mav = new ModelAndView();
		List<SmMemberVO> list = dao.search(keyword, searchType);
		mav.addObject("list", list);
		mav.setViewName("news");
		return mav;
	}
	
	@RequestMapping(value = "/writer", method = RequestMethod.GET)
	public ModelAndView writer(SmMemberVO vo, String writer){
		ModelAndView mav = new ModelAndView();
		List<SmMemberVO> list = dao.listWriter(writer);
		mav.addObject("list", list);
		mav.setViewName("news");
		return mav;
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView insert(SmMemberVO vo){
		ModelAndView mav = new ModelAndView();
		String writer = vo.getWriter();
		boolean result = dao.insert(vo);
		if (result) {
			mav.addObject("msg", writer + "님의 글이 성공적으로 입력되었습니다.");			
		} else {
			mav.addObject("msg", writer + "님의 글이 입력되지 않았습니다.");
		}		
		List<SmMemberVO> list = dao.listAll();
		mav.addObject("list", list);				
		mav.setViewName("news");
		return mav;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView update(SmMemberVO vo){
		ModelAndView mav = new ModelAndView();
		String writer = vo.getWriter();
		boolean result = dao.update(vo);
		if (result) {	
			mav.addObject("msg", writer + "님의 글이 성공적으로 수정되었습니다.");	
		} else {
			mav.addObject("msg", writer + "님의 글이 수정되지 않았습니다.");
		}
		List<SmMemberVO> list = dao.listAll();
		mav.addObject("list", list);
		mav.setViewName("news");
		return mav;
	}
}
