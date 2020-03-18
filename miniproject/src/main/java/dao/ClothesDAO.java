package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.ClothesVO;

@Repository
public class ClothesDAO {
	@Autowired
	SqlSession session = null;
	
	public List<ClothesVO> listAll(){
		List<ClothesVO> list = new ArrayList<>();
		String statement = "resource.ClothesMapper.selectUri";
		list = session.selectList(statement);
		return list;
	}
}
