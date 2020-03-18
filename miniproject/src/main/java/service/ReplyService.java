package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import vo.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> re_list(int re_select);
	public void re_insert(ReplyVO vo,HttpServletResponse response) throws IOException;
	public void re_update(ReplyVO vo,HttpServletResponse response) throws IOException;
	public boolean re_delete(int re_id);
}
