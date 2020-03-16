package vo;

public class ReplyVO {
	private int re_id;
	private String re_writer;
	private String re_text;
	private String re_writedate;
	private int re_select;
	private int re_tup;
	
	public int getRe_id() {
		return re_id;
	}
	public void setRe_id(int re_id) {
		this.re_id = re_id;
	}
	public String getRe_writer() {
		return re_writer;
	}
	public void setRe_writer(String re_writer) {
		this.re_writer = re_writer;
	}
	public String getRe_text() {
		return re_text;
	}
	public void setRe_text(String re_text) {
		this.re_text = re_text;
	}
	public String getRe_writedate() {
		return re_writedate;
	}
	public void setRe_writedate(String re_writedate) {
		this.re_writedate = re_writedate;
	}
	public int getRe_select() {
		return re_select;
	}
	public void setRe_select(int re_select) {
		this.re_select = re_select;
	}
	public int getRe_tup() {
		return re_tup;
	}
	public void setRe_tup(int re_tup) {
		this.re_tup = re_tup;
	}
	@Override
	public String toString() {
		return "ReplyVO [re_id=" + re_id + ", re_writer=" + re_writer + ", re_text=" + re_text + ", re_writedate="
				+ re_writedate + ", re_select=" + re_select + ", re_tup=" + re_tup + "]";
	}
	
}
