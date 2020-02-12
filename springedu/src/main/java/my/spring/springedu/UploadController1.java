package my.spring.springedu;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import vo.FileVO;
@Controller
public class UploadController1 {
	@RequestMapping("/uploadForm1")//uploadForm1.jsp가 응답을 할 것이다.
	public void formFile() {	// 특별한 기능은 없지만 그냥 바로 Form파일로 요청을 넘기는 기능인 것이다.
	}	
	@RequestMapping("/upload")
	public ModelAndView saveFile(FileVO vo) {	    
	     String fileName =  vo.getUploadFile().getOriginalFilename();//getOriginalFilename을 하면 실제 파일이름을 가져오게된다.
	     byte[] content = null;
	     ModelAndView mav = new ModelAndView();
	     mav.setViewName("uploadForm1");
	     try {
	    	 content =  vo.getUploadFile().getBytes();
	    	 File f = new File("c:/uploadtest/"+fileName);
	    	 if ( f.exists() ) {
	    		 mav.addObject("msg", fileName + " : 파일이 이미 존재해요!!");
	    	 } else {
	    		 FileOutputStream fos = new FileOutputStream(f);
	    		 fos.write(content);
	    		 fos.close();
	    		 mav.addObject("msg", fileName + ": 파일이 저장되었어요!!");
	    	 }
	     } catch (IOException e) {
	    	 e.printStackTrace();
	    	 mav.addObject("msg", "오류가 발생했어요!!");
	     }	    
	    return mav;
	}
}

