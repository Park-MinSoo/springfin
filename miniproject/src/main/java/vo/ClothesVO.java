package vo;

public class ClothesVO {
	private String cl_pid;
	private String cl_type;
	private String cl_color;
	private String cl_tpo;
	private String cl_fabric;
	private String cl_uri;
	public String getCl_pid() {
		return cl_pid;
	}
	public void setCl_pid(String cl_pid) {
		this.cl_pid = cl_pid;
	}
	public String getCl_type() {
		return cl_type;
	}
	public void setCl_type(String cl_type) {
		this.cl_type = cl_type;
	}
	public String getCl_color() {
		return cl_color;
	}
	public void setCl_color(String cl_color) {
		this.cl_color = cl_color;
	}
	public String getCl_tpo() {
		return cl_tpo;
	}
	public void setCl_tpo(String cl_tpo) {
		this.cl_tpo = cl_tpo;
	}
	public String getCl_fabric() {
		return cl_fabric;
	}
	public void setCl_fabric(String cl_fabric) {
		this.cl_fabric = cl_fabric;
	}
	public String getCl_uri() {
		return cl_uri;
	}
	public void setCl_uri(String cl_uri) {
		this.cl_uri = cl_uri;
	}
	@Override
	public String toString() {
		return "ClothesVO [cl_pid=" + cl_pid + ", cl_type=" + cl_type + ", cl_color=" + cl_color + ", cl_tpo=" + cl_tpo
				+ ", cl_fabric=" + cl_fabric + ", cl_uri=" + cl_uri + "]";
	}
	

}
