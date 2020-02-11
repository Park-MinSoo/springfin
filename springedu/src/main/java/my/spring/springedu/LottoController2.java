package my.spring.springedu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import service.LottoService;
import vo.LottoVO;
@Controller
@SessionAttributes("lottoVO")
public class LottoController2 {
	@ModelAttribute("lottoVO")
	public LottoVO count() {	
		return new LottoVO();
	}
	@Autowired
	private LottoService lottoService;	
	@RequestMapping("/lotto2")
	public String lottoProcess(@ModelAttribute("lottoVO")LottoVO vo) {
		
		if(3 >= vo.getCountNum()) {
			if (lottoService.getLottoProcess(vo.getLottoNum())) {
				vo.setResult("추카추카!!");
				vo.setCountNum(4);
			} else {
				vo.setResult("아쉽네요 .. 다음 기회를!!");
				vo.setCountNum(1);
			}
		}
		else {
			vo.setResult("4번 째 요청부터는 브라우저를 재기동해야 응모할 수 있어요 ㅠㅠ");
		}
		return "lottoView2";
	}
}

