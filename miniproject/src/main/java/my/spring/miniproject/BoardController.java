package my.spring.miniproject;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.TradeBoardDAO;
import vo.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	TradeBoardDAO dao;
	//get : list, search, delete, writer
	//post : insert, update
	@RequestMapping(value="/board/{type}", method=RequestMethod.GET)
	public ModelAndView boardList(@PathVariable String type) {
		ModelAndView mav = new ModelAndView();
		List<BoardVO> list = dao.listAll(type);
		mav.addObject("list",list);
		mav.setViewName("");
		return mav;
	}
	
	@RequestMapping(value="/board/{type}/{action}", method=RequestMethod.GET)
	public ModelAndView boardGET(@PathVariable String type,
								@PathVariable String action, BoardVO vo, String keyword, String searchType) {
		ModelAndView mav = new ModelAndView();
		List<BoardVO> list = new ArrayList<>();
		if(keyword==null&&searchType==null) {
			if(action.equals("delete")) {
				dao.delete(vo.getId());
				list = dao.listAll(type);
			}else if(action.equals("writer")) {
				list = dao.listWriter(vo.getWriter());
			}
		}
		else {
			if(action.equals("search"))
				list = dao.search(keyword, searchType);
		}
		mav.addObject("list",list);
		mav.setViewName("");
		return mav;
	}
	//굳이 ModelAndView 객체로 return할 필요 있는가?
	
	@RequestMapping(value="/board/{type}/{action}", method=RequestMethod.POST)
	public ModelAndView boardPOST(@PathVariable String type,
								@PathVariable String action, BoardVO vo) {
		ModelAndView mav = new ModelAndView();
		List<BoardVO> list = new ArrayList<>();
		if(action!=null) {
			if(action.equals("insert")) {
				if(dao.insert(vo)) {
					list = dao.listAll(type);				
				}
			}else if(action.equals("update")) {
				if (dao.update(vo)) {
					list = dao.listAll(type);				
				}
			}
		}
			
		mav.addObject("list",list);
		mav.setViewName("");
		return mav;
	}

}
