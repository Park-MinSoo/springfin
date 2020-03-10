package my.spring.miniproject;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.TradeBoardDAO;
import vo.BoardVO;

@Controller
public class TradeBoardController {
	
	@Autowired
	TradeBoardDAO dao;
	//get : list, search, delete, writer
	//post : insert, update
	@RequestMapping(value="/board/trade", method=RequestMethod.GET)
	public ModelAndView tradeList() {
		ModelAndView mav = new ModelAndView();
		List<BoardVO> list = dao.listAll("trade");
		mav.addObject("list",list);
		mav.setViewName("");
		return mav;
	}
	
	@RequestMapping(value="/board/trade/delete", method=RequestMethod.GET)
	public ModelAndView tradeDelete(BoardVO vo) {
		ModelAndView mav = new ModelAndView();
		List<BoardVO> list = dao.listAll("trade");
		dao.delete(vo.getId());
		mav.addObject("list",list);
		mav.setViewName("");
		return mav;
	}
	//굳이 ModelAndView 객체로 return할 필요 있는가?
	
	@RequestMapping(value="/board/trade/search", method=RequestMethod.GET)
	public ModelAndView tradeSearch(String keyword, String searchType) {
		ModelAndView mav = new ModelAndView();
		List<BoardVO> list = dao.search(keyword, searchType);
		mav.addObject("list",list);
		mav.setViewName("");
		return mav;
	}
	
	@RequestMapping(value="/board/trade/writer", method=RequestMethod.GET)
	public ModelAndView tradeWriter(BoardVO vo) {
		ModelAndView mav = new ModelAndView();
		List<BoardVO> list = dao.listWriter(vo.getWriter());
		mav.addObject("list",list);
		mav.setViewName("");
		return mav;
	}
	
	@RequestMapping(value="/board/trade/insert", method=RequestMethod.POST)
	public ModelAndView tradeInsert(BoardVO vo) {
		ModelAndView mav = new ModelAndView();
		List<BoardVO> list = new ArrayList<>();
		boolean result = dao.insert(vo);
		if (result) {
			list = dao.listAll("trade");				
		}		
		mav.addObject("list",list);
		mav.setViewName("");
		return mav;
	}
	
	@RequestMapping(value="/board/trade/update", method=RequestMethod.POST)
	public ModelAndView tradeUpdate(BoardVO vo) {
		ModelAndView mav = new ModelAndView();
		List<BoardVO> list = new ArrayList<>();
		boolean result = dao.update(vo);
		if (result) {
			list = dao.listAll("trade");				
		}		
		mav.addObject("list",list);
		mav.setViewName("");
		return mav;
	}
}
