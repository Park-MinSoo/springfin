package service;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.SignupDAO;
import vo.MemberVO;

@Service
public class SignupSerivceImpl implements SignupService {
	@Autowired
	private SignupDAO dao;	    	
	
	@Override
	public void insertMember(MemberVO vo) {
        dao.insertMember(vo);
	}
	
	@Override
    public void idCheck(String sm_id, HttpServletResponse response) throws IOException{
		System.out.println("여기는 service");
		int num = dao.idCheck(sm_id);
		
		if(num==0) {
			response.getWriter().print("1");
		}else {
			response.getWriter().print("0");
		}
	}
}
