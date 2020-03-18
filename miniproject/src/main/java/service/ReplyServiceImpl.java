package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReplyDAO;
import vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	private final ReplyDAO dao;
	
    @Autowired
    public ReplyServiceImpl(ReplyDAO dao) {
        this.dao = dao;
    }
    
	@Override
	public List<ReplyVO> re_list(int re_select) {
		return dao.re_list(re_select);
	}

	@Override
	public void re_insert(ReplyVO vo,HttpServletResponse response) throws IOException{
		if(dao.re_insert(vo)) {
			response.getWriter().print("1");
		}else {
			response.getWriter().print("0");
		}
	}

	@Override
	public void re_update(ReplyVO vo,HttpServletResponse response) throws IOException{
		
		if(dao.re_update(vo)) {
			response.getWriter().print("1");
		}else {
			response.getWriter().print("0");
		}
	}

	@Override
	public boolean re_delete(int re_id) {
		boolean result = false;
		if(dao.re_delete(re_id))
			result = true;
		return result;
	}

}
