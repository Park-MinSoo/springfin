package my.spring.miniproject;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.OfficialBoardDAO;
import vo.OfficialBoardVO;
@Controller
public class OfficialBoardController {
	@Autowired
	OfficialBoardDAO dao;
	
	@RequestMapping(value = "/officialmain", method = RequestMethod.GET)
	public ModelAndView newsmain(OfficialBoardVO vo){
		ModelAndView mav = new ModelAndView();
		List<OfficialBoardVO> olist = dao.listAll();
		mav.addObject("olist", olist);
		mav.setViewName("OfficialBoard");
		return mav;
	}
	
	@RequestMapping(value = "/official/listOne", method = RequestMethod.GET)
	public ModelAndView listone(OfficialBoardVO vo, int id){
		ModelAndView mav = new ModelAndView();
		OfficialBoardVO olistone = dao.listOne(id);
		List<OfficialBoardVO> olist = dao.listAll();
		mav.addObject("olistone", olistone);
		mav.addObject("olist", olist);				
		mav.setViewName("OfficialBoard");
		return mav;
	}
	
	@RequestMapping(value = "/official/delete", method = RequestMethod.GET)
	public ModelAndView delete(OfficialBoardVO vo, int id){
		ModelAndView mav = new ModelAndView();
		dao.delete(id);
		List<OfficialBoardVO> olist = dao.listAll();
		mav.addObject("olist", olist);
		mav.setViewName("OfficialBoard");
		return mav;
	}
	
	@RequestMapping(value = "/official/search", method = RequestMethod.GET)
	public ModelAndView search(OfficialBoardVO vo, String keyword, String searchType){
		ModelAndView mav = new ModelAndView();
		List<OfficialBoardVO> olist = dao.search(keyword, searchType);
		mav.addObject("olist", olist);
		mav.setViewName("OfficialBoard");
		return mav;
	}
	
	@RequestMapping(value = "/official/writer", method = RequestMethod.GET)
	public ModelAndView writer(OfficialBoardVO vo, String writer){
		ModelAndView mav = new ModelAndView();
		List<OfficialBoardVO> olist = dao.listWriter(writer);
		mav.addObject("olist", olist);
		mav.setViewName("OfficialBoard");
		return mav;
	}
	
	@RequestMapping(value = "/official/insert", method = RequestMethod.POST)
	public ModelAndView insert(OfficialBoardVO vo){
		ModelAndView mav = new ModelAndView();
		String owriter = vo.getWriter();
		boolean result = dao.insert(vo);
		if (result) {
			mav.addObject("msg", owriter + "님의 글이 성공적으로 입력되었습니다.");			
		} else {
			mav.addObject("msg", owriter + "님의 글이 입력되지 않았습니다.");
		}		
		List<OfficialBoardVO> olist = dao.listAll();
		mav.addObject("olist", olist);				
		mav.setViewName("OfficialBoard");
		return mav;
	}

	@RequestMapping(value = "/official/update", method = RequestMethod.POST)
	public ModelAndView update(OfficialBoardVO vo){
		ModelAndView mav = new ModelAndView();
		String owriter = vo.getWriter();
		boolean result = dao.update(vo);
		if (result) {
			mav.addObject("msg", owriter + "님의 글이 성공적으로 수정되었습니다.");	
		} else {
			mav.addObject("msg", owriter + "님의 글이 수정되지 않았습니다.");
		}
		List<OfficialBoardVO> olist = dao.listAll();
		mav.addObject("olist", olist);
		mav.setViewName("OfficialBoard");
		return mav;
	}
}
