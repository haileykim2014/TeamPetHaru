//등록하기
  function addPopup(){
    console.log("addPopup");
    document.getElementById("popup-3").classList.toggle("active");

  }

//상세보기 popup-3-1
  function togglePopup(id){
    console.log("profile");
	console.log(id);
    document.getElementById(`popup-1-${id}`).classList.toggle("active");
	let petId = document.querySelector('#petId');
	
	if(id) 
	petId.value = `${id}`;
	console.log(petId.value);
	
	let pet;
	pet = document.querySelector(`.pet-id-${petId.value}`);
	if (pet.classList.contains('d-none')) {
		pet.classList.remove('d-none');	
	}

  }
//수정하기  
  function updatePopup(id){
    console.log("update");
	const inputId = document.querySelector('.hiddenId');
	
	console.log(inputId.value);
	
	inputId.value=id;
	
    document.getElementById(`popup-2-${id}`).classList.toggle("active");
    document.getElementById(`popup-1-${id}`).classList.remove("active");
	/*let petId = document.querySelector('#petId');
	let pet;
	pet = document.querySelector(`.pet-id-${petId.value}`);
	pet.classList.toggle('d-none');*/
  }
//삭제확인팝업
  function confirmPopup(id){
	event.preventDefault();
    console.log("confirmPopup");
	console.log(id);
    document.getElementById(`popup-4-${id}`).classList.toggle("active");
    //if(e.target.contains("cancel"))
    //document.getElementById(`popup-4-${id}`).classList.remove("active");
  }
  //삭제결과팝업
  function resultPopup(id){
    console.log("resultPopup");
	location.href = `del?id=${n.id}`;
    document.getElementById(`popup-1-${id}`).classList.remove("active");
    document.getElementById(`popup-4-${id}`).classList.remove("active");
    document.getElementById(`popup-5-${id}`).classList.toggle("active");
  }

/*
  window.addEventListener("load",function(){
	var petList = document.querySelector('.pet-list');
	console.log(petList);
	
	bind("http://localhost:8080/api/pet-management/mypet/list");
	
	function bind(url) {
		var request = new XMLHttpRequest();

		request.onload = function() {
			
			//자식지우는 트릭
			petList.innerHTML = "";
			//새로운목록채우는코드
			var list = JSON.parse(request.responseText);
			console.log(request.responseText);
			for (var i = 0; i < list.length; i++) {
				var divBox =`<div class="box">
                      <a class="" href="">
                          <div class="img-box"><img src="https://static.parastorage.com/services/instagram-cdn/1.691.0/assets/ig-templates-accounts/Editor/Dogs%20Apparel/03.jpg"></div>
                       </a>
                          <div class="diary-content">
                              <h4>${list[i].name}</h4>
                                 <div class="button detail-btn" id="detail-button"onclick="togglePopup()" >
                                  상세보기
                                  </div>
                            </div><!--diary-content-->
                     </div><!--box--> `;
				
				petList.insertAdjacentHTML("beforeend",divBox);
			}
			
		}//onload
		request.open("GET", url, true);//false 동기
		request.send(null);
	}	
	

    /*---------------반려 동물 삭제---------------------*/
    const deleteButton = document.querySelector(".delete");
    const cancel = document.querySelector(".cancel");
    
    // deleteButton.onclick = function(e){
    //   var target = e.target;
    //   console.log("삭제버튼눌림");
    //   //삭제여부묻기
    //   document.getElementById("popup-4").classList.toggle("active");
    //   console.log(target);
    // }
    // cancel.onclick =function(e){
    //   console.log("취소버튼눌림");
    //   document.getElementById("popup-4").classList.toggle("active");
    // }

window.addEventListener("load", function() {    
/*-------------------사진업로드----------------------*/
	var fileButton = document.querySelector(".file-button"); //가 실행
	var fileTriggetButtons = document.querySelectorAll(".file-trigger-button");//가 클릭되지만
console.log(fileTriggetButtons);
	for(let i = 0; i < fileTriggetButtons.length; i++) {
		fileTriggetButtons[i].onclick = function() {
			var event = new MouseEvent("click", {
				'view': window,
				'bubbles': true,
				'cancelable': true
			});
			fileButton.dispatchEvent(event);//이벤트전달
		};	
	}
	
	const uploadBox = document.querySelector("#upload-box");
	console.log(uploadBox);
	
	uploadBox.ondragenter = function() {

		console.log("enter");
	};
	
	uploadBox.ondragleave = function() {
		console.log("leave");
		uploadBox.classList.remove("valid");
		uploadBox.classList.remove("invalid");
	};
	
	uploadBox.ondragover = function(e) {
		e.preventDefault();
		let dt= e.dataTransfer;
		
		//가져오는순간 유효하지않다면말해주기
		var valid = dt.types.indexOf("Files") >= 0;
		
		if(valid){
			uploadBox.classList.add("valid");
		}
		else{
			uploadBox.classList.add("invalid");
		}

	};
	
	uploadBox.ondrop = function(e) {
		e.preventDefault();		
		
		uploadBox.classList.remove("valid");
		uploadBox.classList.remove("invalid");
		
		let dt = e.dataTransfer;
		if(dt.files.length>1){
			alert("파일은 하나만 전송이가능합니다.");
			return;
		}
		
		if(dt.files[0].size > 500*1024*1024){
			alert("죄송합니다. 500MByte를 초과할수 없습니다.");
			return;
		}		
		
		let formData = new FormData();
		formData.append("p","/upload/test");
		formData.append("f",dt.files[0])//서버에 f로보냄
		
		let request = new XMLHttpRequest();
		request.onload = function(){
			console.log("완료");
		};
		request.upload.onprogress = function(e){
			console.log(`total:${e.total},loaded:${e.loaded}`);
		}
		
		request.open("POST","/uploader",true);
		request.send(formData);
		
		console.log("drop");
	};
	
})