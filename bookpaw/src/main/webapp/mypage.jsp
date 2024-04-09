<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="DTO.Lent"%>
<%@page import="java.util.List"%>
<%@page import="Service.LentServiceImpl"%>
<%@page import="Service.LentService"%>
<%@page import="DTO.Search"%>
<%@page import="Service.UserServiceImpl"%>
<%@page import="Service.UserService"%>
<%@page import="DTO.Users"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이페이지</title>
	<meta http-equiv="X-UA-Comptible" content="IE-edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
<jsp:include page="layout/link.jsp"></jsp:include>
<jsp:include page="layout/script.jsp"></jsp:include>

	<%
	//세션
	String memberId = (String) session.getAttribute("member");

	if (memberId == null) {
		out.print("<script>alert('로그인하구와!')</script>");
		response.sendRedirect("./index.jsp?error=2");
		return;
	}
	

	UserService userService = new UserServiceImpl();
	Users Member = userService.member(memberId);

	int level = Member.getUser_level();
	%>
	
	
<div class="wrap">
 <div class="container">
	<div class="head">
		<h1 class="adm_title"><%=(level == 10 ? "관리자페이지" : "마이페이지")%></h1>
		<div id="tab-button-nav">
			<div class="tab-button" data-tab-section="tab-section-1">대출현황</div>
			<div class="tab-button" data-tab-section="tab-section-2">대출이력</div>
			<%
			if (level == 1) {
			%>
			<div class="tab-button" data-tab-section="tab-section-3">예약현황</div>
			<!-- <div class="tab-button" data-tab-section="tab-section-4">나의정보</div> -->
			<%
			} else {
			%>
			<div class="tab-button" data-tab-section="tab-section-5">회원관리</div>
			<%
			}
			%>
		</div>
	</div>

	<section id="tab-section-1" class="tab-section">
		<div class="adm_list">
			<table border="1" class="adm-table">
				<colgroup>
					<col width="2%" />
					<col width="2%" />
					<col width="10%" />
					<col width="56%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<tr>
					<th scope="col"><input type="checkbox">
					</td>
					<th scope="col">no
					</td>
					<th scope="col">대출상태
					</td>
					<th scope="col">책제목
					</td>
					<th scope="col">대출일자
					</td>
					<th scope="col">반납예정일
					</td>
				</tr>

				<%
				Search search = new Search();
				search.setUser_level(level);
				search.setUser_num(Member.getUser_num());
				search.setStatus("대여중");

				LentService lentService = new LentServiceImpl();
				List<Lent> lentList = lentService.lent_search(search);

				int count = 0;
				for (Lent list : lentList) {
					count++;
				%>
				<tr>
					<th scope="col"><input type="checkbox"
						value="<%=list.getLent_num()%>" data-type="lent"
						data-isbn="<%=list.getIsbn()%>">
					</td>
					<td><%=count%></td>
					<td><%=list.getStatus()%></td>
					<td><%=list.getBname()%></td>
					<td><%=list.getLate_date()%></td>
					<td><%=list.getLent_date()%></td>
				</tr>

				<%
				}
				%>


			</table>
		</div>
	</section>
	<section id="tab-section-2" class="tab-section" hidden>
		<div class="adm_list">
			<table border="1" class="adm-table">
				<colgroup>
					<col width="2%" />
					<col width="2%" />
					<col width="10%" />
					<col width="56%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<tr>
					<th scope="col"><input type="checkbox">
					</td>
					<th scope="col">no
					</td>
					<th scope="col">대출상태
					</td>
					<th scope="col">책제목
					</td>
					<th scope="col">대출일자
					</td>
					<th scope="col">반납예정일
					</td>
				</tr>
				<%
				search.setStatus("반납완료");
				List<Lent> lentList2 = lentService.lent_search(search);

				count = 0;
				for (Lent list : lentList2) {
					count++;
				%>
				<tr>
					<th scope="col"><input type="checkbox"
						value="<%=list.getLent_num()%>" data-type="lent"
						data-isbn="<%=list.getIsbn()%>">
					</td>
					<td><%=count%></td>
					<td><%=list.getStatus()%></td>
					<td><%=list.getBname()%></td>
					<td><%=list.getLate_date()%></td>
					<td><%=list.getLent_date()%></td>
				</tr>

				<%
				}
				%>
			</table>
		</div>
	</section>
	<section id="tab-section-3" class="tab-section" hidden>
		<div class="adm_list">
			<table border="1" class="adm-table">
				<colgroup>
					<col width="2%" />
					<col width="2%" />
					<col width="10%" />
					<col width="56%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<tr>
					<th scope="col"><input type="checkbox">
					</td>
					<th scope="col">no
					</td>
					<th scope="col">대출상태
					</td>
					<th scope="col">책제목
					</td>
					<th scope="col">대출일자
					</td>
					<th scope="col">반납예정일
					</td>
				</tr>
				<%
				search.setStatus("예약완료");
				List<Lent> lentList3 = lentService.lent_search(search);

				count = 0;
				for (Lent list : lentList3) {
					count++;
				%>
				<tr>
					<th scope="col"><input type="checkbox"
						value="<%=list.getLent_num()%>" data-type="lent"
						data-isbn="<%=list.getIsbn()%>">
					</td>
					<td><%=count%></td>
					<td><%=list.getStatus()%></td>
					<td><%=list.getBname()%></td>
					<td><%=list.getLate_date()%></td>
					<td><%=list.getLent_date()%></td>
				</tr>

				<%
				}
				%>
			</table>
		</div>
	</section>
	<section id="tab-section-4" class="tab-section" hidden>
		<div class="adm_list">
			<table border="1" class="adm-table">
				<colgroup>
					<col width="2%" />
					<col width="2%" />
					<col width="6%" />
					<col width="8%" />
					<col width="8%" />
					<col width="10%" />
					<col width="55%" />
					<col width="20%" />
				</colgroup>
				<tr>
					<th scope="col"><input type="checkbox">
					</td>
					<th scope="col">no
					</td>
					<th scope="col">등급
					</td>
					<th scope="col">성명
					</td>
					<th scope="col">생년월일
					</td>
					<th scope="col">전화번호
					</td>
					<th scope="col">주소
					</td>
					<th scope="col">가입일
					</td>
				</tr>
				<tr>
					<th scope="col"><input type="checkbox">
					</td>
					<td>1</td>
					<td>일반회원</td>
					<td>홍길동</td>
					<td>200222</td>
					<td>010-2315-1232</td>
					<td>인천광역시 남구 숭의1동 123-5</td>
					<td>2024-04-09</td>
				</tr>
				<tr>
			</table>
		</div>
	</section>
	
	<section id="tab-section-5" class="tab-section" hidden>
		<div class="adm_list">
			<table border="1" class="adm-table">
				<colgroup>
					<col width="2%" />
					<col width="2%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
					<col width="21%" />
					<col width="20%" />
					<col width="10%" />
				</colgroup>
				<tr>
					<th scope="col"><input type="checkbox">
					</td>
					<th scope="col">no
					</td>
					<th scope="col">아이디
					</td>
					<th scope="col">이름
					</td>
					<th scope="col">생일
					</td>
					<th scope="col">주소
					</td>
					<th scope="col">연락처
					</td>
					<th scope="col">회원등급
					</td>
				</tr>
				<%
				
				List<Users> userList = userService.list();

				count = 0;
				for (Users list : userList) {
					count++;
				%>
				<tr>
					<th scope="col"><input type="checkbox"
						value="<%=list.getUser_num()%>" data-type="user">
					</td>
					<td><%=count%></td>
					<td><%=list.getId()%></td>
					<td><%=list.getName()%></td>
					<td><%=list.getBirth()%></td>
					<td><%=list.getAddress()%></td>
					<td><%=list.getPhone()%></td>
					<td><%=list.getUser_level()%></td>
				</tr>

				<%
				}
				%>
			</table>
		</div>
	</section>
	
	
	<div class="btn">
		<input type="button" id="delete_btn" value="삭제"> <input
			type="button" name="" value="수정" id="update_btn"> <input
			type="button" name="" value="저장" id="save_btn">
	</div>
	</div>
	</div>
	<script>
	// 수정 버튼 클릭 이벤트
	$(function(){
		
		
		
		
		$(document).on('click', '#update_btn', function(){
			var count = $('input[data-type="lent"]:checked').length;
			if(count>=2){
				alert("하나만 선택해주세요!");
				return;
			}else if(count==1){
		        var $row = $('input[data-type="lent"]:checked').closest('tr');
		        $row.find('td:eq(1)').html('<input type="text" value="' + $row.find('td:eq(1)').text() + '" />');
		        $row.find('td:eq(2)').html('<input type="text" value="' + $row.find('td:eq(2)').text() + '" />');
		        $row.find('td:eq(3)').html('<input type="text" value="' + $row.find('td:eq(3)').text() + '" />');
		        $row.find('td:eq(4)').html('<input type="text" value="' + $row.find('td:eq(4)').text() + '" />');
			}
		});


	});
	
	// 저장 버튼 클릭 이벤트
	$(document).on('click', '#save_btn', function(){
		var count = $('input[data-type="lent"]:checked').length;
		if(count>=2){
			alert("하나만 선택해주세요!");
			return;
		}else if(count==1){
	        var $row = $('input[data-type="lent"]:checked').closest('tr');
	        var num = $('input[data-type="lent"]:checked').val();
	        var isbn = $('input[data-type="lent"]:checked').attr('data-isbn');
	        var status = $row.find('td:eq(1) input').val();
	        var book = $row.find('td:eq(2) input').val();
		    var lateDate = $row.find('td:eq(3) input').val();
		    var lentDate = $row.find('td:eq(4) input').val();
		    
		    
		    $.ajax({
		        type: 'POST',
		        url: './lib/ajax.jsp', // 수정을 처리하는 서버 측 URL에 맞게 변경
		        data: { mode: "lent_update", isbn : isbn , num: num, status: status, book: book, lateDate: lateDate, lentDate: lentDate },
		        success: function(response) {
		            var $row = $('input[data-type="lent"]:checked').closest('tr');
		            $row.find('td:eq(1)').html(status);
		            $row.find('td:eq(2)').html(book);
		            $row.find('td:eq(3)').html(lateDate);
		            $row.find('td:eq(4)').html(lentDate);
		            console.log('결과가 성공적으로 반영되었습니다.');
		        },
		        error: function(xhr, status, error) {
		            console.error('결과 반영 중 오류가 발생했습니다.');
		        }
		    });		    
		}	    
	});
		
	
	$(document).on('click', '#delete_btn', function(){
		var count = $('input[data-type="lent"]:checked').length;
		if(count>=2){
			alert("하나만 선택해주세요!");
			return;
		}else if(count==1){
	        var num = $('input[data-type="lent"]:checked').val();
		    
		    $.ajax({
		        type: 'POST',
		        url: './lib/ajax.jsp', // 수정을 처리하는 서버 측 URL에 맞게 변경
		        data: { mode: "lent_delete", num: num },
		        success: function(response) {
		            var $row = $('input[data-type="lent"]:checked').closest('tr');
		            $row.remove();
		            console.log('결과가 성공적으로 반영되었습니다.');
		        },
		        error: function(xhr, status, error) {
		            console.error('결과 반영 중 오류가 발생했습니다.');
		        }
		    });		    
		}	    
	});
	
		
	
	
        const $nav = document.querySelector('#tab-button-nav')
        const $sections = document.querySelectorAll('.tab-section');
    
        $nav.addEventListener('click', (e) => {
          if (!e.target.classList.contains('tab-button')) {
            return;
          }
          
          const focusedTabId = e.target.dataset.tabSection;
    
          $sections.forEach(($section) => {
            if ($section.id === focusedTabId) {
              $section.removeAttribute('hidden');
            } else {
              $section.setAttribute('hidden', true);
            }
          });
        });
      </script>
      
	
	<script src="script/product.js"></script>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
    
	
	<!-- 푸터 -->
	<jsp:include page="layout/footer.jsp"></jsp:include>

</body>
</html>