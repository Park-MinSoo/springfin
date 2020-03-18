package dao;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import vo.BoardVO;

public interface BoardDAO {
	
	public boolean insert(BoardVO vo);
	public boolean delete(int id);
	public boolean update(BoardVO vo);
	public List<BoardVO> listAll(String type);
	public List<BoardVO> listAll(String type,int startNum,int endNum);
	public BoardVO listOne(int id);
	public List<BoardVO> listWriter(String writer);
	public List<BoardVO> search(String keyword, String searchType);
	public int listCount(String type);
	public void updatetup(BoardVO vo,HttpServletResponse response) throws IOException;
}
