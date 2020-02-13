package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MeetingVO;
@Repository
public class MeetingMybatisDAO implements MeetingDAO{
	@Autowired
	SqlSession session = null;
	public List<MeetingVO> listAll() {
		System.out.println("Mybatis 를 사용 DB 연동-listAll-DAO");
		List<MeetingVO> list = null;
		String statement = "resource.MeetingMapper.selectMeeting";
		list = session.selectList(statement);
		return list;
	}
	
	public List<MeetingVO> search(String keyword) {
		System.out.println("Mybatis 를 사용 DB 연동-search-DAO");
		List<MeetingVO> list = null;
		String statement = "resource.MeetingMapper.searchMeeting";
		list = session.selectList(statement, keyword);
		return list;
	}
	
	public boolean insert(MeetingVO vo) {
		System.out.println("Mybatis 를 사용 DB 연동-insert-DAO");
		boolean result = false;
		String statement = "resource.MeetingMapper.insertMeeting";
		if (session.insert(statement, vo) == 1)
			result = true;
		return result;
	}
	

	public boolean delete(int eNo) {
		System.out.println("Mybatis 를 사용 DB 연동-delete-DAO");
		boolean result = false;
		String statement = "resource.MeetingMapper.deleteMeeting";
		if (session.delete(statement, eNo) == 1)
			result = true;
		return result;
	}
	
	public boolean update(MeetingVO vo) {
		System.out.println("Mybatis 를 사용 DB 연동-update-DAO");
		boolean result = false;
		String statement = "resource.MeetingMapper.updateMeeting";
		if (session.delete(statement, vo) == 1)
			result = true;
		return result;
	}
}


