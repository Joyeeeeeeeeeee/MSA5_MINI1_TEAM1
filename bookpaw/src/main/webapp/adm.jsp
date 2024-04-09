<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <jsp:include page="layout/link.jsp"></jsp:include>
 <jsp:include page="layout/script.jsp"></jsp:include>
<body>
 <jsp:include page="layout/header.jsp"></jsp:include>


 <div class="wrap">
   <div class="container">
    <div class="head">
        <h1 class="adm_title">관리자페이지</h1>
        <div id="tab-button-nav">
          <div class="tab-button" data-tab-section="tab-section-1">회원관리</div>
          <div class="tab-button" data-tab-section="tab-section-2">대출현황</div>
          <div class="tab-button" data-tab-section="tab-section-3">반납일정</div>
        </div>
      </div>
        <section id="tab-section-1" class="tab-section">
          <div class="adm_list">
            <table border="1" class="adm-table">
              <colgroup>
                  <col width="2%"/>
                  <col width="2%"/>
                  <col width="6%"/>
                  <col width="20%"/>
                  <col width="30%"/>
                  <col width="20%"/>
                  <col width="10%"/>
              </colgroup>
              <tr>
                <th scope="col"><input type="checkbox"></td>
                <th scope="col">no</td>
                <th scope="col">등급</td>  
                <th scope="col">대출책제목</td>
                <th scope="col">대출자</td>
                <th scope="col">대출일</td>
                <th scope="col">반납예정일</td>
              </tr>
              <tr>
                  <th scope="col"><input type="checkbox"></td>
                <td>1</td>
                <td>관리자</td>
                <td>총균쇠</td>
                <td>홍길동</td>
                <td>2024-04-02</td>
                <td>2024-04-09</td>
              </tr>
              <tr>
                <th scope="col"><input type="checkbox"></td>
                <td>2</td>
                <td>관리자</td>
                <td>마음</td>
                <td>홍길동</td>
                <td>2024-04-02</td>
                <td>2024-04-09</td>
              </tr>
              <tr>
                  <th scope="col"><input type="checkbox"></td>
                  <td>3</td>
                  <td>일반회원</td>
                  <td>오늘뭐먹지?</td>
                  <td>홍길동</td>
                  <td>2024-04-02</td>
                  <td>2024-04-09</td>
              </tr>
              <tr>
                <th scope="col"><input type="checkbox"></td>
                <td>4</td>
                <td>일반회원</td>
                <td>집에가는길</td>
                <td>홍길동</td>
                <td>2024-04-02</td>
                <td>2024-04-09</td>
              </tr>
              <tr>
                  <th scope="col"><input type="checkbox"></td>
                  <td>5</td>
                  <td>일반회원</td>
                  <td>학원오는길</td>
                  <td>홍길동</td>
                  <td>2024-04-02</td>
                  <td>2024-04-09</td>
              </tr>
            </table>
          </div>
        </section>
        <section id="tab-section-2" class="tab-section" hidden>
            <div class="adm_list">
              <table border="1" class="adm-table">
                <colgroup>
                    <col width="2%"/>
                    <col width="2%"/>
                    <col width="6%"/>
                    <col width="20%"/>
                    <col width="30%"/>
                    <col width="20%"/>
                    <col width="10%"/>
                </colgroup>
                <tr>
                  <th scope="col"><input type="checkbox"></td>
                  <th scope="col">no</td>
                  <th scope="col">등급</td>  
                  <th scope="col">대출책제목</td>
                  <th scope="col">대출자</td>
                  <th scope="col">대출일</td>
                  <th scope="col">반납예정일</td>
                </tr>
                <tr>
                    <th scope="col"><input type="checkbox"></td>
                  <td>1</td>
                  <td>관리자</td>
                  <td>sfasf</td>
                  <td>홍길동</td>
                  <td>2024-04-02</td>
                  <td>2024-04-09</td>
                </tr>
                <tr>
                  <th scope="col"><input type="checkbox"></td>
                  <td>2</td>
                  <td>관리자</td>
                  <td>마음</td>
                  <td>홍길동</td>
                  <td>2024-04-02</td>
                  <td>2024-04-09</td>
                </tr>
                <tr>
                    <th scope="col"><input type="checkbox"></td>
                    <td>3</td>
                    <td>일반회원</td>
                    <td>오늘뭐먹지?</td>
                    <td>홍길동</td>
                    <td>2024-04-02</td>
                    <td>2024-04-09</td>
                </tr>
                <tr>
                  <th scope="col"><input type="checkbox"></td>
                  <td>4</td>
                  <td>일반회원</td>
                  <td>집에가는길</td>
                  <td>홍길동</td>
                  <td>2024-04-02</td>
                  <td>2024-04-09</td>
                </tr>
                <tr>
                    <th scope="col"><input type="checkbox"></td>
                    <td>5</td>
                    <td>일반회원</td>
                    <td>학원오는길</td>
                    <td>홍길동</td>
                    <td>2024-04-02</td>
                    <td>2024-04-09</td>
                </tr>
              </table>
              </div>
        </section>
        <section id="tab-section-3" class="tab-section" hidden>
            <div class="adm_list">
                <table border="1" class="adm-table">
                    <colgroup>
                        <col width="2%"/>
                        <col width="8%"/>
                        <col width="20%"/>
                        <col width="30%"/>
                        <col width="20%"/>
                        <col width="10%"/>
                    </colgroup>
                    <tr>
                        <th scope="col"><input type="checkbox"></td>
                      <th scope="col">no</td>
                      <th scope="col">제목</td>
                      <th scope="col">내용</td>
                      <th scope="col">작성자</td>
                      <th scope="col">작성일</td>
                    </tr>
                    <tr>
                        <th scope="col"><input type="checkbox"></td>
                      <td>1</td>
                      <td>책을 빌렸습니다</td>
                      <td>재미있는책</td>
                      <td>김우직</td>
                      <td>2024-04-02</td>
                    </tr>
                    <tr>
                        <th scope="col"><input type="checkbox"></td>
                        <td>2</td>
                        <td>책을 빌렸습니다</td>
                        <td>재미있는책</td>
                        <td>김우직</td>
                        <td>2024-04-02</td>
                    </tr>
                    <tr>
                        <th scope="col"><input type="checkbox"></td>
                        <td>3</td>
                        <td>책을 빌렸습니다</td>
                        <td>재미있는책</td>
                        <td>김우직</td>
                        <td>2024-04-02</td>
                    </tr>
                    <tr>
                        <th scope="col"><input type="checkbox"></td>
                        <td>4</td>
                        <td>책을 빌렸습니다</td>
                        <td>재미있는책</td>
                        <td>김우직</td>
                        <td>2024-04-02</td>
                    </tr>
                    <tr>
                        <th scope="col"><input type="checkbox"></td>
                        <td>5</td>
                        <td>책을 빌렸습니다</td>
                        <td>재미있는책</td>
                        <td>김우직</td>
                        <td>2024-04-02</td>
                    </tr>
                  </table>
              </div>
        </section>
             
        <div class="btn">
            <input type="button" name="" value="삭제">
            <input type="button" name="" value="저장">
           <a href="adm_sub.jsp" class="btn"><input type="button" name="" value="수정" ></a>
           <a href="adm.jsp"class="btn"><input type="button" name="" value="목록" ></a><br>
           <br>
           <a href="book/list.jsp"class="btn"><input type="button" name="" value="도서 관리 페이지"></a>
        </div>
  </div>
  </div>
	<!-- 푸터 -->
    <jsp:include page="layout/footer.jsp"></jsp:include>

</body>
</html>