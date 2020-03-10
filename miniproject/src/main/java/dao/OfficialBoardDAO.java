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
public class OfficialBoardDAO {
	@Autowired
	SqlSession session = null;

	public List<BoardVO> listAll() {
		List<BoardVO> list = new ArrayList<>();
		String statement = "resource.OfficialBoardMapper.selectOfficial";
		list = session.selectList(statement);
		return list;
	}

	public boolean insert(BoardVO vo) {
		System.out.println(" 확인 " + vo.getWritedate());
		boolean result = false;
		String statement = "resource.OfficialBoardMapper.insertOfficial";
		if (session.insert(statement, vo) == 1)
			result = true;
		return result;
	}

	public List<BoardVO> search(String keyword, String searchType) {
		List<BoardVO> list =  new ArrayList<BoardVO>();
		String statement = "resource.OfficialBoardMapper.searchOfficial";
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		list = session.selectList(statement, map);
		return list;
	}

	public List<BoardVO> listWriter(String writer) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		String statement = "resource.OfficialBoardMapper.selectOfficialWriter";
		list = session.selectList(statement, writer);
		return list;
	}

	public boolean delete(int id) {
		boolean result = false;
		String statement = "resource.OfficialBoardMapper.deleteOfficial";
		if (session.delete(statement, id) == 1)
			result = true;
		return result;
	}

	public boolean update(BoardVO vo) {
		boolean result = false;
		String statement = "resource.OfficialBoardMapper.updateOfficial";
		if (session.update(statement, vo) == 1)
			result = true;
		return result;
	}

	public BoardVO listOne(int id) {
		BoardVO vo = null;
		String statement = "resource.OfficialBoardMapper.selectOfficialOne";
		String statement2 = "resource.OfficialBoardMapper.officialCntup";

		vo = session.selectOne(statement, id);
		session.update(statement2, vo);

		return vo;
	}

}
