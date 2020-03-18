package my.spring.miniproject;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.SignupService;
import vo.MemberVO;

@Controller
public class SignupController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Autowired
    private SignupService sService;
    
    @RequestMapping(value="/signup", method=RequestMethod.GET)
    public String signupGET(){
        return "signup";
    }
    
    @RequestMapping(value="/signup", method=RequestMethod.POST)
    public void signupPOST(HttpServletRequest request, HttpServletResponse response, MemberVO vo) throws ServletException, IOException{
        sService.insertMember(vo);        
		response.sendRedirect("http://70.12.115.162:8000/miniproject/main");
    }
    
    @RequestMapping(value="/idcheck", method=RequestMethod.POST)
    @ResponseBody
    public void idCheck(HttpServletResponse response, @RequestParam("sm_id")String sm_id) throws IOException {
    	//System.out.println("여기는 controller");
    	sService.idCheck(sm_id, response);
    }
}