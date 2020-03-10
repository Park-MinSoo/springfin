package my.spring.miniproject;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.LoginService;
import vo.MemberVO;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	LoginService ms;
	
	@RequestMapping("login")
	public ModelAndView loginCheck(@ModelAttribute MemberVO vo, HttpSession session) {
		boolean result = ms.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if(result) {
			mav.setViewName("main");
			mav.addObject("msg","success");
		}else {
			mav.setViewName("login");
			mav.addObject("msg","fail");
		}
		return mav;
	}
	
	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session) {
		ms.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		mav.addObject("msg","logout");
		return mav;
	}
}
