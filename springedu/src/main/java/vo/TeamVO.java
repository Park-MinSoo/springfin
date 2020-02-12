package vo;

import java.util.List;
import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement
public class TeamVO {
	private String teamName;
	private List<TeamMemberVO> teamMember;
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public List<TeamMemberVO> getTeamMember() {
		return teamMember;
	}
	public void setTeamMember(List<TeamMemberVO> teamMember) {
		this.teamMember = teamMember;
	}
}
