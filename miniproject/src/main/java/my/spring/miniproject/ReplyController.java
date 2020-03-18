package my.spring.miniproject;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.ReplyService;
import vo.ReplyVO;

@Controller 
public class ReplyController{
	@Autowired
	ReplyService rs;
	
	@RequestMapping(value="/reply/{action}")
	@ResponseBody
	public void replyPost(Model model, ReplyVO vo, @PathVariable String action, HttpServletResponse response) throws ServletException, IOException{
		List<ReplyVO> list = rs.re_list(vo.getRe_select());
		//System.out.println(vo.getRe_select());
		//해당 게시글의 댓글 list 나타냄
		if(action.equals("insert")) {
			rs.re_insert(vo,response);
			model.addAttribute("re_list",list);
			//response.sendRedirect("");
		}else if(action.equals("update")) {
			//System.out.println("update중");
			rs.re_update(vo, response);
		}
				
	}
	
}
