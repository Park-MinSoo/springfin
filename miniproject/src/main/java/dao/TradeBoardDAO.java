package dao;

import java.util.List;

import vo.BoardVO;

public interface TradeBoardDAO {
	
	public boolean insert(BoardVO vo);
	public boolean delete(int id);
	public boolean update(BoardVO vo);
	public List<BoardVO> listAll(String type);
	public BoardVO listOne(int id);
	public List<BoardVO> listWriter(String writer);
	public List<BoardVO> search(String keyword, String searchType);
		
}
