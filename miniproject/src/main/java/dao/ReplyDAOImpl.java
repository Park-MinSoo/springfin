package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	@Autowired
	SqlSession sql;
	
	private static String name = "resource.replyMapper";
	
	@Override
	public List<ReplyVO> re_list(int re_select) {
		List<ReplyVO> listup = new ArrayList<>();
		listup = sql.selectList(name+".replieslist",re_select);
		return listup;
	}

	@Override
	public boolean re_insert(ReplyVO vo){
		boolean result = false;
		if(sql.insert(name+".replyinsert", vo)==1) {
			result = true;
		}
		return result;		
	}

	@Override
	public boolean re_update(ReplyVO vo) {
		boolean result = false;
		Map<String, Object> map = new HashMap<>();
		map.put("re_text",vo.getRe_text());
		map.put("re_id",vo.getRe_id());
		if(sql.update(name+".replyupdate", map)==1)
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
