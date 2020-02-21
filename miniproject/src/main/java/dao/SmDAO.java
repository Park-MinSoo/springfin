package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.TableVO;

@Repository
public class SmDAO {
	@Autowired
	SqlSession session = null;

	public List<TableVO> listAll() {
		List<TableVO> list = new ArrayList<>();
		String statement = "resource.NewsMapper.selectNews";
		list = session.selectList(statement);
		return list;
	}

	public boolean insert(TableVO vo) {
		System.out.println(" 확인 " + vo.getWritedate());
		boolean result = false;
		String statement = "resource.NewsMapper.insertNews";
		if (session.insert(statement, vo) == 1)
			result = true;
		return result;
	}

	public List<TableVO> search(String keyword, String searchType) {
		List<TableVO> list =  new ArrayList<TableVO>();
		String statement = "resource.NewsMapper.searchNews";
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		list = session.selectList(statement, map);
		return list;
	}

	public List<TableVO> listWriter(String writer) {
		List<TableVO> list = new ArrayList<TableVO>();
		String statement = "resource.NewsMapper.selectNewsWriter";
		list = session.selectList(statement, writer);
		return list;
	}

	public boolean delete(int id) {
		boolean result = false;
		String statement = "resource.NewsMapper.deleteNews";
		if (session.delete(statement, id) == 1)
			result = true;
		return result;
	}

	public boolean update(TableVO vo) {
		boolean result = false;
		String statement = "resource.NewsMapper.updateNews";
		if (session.update(statement, vo) == 1)
			result = true;
		return result;
	}

	public TableVO listOne(int id) {
		TableVO vo = null;
		String statement = "resource.NewsMapper.selectNewsOne";
		String statement2 = "resource.NewsMapper.newsCntup";

		vo = session.selectOne(statement, id);
		session.update(statement2, vo);

		return vo;
	}

}
