package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.BoardVO;

@Repository
public class TradeBoardDAOImpl implements TradeBoardDAO {
	
	@Autowired
	SqlSession sql;
	
	private final String name = "resource.BoardMapper";
	
	@Override
	public boolean insert(BoardVO vo) {
		boolean result = false;
		if(sql.insert(name+".insertBoard",vo)==1)
			result = true;
		return result;
	}

	@Override
	public boolean delete(int id) {
		boolean result = false;
		if(sql.delete(name+".deleteBoard",id)==1)
			result = true;
		return result;
	}

	@Override
	public boolean update(BoardVO vo) {
		boolean result = false;
		if(sql.update(name+".updateBoard",vo)==1)
			result = true;
		return result;
	}

	@Override
	public List<BoardVO> listAll(String type) {
		List<BoardVO> list = new ArrayList<>();
		list = sql.selectList(name+".selectBoard",type);
		return list;
	}

	@Override
	public BoardVO listOne(int id) {
		BoardVO vo = new BoardVO();
		vo = sql.selectOne(name+".selectone",id);
		return vo;
	}

	@Override
	public List<BoardVO> listWriter(String writer) {
		List<BoardVO> list = new ArrayList<>();
		list = sql.selectList(name+".selectwriterBoard",writer);
		return list;
	}
	
	@Override
	public List<BoardVO> search(String keyword, String searchType){
		List<BoardVO> list = new ArrayList<>();
		Map<String,String> map = new HashMap<String,String>();
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		list = sql.selectList(name+".searchBoard",map);
		return list;
	}
}
