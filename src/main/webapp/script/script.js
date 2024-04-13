
const wrapper = document.querySelector('.wrapper');
const loginLink = document.querySelector('.login-link');
const registerLink = document.querySelector('.register-link');
const btnPopup = document.querySelector('.btnLogin-popup');
const iconClose = document.querySelector('.icon-close');

if(registerLink != null)
registerLink.addEventListener('click', () => {
    wrapper.classList.add('active');
});
if(loginLink != null)
loginLink.addEventListener('click', () => {
    wrapper.classList.remove('active');
});
if(btnPopup != null)
btnPopup.addEventListener('click', () => {
    wrapper.classList.add('active-popup');
});
if(iconClose != null)
iconClose.addEventListener('click', () => {
    wrapper.classList.remove('active-popup');
});

const file1 = document.getElementById('file1')

if( file1 != null )
file1 .addEventListener('change', function() {
	
    var reader = new FileReader();
    reader.onload = function(e) {
        document.getElementById('previewImage').src = e.target.result;
        document.getElementById('previewImage').style.display = 'block';
    }
    reader.readAsDataURL(this.files[0]);
});


// 문서 준비 이벤트
$(document).ready(function(){
	
	// 메인 슬라이드
	mainSlide()
	
     $('.img_list li').last().prependTo('.img_list');
	     $('.img_list').css('left',-500);
	    setInterval(function(){
	        $('.img_list').animate({left:'-='+500},'slow',function(){
	        $('.img_list li') .first().appendTo('.img_list');
	        $('.img_list').css('left',-500);
	         }
	      );
	    },2000);
	  }
);
            
            
// 메인 슬아이드
function mainSlide() {
	new Swiper('.swiper-container', {
	
		slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
		spaceBetween : 30, // 슬라이드간 간격
		slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
		
		// 그룹수가 맞지 않을 경우 빈칸으로 메우기
		// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
		loopFillGroupWithBlank : true,
		
		loop : true, // 무한 반복
		
		pagination : { // 페이징
		    el : '.swiper-pagination',
		    clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
		},
		navigation : { // 네비게이션
		    nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		    prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
		},
	});
}



        
