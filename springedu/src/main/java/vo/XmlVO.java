package vo;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement//(name="unico" 이런식으로 root element 명을 직접 줄수도 있다.)
public class XmlVO {
	private List<MyModel> list;
	public List<MyModel> getList() {
		return list;
	}
	public void setList(List<MyModel> list) {
		this.list = list;
	}
}
