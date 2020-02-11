package dao;
import java.util.Random;
import org.springframework.stereotype.Repository;
@Repository	// 컴포넌트의 자식.. 결국은 spring 컨테이너가 객체 생성.
public class LottoDAO {
	public LottoDAO()  {
		System.out.println("LottoDAO 객체생성");
	}
	public int getLottoNumber() {
		Random rand = new Random();
		return rand.nextInt(6)+1;
	}
}
