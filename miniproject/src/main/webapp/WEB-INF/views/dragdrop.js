var source, drop;
function initiate(){
  source=document.getElementById('image');
  source.addEventListener('dragstart', dragged, false);	//필수이벤트 처리, 드래그를 시작하면 dragged를 수행해라.

  drop=document.getElementById('dropbox');
  drop.addEventListener('dragover', function(e){console.log("dragover"); e.preventDefault(); }, false);
  // prevent default를 하도록 처리하였다.
  drop.addEventListener('drop', dropped, false);
}
function dragged(e){
	console.log("dragstart");
  var code='<img src="'+source.getAttribute('src')+'">';
  e.dataTransfer.setData('Text', code);
}
function dropped(e){
	console.log("drop");
  e.preventDefault();	//여기서도 똑같이 해주어야 한다.
  drop.innerHTML+=e.dataTransfer.getData('Text');	// += 를 통하여 드롭의 효과가 되도록 해주고 있다., 만약 그냥 = 일 경우에는 
}	// js와 html이 다른파일에 따로 구현되어 있을 경우 js만 수정되면 다시 js를 불러 오지 않으므로 개발자 도구를 띄운후 강력한 새로고침을 다시 눌러 주어야한다.
window.addEventListener('load', initiate);	// 이문서에 대한 로딩이 끝나면 initiate 호출을 해줘~







