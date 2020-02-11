package my.spring.springedu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import vo.ProductVO;
@Controller 
@SessionAttributes("cnt")
public class ProductController{
	@ModelAttribute("cnt")
	public ProductVO count() {	
		return new ProductVO();
	}

	@RequestMapping("/product")	// void의 경우 매핑명과 똑같은 이름의 jsp로 응답하게 된다.
	public void handle(@ModelAttribute("cnt")ProductVO vo, String pid, SessionStatus s) {
		switch (pid) {
		case "p001":
			vo.setApp(1);
			break;
		case "p002":
			vo.setBan(1);
			break;
		case "p003":
			vo.setBong(1);
			break;
		case "clear":
			s.setComplete();
			break;
		}
	}
}

