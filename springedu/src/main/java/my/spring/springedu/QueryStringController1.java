package my.spring.springedu;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class QueryStringController1 {
	@RequestMapping("/querystring1")
	public ModelAndView proc(String name) {
		ModelAndView mav = new ModelAndView();
		System.out.println("["+name+"]");
		mav.addObject("spring", name);
		mav.setViewName("queryView1");
		return mav;
	}	
	@RequestMapping("/querystring2")
	public ModelAndView proc(int number) {	// 아무 쿼리도 주지 않고 수행했을시 null값은 int가 될 수 없으므로 500 에러가 나타나게 된다. 숫자가 아닌 문자를 쿼리로 주고 수행했을시 400 에러가 나타나게된다.(잘못된 요청)
		ModelAndView mav = new ModelAndView();
		mav.addObject("spring", number);
		mav.setViewName("queryView1");
		return mav;
	}	
	@RequestMapping("/querystring3")
	public ModelAndView proc(String name, 
			                   @RequestParam("num")int number) {	// 전달되는 쿼리를 number가 아닌 num으로 받겠다.
		ModelAndView mav = new ModelAndView();
		mav.addObject("spring", name+":"+number);
		mav.setViewName("queryView1");
		return mav;
	}
	@RequestMapping("/querystring4")
	public ModelAndView proc(
	@RequestParam("myname1") String name1,	// requestparam을 쓰면 null값도 안가게 된다.
	@RequestParam(value="myname2", required=false) String name2,	// required:false 를 지정하면 필수가 아니란 뜻이다.
	@RequestParam(defaultValue="10") int number1, //defaultvalue가 있으면 number1이라는 쿼리가 안왔을경우 자동으로 10 이라는 값이 할당 되는 것이다.
	@RequestParam(value="NUM2", defaultValue="100")int number2){
		ModelAndView mav = new ModelAndView();
		mav.addObject("spring", name1+":"+(number1 + number2) 
				+":"+name2);
		mav.setViewName("queryView1");
		return mav;
	}
}






