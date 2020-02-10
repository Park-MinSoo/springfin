package my.spring.springedu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EduController {
	@RequestMapping("/edu")
	public ModelAndView proc(String gscore, String gname) {
		ModelAndView mav = new ModelAndView();
		int gscore1 = Integer.parseInt(gscore);
		if(gscore1 >=90) {
			mav.setViewName("gradeA");
		}
		else if(gscore1 >=80 && gscore1 <=89) {
			mav.setViewName("gradeB");
		}
		else if(gscore1 >=70 && gscore1 <=79) {
			mav.setViewName("gradeC");
		}	
		else {
			mav.setViewName("gradeD");
		}
		return mav;
	}
}
