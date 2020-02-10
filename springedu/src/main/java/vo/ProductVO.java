package vo;

public class ProductVO {
	private int app;
	private int ban;
	private int bong;
	public int getApp() {
		return app;
	}
	public void setApp(int app) {
		this.app = this.app + app;
	}
	public int getBan() {
		return ban;
	}
	public void setBan(int ban) {
		this.ban = this.ban + ban;
	}
	public int getBong() {
		return bong;
	}
	public void setBong(int bong) {
		this.bong = this.bong + bong;
	}
}
