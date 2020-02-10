package my.spring.springedu;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
@Controller
@SessionAttributes("data1")// data1은 세션기능을 적용하고있다. 즉 data1이라는 객체는 세션객체에 보관한다.
public class TestModelController3 {
	@ModelAttribute("data1")
	public StringBuffer createModel1() {	
		System.out.println("createModel1() 호출 - data1(session)");
		return new StringBuffer();
	}
	@ModelAttribute("data2")
	public StringBuffer createModel2() {	
		System.out.println("createModel2() 호출 - data2(request)");
		return new StringBuffer();
	}
	@RequestMapping(value="/testmodel3")
	public String handle(@ModelAttribute("data1") StringBuffer vo1, 
			@ModelAttribute("data2") StringBuffer vo2, String str) {
		vo1.append(str+":");
		vo2.append(str+"@");
		System.out.println("handle 에서 출력 : "+vo1 + " - " + vo2);
		System.out.println("=============================");
		return "modelResult2";
	}	
}
