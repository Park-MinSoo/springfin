package my.spring.springedu;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import vo.CountVO;
@Controller
public class CountController2 {	
	@RequestMapping(value="/count2")
	public void handle(int num1, int num2, HttpSession s) {//세션 일부만 삭제하고 싶으면 이렇게 일일이 구현해 줄 수밖에없다. 선별해서 삭제할수 있는 기능을 가지고 있기 때문.
		if(s.getAttribute("count3") == null )
			s.setAttribute("count3", new CountVO());
		if(s.getAttribute("count4") == null )
			s.setAttribute("count4", new CountVO());
		
		CountVO vo3 = (CountVO)s.getAttribute("count3");
		CountVO vo4 = (CountVO)s.getAttribute("count4");
		
		vo3.setCountNum(num1);
		vo4.setCountNum(num2);
		System.out.println("handle() : "+ 
			      vo3.getCountNum() + " : " + vo4.getCountNum());
		
		System.out.println("=============================");
	}
	@RequestMapping(value="/countdel2")
	public void handle(HttpSession s, String who) {
		if(who != null) {
			s.removeAttribute(who);
			System.out.println(who + " deleted!");		
		}		
		System.out.println("=============================");
	}
}



