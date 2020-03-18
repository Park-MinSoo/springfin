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
	
	@RequestMapping(value="/main")
	public String main(@ModelAttribute MemberVO vo, HttpSession session) {
	
		return "main";
	}
	
	@RequestMapping(value="/menu")
	public ModelAndView loginCheck(@ModelAttribute MemberVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		if(ms.loginCheck(vo, session)) {
			session.setAttribute("User", vo);
			mav.addObject("msg","success");
			mav.setViewName("main2");
		}else {
			mav.addObject("msg","fail");
			mav.setViewName("main");
		}
		return mav;
	}
	
	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpSession session) {
		ms.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("msg","logout");
		return mav;
	}
}
