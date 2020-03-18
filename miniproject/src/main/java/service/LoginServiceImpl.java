package service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.LoginDAO;
import vo.MemberVO;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	LoginDAO dao;
	@Override
	public boolean loginCheck(MemberVO vo,HttpSession session) {
		boolean result = dao.loginCheck(vo);
		if(result) {
			MemberVO vo2 = viewMember(vo);
			session.setAttribute("sm_id", vo2.getSm_id());
		}
		return result;
	}

	@Override
	public MemberVO viewMember(MemberVO vo) {
		return dao.viewMember(vo);
	}
	

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

}
