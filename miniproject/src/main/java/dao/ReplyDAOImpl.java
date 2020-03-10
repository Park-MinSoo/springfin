package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	@Autowired
	SqlSession sql;
	
	private static String name = "resource.ReplyMapper";
	
	@Override
	public List<ReplyVO> re_list(int re_select) {
		List<ReplyVO> listup = new ArrayList<>();
		listup = sql.selectList(name+".replieslist",re_select);
		return listup;
	}

	@Override
	public boolean re_insert(ReplyVO vo) {
		boolean result = false;
		if(sql.insert(name+".replyinsert", vo)==1)
			result = true;
		return result;
	}

	@Override
	public boolean re_update(ReplyVO vo) {
		boolean result = false;
		if(sql.update(name+".replyupdate", vo)==1)
			result = true;
		return result;
	}

	@Override
	public boolean re_delete(int re_id) {
		boolean result = false;
		if(sql.delete(name+".replydelete", re_id)==1)
			result = true;
		return result;
	}

}
