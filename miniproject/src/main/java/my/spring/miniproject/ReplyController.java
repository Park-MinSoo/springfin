package my.spring.miniproject;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.ReplyService;
import vo.ReplyVO;

//페이지 변환 없이 데이터만 주고 받을 수 있도록 ReplyControllor라는 RestController로 지정
//RestController 안되면 일반 컨트롤러로 바꿔서 수행해보기
//다 하고나서 잘 되면 else절 다 없애기
@Controller 
public class ReplyController{
	@Autowired
	ReplyService rs;
	
	@RequestMapping(value="/reply")
	public ModelAndView reply(ReplyVO vo){
		List<ReplyVO> list = rs.re_list(vo.getRe_select());
		ModelAndView mav = new ModelAndView();
		mav.addObject("re_list",list);

		return mav;
	}
	
	
	@RequestMapping(value="/reply/{action}")
	@ResponseBody
	public void replyPost(Model model, ReplyVO vo, @PathVariable String action, HttpServletResponse response) throws ServletException, IOException{
		//@ResponseBody @RequestBody 확인
	    //System.out.println(vo);
		List<ReplyVO> list = rs.re_list(vo.getRe_select());
		System.out.println(vo.getRe_select());
		//해당 게시글의 댓글 list 나타냄
		if(action.equals("insert")) {
			rs.re_insert(vo,response);
			//model.addAttribute("re_list",list);
			//response.sendRedirect("");
		}else if(action.equals("update")) {
			rs.re_update(vo);
		}
		//response.sendRedirect(request.getRequestURI());
		/*System.out.println(request.getRequestURI());
		System.out.println(request.getPathInfo());
		System.out.println(request.getRequestURL());*/				
	}
	
}
