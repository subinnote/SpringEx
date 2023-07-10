<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/a1a07b498c.js" crossorigin="anonymous"></script>
<script type="text/javascript">

	// 리스트 조회 및 출력
	
	// 1. 서버에 댓글리스트 요청
	function getList(){
		let bno = document.querySelector('#bno').value;
		// url요청 결과를 받아옵니다.
		fetch('/reply/list/' + bno)
		// response.json() : 요청결과를 js object형식으로 반환
		.then(response => response.json())
		// 반환받은 오브젝트를 이용하여 화면에 출력합니다.
		.then(list => replyView(list));
	}
	
	// 2. 리스트를 화면에 출력
	function replyView(list){
		// 콘솔창에 리스트 출력
		console.log(list)
		// 답글을 DIV에 출력	
		
		replyDiv.innerHTML = '';
		
		list.forEach((reply, index)=>{
		replyDiv.innerHTML
		+= '<figure id="reply'+ index +'">'
		+ '		<blockquote class="blockquote">'
		+ '			<p>'+ reply.reply 
		+ '<i class="fa-regular fa-pen-to-square"></i>'
		+ '<i class="fa-regular fa-trash-can" onclick="replyDelete('+ reply.rno +')"></i>'
		+ '</p>'	
		+ '		</blockquote>'
		
		+ '		<figcaption class="blockquote-footer">'
		+ '		' + reply.replyer + ' <cite title="Source Title">'+ reply.replydate +'</cite>'
		+ '		</figcaption>'
		+ '</figure>';	

		});
	}
	
	function replyDelete(rno){
		// url요청 결과를 받아옵니다.
		fetch('/reply/delete/' + rno)
		// response.json() : 요청결과를 js object형식으로 반환
		.then(response => response.json())
		// 반환받은 오브젝트를 이용하여 화면에 출력합니다.
		.then(map => replyWriteRes(map));
	}
	
	
	// 버튼이 생성되고 나서 이벤트를 부여하기위해 onload 이벤트에 작성
	window.onload = function(){
		getList();
		btnWrite.addEventListener('click', function(){
			// 1. 파라메터 수집
			let bno = document.querySelector('#bno').value;
			let reply = document.querySelector('#reply').value;
			let replyer = document.querySelector('#replyer').value;
			
			console.log('bno', bno)
			console.log('reply', reply)
			console.log('replyer', replyer)
			
			// 2. 전송할 데이터를 javascript 객체로 생성
			let replyObj = {
				bno : bno
				, reply : reply
				, replyer : replyer
			};
			
			// 3. 객체를 json타입 문자열으로 변환
			let replyJson = JSON.stringify(replyObj);
			
			console.log('replyObj', replyObj);
			console.log('replyJson', replyJson);
			
			// 4. 서버에 요청
			fetch('/reply/insert'
					, {method : 'post'
						, headers : {'Content-Type' : 'application/json'}
						, body : replyJson})
				// 5. 응답처리
				.then(response => response.json())
				.then(map => replyWriteRes(map));
		});
	}
	function replyWriteRes(map){
		if(map.result == 'success'){
			// 등록성공
			getList();
		} else {
			// 등록실패
			alert(map.message);
		}
		
	}
</script>
</head>
<body>
<h2>답글달기</h2>
<input type="text" name="bno" id="bno" value="101">

<div class="input-group mb-3">
  <input type="text" id="replyer">
  <input type="text" id="reply" class="form-control" placeholder="댓글을 작성해주세요" aria-label="Recipient's username" aria-describedby="basic-addon2">
  <span class="input-group-text" id="btnWrite">댓글작성</span>
</div>

<div id="replyDiv"></div>



</body>
</html>