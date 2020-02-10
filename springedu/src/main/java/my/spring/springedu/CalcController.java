package my.spring.springedu;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalcController {
	@RequestMapping("/calc")
	public ModelAndView proc(int number1, int number2, String oper) {
		ModelAndView mav = new ModelAndView();
		int result=0;
		if(oper.equals("/") && number2 == 0) {
			String error = "나눗셈 연산시 두 번째 숫자는 0일 수 없습니다.";
			mav.addObject("error", error);
			mav.setViewName("errorResult");			
		}
		else {
		if(oper.equals("+")) {
			result = number1 + number2;
		}
		else if(oper.equals("-")) {
			result = number1 - number2;
		}
		else if(oper.equals("*")) {
			result = number1 * number2;
		}
		else if(oper.equals("/")) {
			result = number1 / number2;
		}
		mav.addObject("calcresult", result);
		mav.setViewName("calcResult");			
		}
		return mav;
	}
}



