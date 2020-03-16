package my.spring.miniproject;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.BoardDAO;
import service.PagingService;
import vo.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardDAO dao;
	
	@Autowired
	PagingService pc;
	//get : list, search, delete, writer
	//post : insert, update
	
	@RequestMapping(value="/board/{type}", method=RequestMethod.GET)
	public ModelAndView boardList(@PathVariable String type, @RequestParam(defaultValue="1")int pgNum) {
		ModelAndView mav = new ModelAndView();
		int startNum = pc.getWritingStart(pgNum);
		int endNum = pc.getWritingEnd(pgNum);
		System.out.println(startNum + ", "+endNum);
		List<BoardVO> list = dao.listAll(type,startNum,endNum);
		mav.addObject("pageStart",pc.getPageStart(pgNum));
		mav.addObject("pageEnd",pc.getPageEnd(pgNum,type));
		mav.addObject("preData",pc.isPreData(pgNum));
		mav.addObject("nextData",pc.isNextData(pgNum,type));
		mav.addObject("startNum",startNum);
		mav.addObject("endNum",endNum);
		mav.addObject("pgNum",pgNum);
		mav.addObject("list",list);
		mav.setViewName(type+"View");
		return mav;
	}
	
	@RequestMapping(value="/board/{type}/{action}", method=RequestMethod.GET)
	public ModelAndView boardGET(@PathVariable String type,
								@PathVariable String action, BoardVO vo, String keyword, String searchType,@RequestParam(defaultValue="1")int pgNum) {
		ModelAndView mav = new ModelAndView();
		int startNum = pc.getWritingStart(pgNum);
		int endNum = pc.getWritingEnd(pgNum);
		List<BoardVO> list = dao.listAll(type,startNum,endNum);
		
		if(keyword==null&&searchType==null) {
			if(action.equals("delete")) {
				dao.delete(vo.getId());
				list = dao.listAll(type,startNum,endNum);
				mav.setViewName(type+"View");
			}else if(action.equals("writer")) {
				list = dao.listWriter(vo.getWriter());
				mav.setViewName(type+"View");
			}else if(action.equals("read")){
				vo = dao.listOne(vo.getId());
				list = dao.listAll(type,startNum,endNum);
				mav.setViewName(type+"View_update");
				mav.addObject("listOne",vo);
			}else if(action.equals("write")) {
				mav.setViewName(type+"View_insert");
			}else {
				vo = dao.listOne(vo.getId());
				list = dao.listAll(type,startNum,endNum);
				mav.addObject("listOne",vo);
				mav.setViewName(type+"View");
			}
		}else {
			if(action.equals("search")) {
				list = dao.search(keyword, searchType);
				mav.setViewName(type+"View");
			}
		}
		mav.addObject("pageStart",pc.getPageStart(pgNum));
		mav.addObject("pageEnd",pc.getPageEnd(pgNum,type));
		mav.addObject("preData",pc.isPreData(pgNum));
		mav.addObject("nextData",pc.isNextData(pgNum,type));
		mav.addObject("startNum",startNum);
		mav.addObject("endNum",endNum);
		mav.addObject("pgNum",pgNum);
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping(value="/board/{type}/{action}", method=RequestMethod.POST)
	public ModelAndView boardPOST(@PathVariable String type,
								@PathVariable String action, BoardVO vo,@RequestParam(defaultValue="1")int pgNum) {
		ModelAndView mav = new ModelAndView();
		int startNum = pc.getWritingStart(pgNum);
		int endNum = pc.getWritingEnd(pgNum);
		List<BoardVO> list = new ArrayList<>();
		if(action!=null) {
			if(action.equals("insert")) {
				if(dao.insert(vo)) {
					System.out.println(vo.getLocation());
					list = dao.listAll(type,startNum,endNum);				
				}
			}else if(action.equals("update")) {
				if (dao.update(vo)) {
					list = dao.listAll(type,startNum,endNum);				
				}
			}
		}
		mav.addObject("pageStart",pc.getPageStart(pgNum));
		mav.addObject("pageEnd",pc.getPageEnd(pgNum,type));
		mav.addObject("preData",pc.isPreData(pgNum));
		mav.addObject("nextData",pc.isNextData(pgNum,type));
		mav.addObject("startNum",startNum);
		mav.addObject("endNum",endNum);
		mav.addObject("pgNum",pgNum);
		mav.addObject("list",list);
		mav.setViewName(type+"View");
		return mav;
	}
	
}
