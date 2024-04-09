<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>도서 대출서비스</title>
	  <jsp:include page="layout/meta.jsp"></jsp:include>
    <jsp:include page="layout/link.jsp"></jsp:include>
 	<jsp:include page="layout/script.jsp"></jsp:include>
</head>

<body>
   <jsp:include page="layout/header.jsp"></jsp:include>

    <section class="wrapper wrapper_home">
        <div class="home">
            <div class="home_info">
                <div class="heading">
                    <span>HOT BOOK</span>
                    <h1>세기의 책들 <span>20선 <img src="img/shape_114.svg" alt=""></span> click
                    </h1>
                </div>
                <p>원시 시대 동굴 속에서 나누던 이야기에서부터 디즈니의 애니메이션까지, 『일리아드』와 같은<BR>
                     고전에서부터 정치인 트럼프의 거짓말까지. 강력한 이야기는 삶을 구할 수 있고, 투표 결과를 <BR>
                     좌우할 수 있으며, 사회를 바꿀 수 있다. 또한 전쟁을 일으킬 수 있고 사람들을 영원히 반목시킬 <BR>
                        수도 있다. ‘이야기하는 원숭이’인 우리들은 이야기의 힘 덕분에 진화적 이점을 얻고, 문명을 이룰 <BR>
                            수 있었다.</p>
                <button class="btn">바로가기</button>
               
                <div>
                    <h2>A+ 지식</h2>
                    <p>다양한 분야의 책을 엄선하여 추천드립니다.</p>
                </div>
            </div>
            <div class="home_img">
                <div>
                    <img src="img/home1.jpg" alt="" class="home_img1">
                    <img src="img/home2.png" alt="" class="home_img2">
                </div>
                <img src="img/home3.jpg" alt="" class="home_img3">
            </div>
        </div>
        <div class="brands">
            <h2>100+ 지식 한스푼</h2>
            <div>
                <p>소설</p>
                <p>추리</p>
                <p>상식</p>
                <p>과학</p>
                <p>인문</p>
                <p>예술</p>
            </div>
        </div>
    </section>

    <section class="wrapper" style="background: #ffdbdb;">
        <div class="about">
            <img src="img/about1.jpg" alt="" class="about_img" style="width: 50px;height: 50px;">
            <img src="img/about2.jpg" alt="" class="about_img">
            <img src="img/about3.jpg" alt="" class="about_img">
            <img src="img/about4.jpg" alt="" class="about_img">
            <img src="img/icon_92.svg" alt="">
            <h1>올해 독자들의 예약 <span>1위</span>아직 모르시나요? 지금 예약하시면 집근처에 책이 배달해드립니다.</h1>
            <p>당신의 오늘은 어제보다 아름다워요</p>
        </div>
    </section>

    <section class="wrapper">
        <div class="features">
            <div class="features_img">
                <img src="img/about1.jpg" alt="">
            </div>
            <div class="features_info">
                <div class="heading">
                    <span>MD 추천</span>
                    <h1>재미있는 <span>게임 <img src="img/shape_114.svg" alt=""></span>이야기를<BR> 따라가보세요</h1>
                </div>
                <p>4월 1째주 인기작 </p>
                <ul>
                    <li><i class="fa-solid fa-circle-check"></i>게임을 좋아하는 모노</li>
                    <li><i class="fa-solid fa-circle-check"></i>죽마고우였던 친구 고우창과 게임을</li>
                    <li><i class="fa-solid fa-circle-check"></i>만들며 시작되는 흥미로운 이야기</li>
                </ul>
                <button class="btn">지금 예약가능합니다</button>
            </div>
        </div>
    </section>

    <section class="wrapper" style="background: #ffeeee;">
     <div class="lead">
        <h1>너에게 <span>읽어주고싶은</span> 동화이야기</h1>
        <p>
            전 세계가 사랑하는 가장 아름다운 이야기, 생텍쥐페리의 『어린 왕자』가 문학 평론가 황현산 선생의 번역으로 열린책들에서 출간되었다. 프랑스어 원문에 대한 섬세한 이해, 정확하고도 아름다운 문장력, 예리한 문학적 통찰을 고루 갖춘 번역으로 문학 번역에서 큰 입지를 굳혀 온 황현산 선생은 이 작품을 새롭게 번역...
        </p>
        <div class="lead_cards">
            <div class="lead_card" >
                <img src="img/about1.jpg" alt="">
                <p>어린왕자</p>
            </div>
            <div class="lead_card">
                <img src="img/about2.jpg" alt="">
                <p>헨델과그레텔</p>
            </div>
            <div class="lead_card">
                <img src="img/about3.jpg" alt="">
                <p>노인과바다</p>
            </div>
        </div>
     </div>
    </section>
    <section class="wrapper">
        <div class="counters">
          <div class="counter">
            <h1>15780권</h1>
            <p>우리 도서관 보유서적</p>
          </div>
          <div class="counter">
            <h1>350명</h1>
            <p>하루 이용자 수</p>
          </div>
          <div class="counter">
            <h1>3건</h1>
            <p>독자 참여행사</p>
          </div>
          <div class="counter">
            <h1>8명</h1>
            <p>우리도서관 봉사자</p>
          </div>

        </div>
    </section>
 <section class="wrapper success_wrapper">
    <div class="success">
        <div class="success_sec1">
                <div class="success_sec1_info">
                    <h2>이달의 독서퀸 <span>flower님</span>추천 도서 "틀려도 괜찮아"</h2>
                    <h3>"아는 사람 손 들어봐", "할 수 있는 사람 나와 봐"로 시작하는 수업 시간에 잘 모르는 아이, 자신이 없는 아이의 가슴은 오그라든다. 망설이는 초등학교 신입생들에게 교실이 틀려도 괜찮은 곳, 틀리면서 정답을 찾아가는 곳이라는 것을 깨닫게 해주는 그림 동화책이다.</h3>
            </div>
        </div>
        <div class="success_sec2">
            <img src="img/success3.jpg" alt="">
            <div class="success_sec2_info">
                 <h3>김정호 작가님 추천작</h3>
                <h2> 당신여기있어요 <span>라에티티아 부르제 지음</span>마음을 녹이는 따뜻한 글을 느껴보세요</h2>
           </div>
            <img src="img/success2.jpg" alt="">
        </div>
    </div>

 </section>
<section>
 <div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide"><img src="img/about1.jpg"></div>
		<div class="swiper-slide"><img src="img/about2.jpg"></div>
		<div class="swiper-slide"><img src="img/about3.jpg"></div>
		<div class="swiper-slide"><img src="img/about4.jpg"></div>
		<div class="swiper-slide"><img src="img/home1.jpg"></div>
		<div class="swiper-slide"><img src="img/home2.jpg"></div>
		<div class="swiper-slide"><img src="img/home3.png"></div>
		<div class="swiper-slide"><img src="img/features.png"></div>
	</div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

	<!-- 페이징 -->
	<div class="swiper-pagination"></div>
</div>
<div style="text-align:center; margin-top:5px;">우리도서관 갤러리</div>
 </section>
<section>
    <div class="contact">
        <div class="heading">
            <h1>도서예약</h1>
        <p>예약기간을 확인하세요</p>
        </div>
        <form action="">
            <div>아래 내용을 기입하세요</div>
            <div class="date_area">
            <input type="date" placeholder="기간체크" class="date_one">
            <input type="date" placeholder="기간체크" class="date_one">
           </div>
           <span>수령장소</span>
            <label for="lang"></label>
            <select name="languages" id="lang" class="adress">
              <option value="중구">중구</option>
              <option value="동구">동구</option>
              <option value="남구">남구</option>
              <option value="북구">북구</option>
            </select>
            <textarea name="" id="" cols="30" rows="10">글을 쓰세요</textarea>
            <button>저장</button>
        </form>
    </div>
</section>


	<!-- 푸터 -->
	<jsp:include page="layout/footer.jsp"></jsp:include>

</body>
</html>