package my.spring.springedu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MeetingDAO;
import vo.MeetingVO;

@Controller
public class MeetingController {
	@Autowired
	MeetingDAO dao;

	@RequestMapping("/meetingForm")
	protected String form() {
		return "meetingView";
	}

	@RequestMapping("/meeting")
	protected ModelAndView select(MeetingVO vo, String keyword, String action) {
		ModelAndView mav = new ModelAndView();
		int id = vo.getId();
		String name = vo.getName();
		if (keyword == null) {
			if (action != null) {

				if (action.equals("delete")) {
					boolean result = dao.delete(id);
					if (result) {
						mav.addObject("msg", "글이 성공적으로 삭제되었습니다.");
					} else {
						mav.addObject("msg", "글이 삭제되지 않았습니다.");
					}
				} else if (action.equals("insert")) {
					boolean result = dao.insert(vo);
					if (result) {
						mav.addObject("msg", name + "님이 글이 성공적으로 입력되었습니다.");
					} else {
						mav.addObject("msg", name + "님의 글이 입력되지 않았습니다.");
					}
				}
				} else {
					boolean result = dao.update(vo);
					if (result) {
						mav.addObject("msg", name + "님의 글이 성공적으로 수정되었습니다.");
					} else {
						mav.addObject("msg", name + "님의 글이 수정되지 않았습니다.");
					}
				}
			
			mav.addObject("list", dao.listAll());

		} else {
			List<MeetingVO> list = dao.search(keyword);
			if (list != null && list.size() == 0) {
				mav.addObject("msg", keyword + "(이)가 포함된 글이 없습니다.");
			} else {
				mav.addObject("list", dao.search(keyword));
			}
		}
		mav.setViewName(form());
		return mav;
	}
}
