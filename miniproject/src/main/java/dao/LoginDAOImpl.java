package dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MemberVO;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Autowired
	SqlSession sql;
	
	@Override
	public boolean loginCheck(MemberVO vo) {
		boolean result = false;
		String statement = "resource.memberMapper.loginCheck";
		if(sql.selectOne(statement,vo) != null)
			result=true;				
		return result;
	}

	@Override
	public MemberVO viewMember(MemberVO vo) {
		String statement = "resource.memberMapper.viewMember";
		return sql.selectOne(statement, vo);
	}

	@Override
	public void logout(HttpSession session) {

	}

}
