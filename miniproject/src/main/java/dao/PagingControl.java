package dao;

public class PagingControl {
	public int lineCnt = 10; 	// 한 화면에 구성하는 글 개수
	public int pageCnt = 5;  	// 한 화면의 페이지 개수
	public int postCnt = 0; 	// 요구 사항을 만족하는 글의 전체 개수
	public int pgNum = 1; 	        // 현재 페이지 넘버
	
	public int getPageCount() {	// 글의 개수에 따른 페이지 개수 계산
		return ((postCnt-1)/lineCnt)+1;		
	}
	public int getPageStart() {	// 각 화면별 시작 페이지 번호
		return ((pgNum-1)/pageCnt)*pageCnt+1;
	}
	public int getPageEnd() {	//각 화면별 종료 페이지 번호
		int result1 = getPageStart()+pageCnt-1;
		int result2 = getPageCount();
		if(result1>result2)
			return result2;
		else
			return result1;
	}
	public boolean isPreData() {	//이전 페이지들을 출력하는 left 이미지 출력 여부 결정
		boolean result = false;
		if(getPageStart()!=1)
			result = true;
		return result;
	}
	public boolean isNextData() {	//이전 페이지들을 출력하는 right 이미지 출력 여부 결정
		boolean result = false;
		if(getPageEnd()<getPageCount())
			result = true;
		return result;
	}
	public int getWritingStart() {	//현재 페이지 넘버에 따라 DB 서버에서 가져올 글의 시작 행 넘버
		return getWritingEnd()-lineCnt+1;
	}
	public int getWritingEnd() {	//현재 페이지 넘버에 따라 DB 서버에서 가져올 글의 종료 행 넘버
		return pgNum*lineCnt;
	}
}
