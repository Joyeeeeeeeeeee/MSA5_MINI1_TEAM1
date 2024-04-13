<%@page import="announce.DTO.Board"%>
<%@page import="java.util.List"%>
<%@page import="announce.Service.BoardServiceImpl"%>
<%@page import="announce.Service.BoardService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
</head>

<html lang="en">
<head>
    <meta charset="UTF-8">
   <jsp:include page="/layout/meta.jsp"></jsp:include>
 	<jsp:include page="/layout/link.jsp"></jsp:include>
</head>
 	
<body>
      	<jsp:include page="/layout/header.jsp"></jsp:include>
            <!-- Page Content-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-3">
                            <div class="d-flex align-items-center mt-lg-5 mb-4">
                                <img class="img-fluid rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
                                <div class="ms-3">
                                    <div class="fw-bold">하늘색이좋음</div>
                                    <div class="text-muted">독서광</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <!-- Post content-->
                            <article>
                                <!-- Post header-->
                                <header class="mb-4">
                                    <!-- Post title-->
                                    <h1 class="fw-bolder mb-1">나의 독서다이어리</h1>
                                    <!-- Post meta content-->
                                    <div class="text-muted fst-italic mb-2">January 1, 2024</div>
                                    <!-- Post categories-->
                                    <a class="badge bg-secondary text-decoration-none link-light" href="#!">다독</a>
                                    <a class="badge bg-secondary text-decoration-none link-light" href="#!">인기글</a>
                                </header>
                                <!-- Preview image figure-->
                                <figure class="mb-4"><img class="img-fluid rounded" src="img/book003.jpg" alt="..." /></figure>
                                <!-- Post content-->
                                <section class="mb-5">
                                    <p class="fs-5 mb-4">피가 섞이지 않은 부모 사이를 릴레이 경주하듯 이어가며 네 번이나 이름이 바뀐 한 소녀의 성장 이야기 『그리고 바통은 넘겨졌다』. 1인 가족, 한 부모 가족, 다문화 가족, 재혼 가족 등 다양한 가족 형태를 마주하는 오늘날 가족이란 무엇인지, 부모의 역할은 무엇인지 생각해 보게 하는 작품이다.</p>
                                    <p class="fs-5 mb-4">이야기의 초점은 소녀의 관점에서 본 여러 보호자들의 부모 역할에 맞추어져 있다. 어른들의 갈등, 의도, 배려들은 소설의 뒤편에 감추어져 있거나 나중에 드러난다. 환경이 바뀔 때마다 주인공이 경험하는 새로운 부모 역할과, 그것에 맞추어 세심하게 딸 역할을 해내는 소녀의 노력이 그려진다.</p>
                                    <p class="fs-5 mb-4">주인공은 17세 소녀, 고등학교 3학년 유코이다. 친엄마는 유코가 세 살이 되기 전에 교통사고로 사망한다. 아버지와 조부모의 보살핌을 받다가 새엄마를 만난 것은 초등학교 2학년 때이다. 4학년 때 아빠와 새엄마가 이혼하면서 아빠는 브라질로 떠나고 유코는 새엄마와 살게 된다. 새엄마는 이후 두 번의 결혼을 더 하여 주인공에게 세 명의 아빠가 생기게 되었다. 이 사이에 가족의 형태는 일곱 번이 바뀌게 된다.</p>
                                    <h2 class="fw-bolder mb-4 mt-5">부모 역할에 대해 생각해 보게 하는 소설 </h2>
                                    <p class="fs-5 mb-4">2019년 서점대상 수상!지금 내 곁에 있는 사람이 더욱 소중해지는 가족 소설</p>
                                    <p class="fs-5 mb-4">《그리고 바통은 넘겨졌다》는 피가 섞이지 않은 부모 사이를 릴레이 경주하듯 이어가며 네 번이나 이름이 바뀐 한 소녀의 성장 이야기를 담고 있다. 하지만 이야기의 초점은 소녀의 관점에서 본 여러 보호자들의 부모 역할에 맞추어져 있다. 어른들의 갈등, 의도, 배려 들은 소설의 뒤편에 감추어져 있거나 나중에 드러난다. 환경이 바뀔 때마다 주인공이 경험하는 새로운 부모 역할과, 그것에 맞추어 세심하게 딸 역할을 해내는 소녀의 노력이 그려진다.</p>
                                </section>
                            </article>
                            <!-- Comments section-->
                            <section>
                                <div class="card bg-light">
                                    <div class="card-body">
                                        <!-- Comment form-->
                                        <form class="mb-4"><textarea class="form-control" rows="3" placeholder="댓글달아주세용"></textarea></form>
                                        <!-- Comment with nested comments-->
                                        <div class="d-flex mb-4">
                                            <!-- Parent comment-->
                                            <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                            <div class="ms-3">
                                                <div class="fw-bold">말랑카우</div>
                                                 좋은어른을 연속으로 만난 주인공이 기적같다
                                                <!-- Child comment 1-->
                                                <div class="d-flex mt-4">
                                                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                                    <div class="ms-3">
                                                        <div class="fw-bold">너구리우동사발</div>
                                                         나였으면 두번째 아빠집에서 나오지 않았어 영원히 살래~
                                                    </div>
                                                </div>
                                                <!-- Child comment 2-->
                                                <div class="d-flex mt-4">
                                                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                                    <div class="ms-3">
                                                        <div class="fw-bold">바람 별 양꼬치</div>
                                                       기구한 인생같아 우리엄마한테 고맙다고 해야지
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Single comment-->
                                        <div class="d-flex">
                                            <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                            <div class="ms-3">
                                                <div class="fw-bold">카우보이비빔밥</div>
                                                이야기가 너무 좋은 사람들만 등장해서 현실감이 좀 떨어지네 하지만 주인공의 좋은 인성은 인정
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <!-- Footer-->
        
      <jsp:include page="layout/footer.jsp"></jsp:include>  
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
