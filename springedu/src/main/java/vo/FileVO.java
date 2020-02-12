package vo;

import org.springframework.web.multipart.MultipartFile;

public class FileVO {
	private MultipartFile uploadFile;// MultipartFile 이라는 객체로 저장을 하게 된다.
//	private MultipartFile[] uploadFile; 여러개를 받으려면 이렇게 [] 배열변수로 만들어 주면 된다.
	public MultipartFile getUploadFile() {		
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
}
