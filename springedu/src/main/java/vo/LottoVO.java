package vo;
public class LottoVO {
	private int lottoNum;
	private String result;
	private int countNum;
	public LottoVO()  {
		System.out.println("LottoVO Create object");
	}
	public int getLottoNum() {
		return lottoNum;
	}
	public void setLottoNum(int lottoNum) {
		this.lottoNum = lottoNum;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public int getCountNum() {
		return countNum;
	}
	public void setCountNum(int countNum) {
		this.countNum += countNum;
	}
}
