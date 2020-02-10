package my.spring.springedu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import vo.MemberVO;

@Controller
public class MemberController {
	@RequestMapping("/member")
	public ModelAndView proc(MemberVO vo) {
		ModelAndView mav = new ModelAndView();
		String name = vo.getName();
		String account = vo.getAccount();
		String pwd = vo.getPwd();
		String phonenum = vo.getPhonenum();
		
		if(name.equals("")) {
			name = "없음";
		}
		if(phonenum.equals("")) {
			phonenum = "없음";
		}
		if(account.equals("")) {
			account = "없음";
		}
		if(pwd.equals("")) {
			pwd = "없음";
		}
		
		vo.setName(name);
		vo.setPhonenum(phonenum);		
		vo.setAccount(account);		
		vo.setPwd(pwd);	
		mav.addObject("member", vo);
		mav.setViewName("memberView");
		return mav;
	}	
}

