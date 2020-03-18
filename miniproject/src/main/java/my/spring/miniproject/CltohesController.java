package my.spring.miniproject;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.ClothesDAO;
import vo.ClothesVO;

@Controller
public class CltohesController {
	
	@Autowired
	ClothesDAO dao;
	
	@RequestMapping(value="/wimc", method=RequestMethod.GET)
	public ModelAndView wimc(ClothesVO vo) {
		ModelAndView mav = new ModelAndView();
		List<ClothesVO> list = dao.listAll();
		mav.addObject("list",list);
		mav.setViewName("mycloset");
		return mav;
	}
}
