package my.spring.springedu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import vo.MyGroupModel;
import vo.MyMainModel;
import vo.MyModel;
import vo.TeamMemberVO;
import vo.TeamVO;
import vo.XmlVO;

@Controller
public class MyTeamController {
	
	@RequestMapping(value = "/myteam/json", produces = "application/json; charset=utf-8")
	@ResponseBody
	public TeamVO getByTeamInJSON() {
		TeamVO team = new TeamVO();
		List<TeamMemberVO> teamMember = new ArrayList<TeamMemberVO>();
		TeamMemberVO myteam = new TeamMemberVO();
		myteam.setName("박민수");
		myteam.setNicName("주인님");
		teamMember.add(myteam);
		team.setTeamMember(teamMember);
		
		myteam = new TeamMemberVO();
		myteam.setName("박은하");
		myteam.setNicName("올라프");	
		teamMember.add(myteam);
		team.setTeamMember(teamMember);
		
		myteam = new TeamMemberVO();
		myteam.setName("엄규영");
		myteam.setNicName("엄복동");
		team.setTeamName("민수구영우나");
		teamMember.add(myteam);
		team.setTeamMember(teamMember);

		return team;
	}

	


	@RequestMapping(value = "/myteam/xml", produces = "application/xml; charset=utf-8")
	@ResponseBody
	public TeamVO getByTeamInXML() {
		TeamVO team = new TeamVO();
		List<TeamMemberVO> teamMember = new ArrayList<TeamMemberVO>();
		TeamMemberVO myteam = new TeamMemberVO();
		myteam.setName("박민수");
		myteam.setNicName("주인님");
		teamMember.add(myteam);
		team.setTeamMember(teamMember);
		
		
		myteam = new TeamMemberVO();
		myteam.setName("박은하");
		myteam.setNicName("올라프");	
		teamMember.add(myteam);
		team.setTeamMember(teamMember);
		
		
		myteam = new TeamMemberVO();
		myteam.setName("엄규영");
		myteam.setNicName("엄복동");
		team.setTeamName("민수구영우나");
		teamMember.add(myteam);
		team.setTeamMember(teamMember);

		return team;
	}

}
