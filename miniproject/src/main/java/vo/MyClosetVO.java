package vo;

public class MyClosetVO {
	private String cst_sm_id;
	private String cst_cl_id;
	public String getCst_sm_id() {
		return cst_sm_id;
	}
	public void setCst_sm_id(String cst_sm_id) {
		this.cst_sm_id = cst_sm_id;
	}
	public String getCst_cl_id() {
		return cst_cl_id;
	}
	public void setCst_cl_id(String cst_cl_id) {
		this.cst_cl_id = cst_cl_id;
	}
	@Override
	public String toString() {
		return "MyClosetVO [cst_sm_id=" + cst_sm_id + ", cst_cl_id=" + cst_cl_id + "]";
	}
	
	
}
