package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MemberVO;

@Repository
public class SignupDAOImpl implements SignupDAO {
	 @Autowired
	 private SqlSession sql;
	    
	 @Override
	 public void insertMember(MemberVO vo){
		 sql.insert("resource.memberMapper.insertMember",vo);
	 }
	 
	 @Override
	 public int idCheck(String sm_id) {
		 System.out.println("여기는 dao");
		 return sql.selectOne("resource.memberMapper.idCheck",sm_id);
	 }

}
