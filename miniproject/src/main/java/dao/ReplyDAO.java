package dao;

import java.util.List;

import vo.ReplyVO;

public interface ReplyDAO {
	public List<ReplyVO> re_list(int re_select);
	public boolean re_insert(ReplyVO vo);
	public boolean re_update(ReplyVO vo);
	public boolean re_delete(int re_id);
}
