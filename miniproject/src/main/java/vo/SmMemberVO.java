package vo;

public class SmMemberVO {
	private int id;
	private String sm_id;
	private String sm_pwd;
	private String name;
	private int age;
	private int height;
	private int weight;
	private String gender;
	private String joindate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSm_id() {
		return sm_id;
	}
	public void setSm_id(String sm_id) {
		this.sm_id = sm_id;
	}
	public String getSm_pwd() {
		return sm_pwd;
	}
	public void setSm_pwd(String sm_pwd) {
		this.sm_pwd = sm_pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	@Override
	public String toString() {
		return "SmMemberVO [id=" + id + ", sm_id=" + sm_id + ", sm_pwd=" + sm_pwd + ", name=" + name + ", age=" + age
				+ ", height=" + height + ", weight=" + weight + ", gender=" + gender + ", joindate=" + joindate +
				 "]";
	}
}
