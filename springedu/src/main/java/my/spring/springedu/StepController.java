package my.spring.springedu;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vo.StepVO;
// POJO
@Controller
public class StepController {		
	@RequestMapping(value="/step",
			 method=RequestMethod.POST)
	public String memberHandle(@ModelAttribute("kkk") StepVO vo) {// 모델과 관련된 속성을 kkk라고 설정하고 있다. kkk라는 이름으로 보관해달라는 뜻이다.
		if(vo.getAge() < 18)
			return "redirect:/resources/stepForm.html";	//redirect를 붙임으로서 다시 재요청해서 불러온다.
		System.out.println("[ Information for the passed Command object ]");
		System.out.println(vo.getName());
		System.out.println(vo.getPhoneNumber());
		System.out.println(vo.getAge());
		return  "stepOutput";
	}
}
