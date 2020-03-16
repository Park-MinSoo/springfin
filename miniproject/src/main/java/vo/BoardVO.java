package vo;

public class BoardVO {
	private int id;
	private String writer;
	private String title;
	private String content;
	private String writedate;
	private int cnt;
	private int tup;
	private String type;
	private String uri;
	private String location;
	
	public String getUri() {
		return uri;
	}
	public void setUri(String uri) {
		this.uri = uri;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getTup() {
		return tup;
	}
	public void setTup(int tup) {
		this.tup = tup;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "BoardVO [id=" + id + ", writer=" + writer + ", title=" + title + ", content=" + content + ", writedate="
				+ writedate + ", cnt=" + cnt + ", tup=" + tup + ", type=" + type + "]";
	}
	
	
}
