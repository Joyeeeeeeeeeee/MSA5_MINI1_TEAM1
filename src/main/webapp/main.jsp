<%@page import="DTO.Users"%>
<%@page import="DTO.Book"%>
<%@page import="java.util.List"%>
<%@page import="Service.BookServiceImpl"%>
<%@page import="Service.BookService"%>
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

  <!-- Header-->
            <header class="bg-dark py-5">
                <div class="container px-5">
                    <div class="row gx-5 align-items-center justify-content-center">
                        <div class="col-lg-8 col-xl-7 col-xxl-6">
                            <div class="my-5 text-center text-xl-start">

                                <h1 class="display-5 fw-bolder text-white mb-2"><p class="lead fw-normal text-white-50 mb-4">재레드 다이아몬드가 저술한 저서</p> 이달의 대출 베스트 1위</h1>
                                <p class="lead fw-normal text-white-50 mb-4">왜 구대륙에서만 문명이 먼저 발달하고, 신대륙을 비롯한 그 이외의 지역에서는 일정 이상으로 문명이 발달하지 못했는가</p>
                                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                                    <a class="btn btn-primary btn-lg px-4 me-sm-3" href="product.jsp">대출하기</a>
                                    <a class="btn btn-outline-light btn-lg px-4" href="product.jsp">상세보기</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-5 col-xxl-4 d-none d-xl-block text-center"><img class="img-fluid rounded-3 my-5" src="img/03.jpg" alt="..." /></div>
                    </div>
                </div>
            </header>
                 <!-- Blog preview section-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center">
                                <h2 class="fw-bolder">새로나온 책</h2>
                                <p class="lead fw-normal text-muted mb-5">다양한 장르의 엄선된 최신 인기작품을 만나보세요 </p>
                            </div>
                        </div>
                    </div>
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="img/about3.jpg" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">Best</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">나쓰메 소세키 작가</h5></a>
                                    <p class="card-text mb-0">마음(こころ)은 1914년에 일본 작가 나쓰메 소세키가 발표한 소설이다. 작가가 사망하기 2년 전에 발표한 소설이며 사망하기 전으로부터 3번째로 발표한 작품. </p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">명란마요</div>
                                                <div class="text-muted">March 12, 2023 &middot; 6 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="img/book06.jpeg" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">HOT</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">샤우나 샤피로 지음</h5></a>
                                    <p class="card-text mb-0">저자 샤우나 샤피로는 상담심리학 교수다. 명상, 심리 치료 분야에서는 세계적인 전문가다. 여러 임상 실험 및 연구 결과를 활용해 명상의 효과를 알리고 있다.</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">허니버터 치즈</div>
                                                <div class="text-muted">March 23, 2023 &middot; 4 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="img/04.jpg" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">New</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">칼세이건 지음</h5></a>
                                    <p class="card-text mb-0">저자 샤우나 샤피로는 상담심리학 교수다. 명상, 심리 치료 분야에서는 세계적인 전문가다. 여러 임상 실험 및 연구 결과를 활용해 명상의 효과를 알리고 있다. </p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">오야코동</div>
                                                <div class="text-muted">April 2, 2023 &middot; 10 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            <!-- Features section-->
            <section class="py-5" id="features" style="background:#F5F7F8">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0">도서관 행사</h2></div>
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">
                                <div class="col mb-5 h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-collection"></i></div>
                                    <h2 class="h5">도서나눔 바자회</h2>
                                    <p class="mb-0">행사일시 : 매주 2째주 토요일 9시~4시까지<br>참가자 : 누가나 참여가능<br>준비물:중고서적과 굿즈</p>
                                </div>
                                <div class="col mb-5 h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-building"></i></div>
                                    <h2 class="h5">도서관 탐방</h2>
                                    <p class="mb-0">행사일시 : 매주 2째주 토요일 9시~4시까지<br>참가자 : 누가나 참여가능<br>준비물:중고서적과 굿즈</p>
                                </div>
                                <div class="col mb-5 mb-md-0 h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-toggles2"></i></div>
                                    <h2 class="h5">도서관 봉사</h2>
                                    <p class="mb-0">행사일시 : 매주 2째주 토요일 9시~4시까지<br>참가자 : 누가나 참여가능<br>준비물:중고서적과 굿즈.</p>
                                </div>
                                <div class="col h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-toggles2"></i></div>
                                    <h2 class="h5">벗꽃음악회</h2>
                                    <p class="mb-0">행사일시 : 매주 2째주 토요일 9시~4시까지<br>참가자 : 누가나 참여가능<br>준비물:중고서적과 굿즈</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Testimonial section-->
            <div class="py-5 bg-light">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-10 col-xl-7">
                            <div class="text-center">
                                <div class="fs-4 mb-4 fst-italic">나를 소모하지 않는 현명한 태도에 관하여<br> "기분은 선택할 수 없어도 태도는 선택할 수 있다" 독일 최고의 언론인이자 베스트셀러 작가의 삶과 행복 태도의 성공에 대한 우아한 통찰</div>
                                <div class="d-flex align-items-center justify-content-center">
                                    <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                    <div class="fw-bold">
                                        OmiJa
                                        <span class="fw-bold text-primary mx-1">/</span>
                                        CEO, kkk
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                    <!-- Call to action-->
                    <aside class="bg-primary bg-gradient rounded-3 p-4 p-sm-5 mt-5">
                        <div class="d-flex align-items-center justify-content-between flex-column flex-xl-row text-center text-xl-start">
                            <div class="mb-4 mb-xl-0">
                                <div class="fs-3 fw-bold text-white">새로나온 책이 궁금하신가요?</div>
                                <div class="text-white-50">지금 회원가입하세요 최신작을 이메일을 통해 소개해드립니다.</div>
                            </div>
                            <div class="ms-xl-4">
                                <div class="input-group mb-2">
                                    <input class="form-control" type="text" placeholder="Email address..." aria-label="Email address..." aria-describedby="button-newsletter" />
                                    <button class="btn btn-outline-light" id="button-newsletter" type="button">Sign up</button>
                                </div>
                                <div class="small text-white-50">우리도서환은 개인정보보호법에 의거 개인정보 수집에대한 법률을 준수합니다.</div>
                            </div>
                        </div>
                    </aside>
                </div>
            </section>
        </main>
      <jsp:include page="layout/footer.jsp"></jsp:include>  
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js">
        
               
        </script>

<% if(request.getParameter("loginSuccess") != null) { %>
<script type="text/javascript">
    alert("로그인에 성공하였습니다!");
    
    if(window.location.search.indexOf('loginSuccess=true') > -1) {
        let urlParams = new URLSearchParams(window.location.search);
        urlParams.delete('loginSuccess');
        window.history.replaceState({}, '', `${window.location.pathname}?${urlParams}`);
    }

</script>
<% } %>

<% if(request.getParameter("logout") != null) { %>
<script type="text/javascript">
    alert("로그아웃하였습니다!");
    
    if(window.location.search.indexOf('logout=true') > -1) {
        let urlParams = new URLSearchParams(window.location.search);
        urlParams.delete('logout');
        window.history.replaceState({}, '', `${window.location.pathname}?${urlParams}`);
    }

</script>
<% } %>


</body>
</html>