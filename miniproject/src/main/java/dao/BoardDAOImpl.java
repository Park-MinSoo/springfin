package dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	SqlSession sql;
	
	private final String name = "resource.boardMapper";
	
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
	public boolean update(BoardVO vo){
		boolean result = false;
		if(sql.update(name+".updateBoard",vo)==1) {
			result = true;
		}
		return result;
	}

	@Override
	public List<BoardVO> listAll(String type) {
		List<BoardVO> list = new ArrayList<>();
		list = sql.selectList(name+".selectBoard",type);
		return list;
	}

	@Override
	public List<BoardVO> listAll(String type,int startNum,int endNum){
		List<BoardVO> list = new ArrayList<>();
		HashMap<String, Object> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("type",type);
		list = sql.selectList(name+".pageBoard",map);
		return list;
	}
	
	@Override
	public BoardVO listOne(int id) {
		BoardVO vo = new BoardVO();
		vo = sql.selectOne(name+".selectone",id);
		sql.update(name+".updatecntBoard",vo);
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
	
	@Override
	public int listCount(String type) {
		//System.out.println("sql : "+sql);
		int count = 0;
		if(sql.selectOne(name+".listCount")!=null) {
			count = sql.selectOne(name+".listCount",type);
		}else {
			System.out.println("null이에유");
		}
		return count;
	}
	
	@Override
	public void updatetup(BoardVO vo,HttpServletResponse response) throws IOException{
		Map<String, Object> map = new HashMap<>();
		map.put("tup",vo.getTup());
		map.put("id",vo.getId());
		int i = sql.update(name+".updatetup",map);
		//System.out.println(id + "는 id");
		//System.out.println(i+ "는 뭐다");
		if(i==1)
			response.getWriter().print("1");
		else
			response.getWriter().print("0");		
	}
}