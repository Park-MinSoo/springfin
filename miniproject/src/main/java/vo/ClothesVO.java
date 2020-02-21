package vo;

import java.sql.Blob;

public class ClothesVO {
	private int id;
	private String pidname;
	private String type;
	private String color;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPidname() {
		return pidname;
	}
	public void setPidname(String pidname) {
		this.pidname = pidname;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	@Override
	public String toString() {
		return "ClothesVO [id=" + id + ", pidname=" + pidname + ", type=" + type + ", color=" + color + "]";
	}
}
