package my.spring.springedu;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UploadController2 {
	@Autowired
	ServletContext context; 
	@RequestMapping("/uploadForm2")
	public void formFile() {
	}

	@RequestMapping("/upload2")
	public ModelAndView saveFile(MultipartRequest mreq) {
		ModelAndView mav = new ModelAndView();
		List<MultipartFile> list = mreq.getFiles("mfile");
		String resultStr = "";
		String path = "c:/uploadtest/multi";
		File isDir = new File(path);
		if (!isDir.isDirectory()) {
			isDir.mkdirs();
		}
		mav.setViewName("uploadForm2");
		for (MultipartFile mfile : list) {
			String fileName = mfile.getOriginalFilename();// 본래 파일의 이름을 추출
			try {
				File f = new File("c:/uploadtest/multi/" + fileName);
				//String fileInfo = context.getRealPath("/") + "resources/images/"+fileName;
				//File f = new File(fileInfo);
				if (f.exists()) {
					resultStr += fileName + " : 파일이 이미 존재해요!!<br>";
				} else {
					mfile.transferTo(f);// 받아와서 바로 저장하는 기능이다. (받아와서 추가적으로 무엇인가 action을 취하지는 못한다.)
					resultStr += fileName + " : 파일이 저장되었어요!!<br>";
				}
			} catch (IOException e) {
				e.printStackTrace();
				resultStr += fileName + " : 오류가 발생했어요!!";				
			}
		}
		mav.addObject("msg", resultStr);	
		return mav;
	}
}
