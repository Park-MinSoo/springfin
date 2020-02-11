package vo;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement	//jason은 상관이없고 xml은 넣는다. 지정한 class의 첫글자를 소문자로 바꾸고 그것을 root element로 삼는다.
public class MyModel {
	private String flowerName;
	private int num;
	private String id;
	
	public String getFlowerName() {
		return flowerName;
	}
	public void setFlowerName(String flowerName) {
		this.flowerName = flowerName;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "MyModel [flowerName=" + flowerName + ", num=" + num + ", id=" + id + "]";
	}	
	
}
