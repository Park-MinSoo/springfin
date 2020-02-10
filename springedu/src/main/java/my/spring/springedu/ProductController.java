package my.spring.springedu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import vo.ProductVO;
@Controller 
@SessionAttributes({"cnt"})
public class ProductController{
	@ModelAttribute("app")
	public ProductVO countMethod1() {	
		System.out.println("countMethod1 호출 - count1");
		return new ProductVO();
	}
	@ModelAttribute("ban")
	public ProductVO countMethod2() {
		System.out.println("countMethod2 호출 - count2");		
		return new ProductVO();
	}
	@ModelAttribute("bong")
	public ProductVO countMethod3() {
		System.out.println("countMethod3 호출 - count2");		
		return new ProductVO();
	}
	@RequestMapping("/product")
	public void handle(@ModelAttribute("app")ProductVO vo1, 
			      @ModelAttribute("ban")ProductVO vo2,
			      @ModelAttribute("bong")ProductVO vo3, int app, int ban, int bong) {
		vo1.setApp(app);
		vo2.setBan(ban);
		vo3.setBong(bong);
	}
	
/*	
		String pid = request.getParameter("pid");
		HttpSession session = request.getSession();
		String url ="/jspexam/productView.jsp";

		if (session.getAttribute("cnt") == null)
			session.setAttribute("cnt", new ProductVO());	
		ProductVO vo =(ProductVO)session.getAttribute("cnt");
*/
/*		
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
				SessionStatus s
				s.setComplete();
				url ="/jspexam/clear1.jsp";
				break;
			}
			
*/			
}
