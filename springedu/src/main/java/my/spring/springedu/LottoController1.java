package my.spring.springedu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.LottoService;
import vo.LottoVO;
@Controller
public class LottoController1 {
	@Autowired	//LottoController1이 객체 생성될때 행성된다.
	private LottoService lottoService;	
	@RequestMapping("/lotto1")
	public String lottoProcess(LottoVO vo) {// LottoVo vo 에서는 lottonum이 들어 있을 것이다.
		if (lottoService.getLottoProcess(vo.getLottoNum())) {
			vo.setResult("추카추카!!");
		} else {
			vo.setResult("아쉽네요 .. 다음 기회를!!");
		}
		return "lottoView1";
	}
}



