<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/product.css">
<link rel="stylesheet" href="css/bootstrap/css/bootstrap.css">
<script src="script/product.js"></script>
<title>도서 대출서비스</title>
</head>

<body>
	<div class="warp">
		<div class="section">
			<div class="container bord">
				<div class="two_third first" style="height: 800px">
					<div class="col-lg-6">
						<h2 class="bordtxt">대출 신청 목록</h2>
						<hr />
						<br>
						<br>
						<!-- board list area -->
						<div id="board-list">
							<div class="container bord">
								<table class="table_01" id="user-table">
									<thead>
									<colgroup>
										<col width="5%">
										<col width="5%">
										<col width="35%">
										<col width="15%">
										<col width="15%">
										<col width="17%">
									</colgroup>
									<tr class="board_info">
										<td scope="col"><input type="checkbox"></td>
										<th class="text-center">번호</th>
										<th class="text-center">제목</th>
										<th class="text-center">작가</th>
										<th class="text-center">신청자</th>
										<th class="text-center">예약일</th>
									</tr>
									</thead>
									<tbody>
										<tr class="board_info">
											<td scope="col"><input type="checkbox"></td>
											<td class="text-center">1</td>
											<td class="text-center">안녕하세요</td>
											<td class="text-center">홍길동</td>
											<td class="text-center">김가람</td>
											<td class="text-center">2024-04-05</td>
										</tr>
										<tr class="board_info">
											<td scope="col"><input type="checkbox"></td>
											<td class="text-center">2</td>
											<td class="text-center">나의 유럽여행기</td>
											<td class="text-center">홍길동</td>
											<td class="text-center">김가람</td>
											<td class="text-center">2024-04-05</td>
										</tr>
										<tr class="board_info">
											<td scope="col"><input type="checkbox"></td>
											<td class="text-center">3</td>
											<td class="text-center">일본에서 주말</td>
											<td class="text-center">간다요</td>
											<td class="text-center">김가람</td>
											<td class="text-center">2024-04-05</td>
										</tr>
										<tr class="board_info">
											<td scope="col"><input type="checkbox"></td>
											<td class="text-center">4</td>
											<td class="text-center">오늘도 맛나다</td>
											<td class="text-center">하람교</td>
											<td class="text-center">김가람</td>
											<td class="text-center">2024-04-05</td>
										</tr>
										<tr class="board_info">
											<td scope="col"><input type="checkbox"></td>
											<td class="text-center">5</td>
											<td class="text-center">사랑하는 오늘</td>
											<td class="text-center">하후이</td>
											<td class="text-center">김가람</td>
											<td class="text-center">2024-04-05</td>
										</tr>
										<tr class="board_info">
											<td scope="col"><input type="checkbox"></td>
											<td class="text-center">6</td>
											<td class="text-center">즐거운 안녕</td>
											<td class="text-center">잘가라</td>
											<td class="text-center">김가람</td>
											<td class="text-center">2024-04-05</td>
										</tr>
										<tr class="board_info">
											<td scope="col"><input type="checkbox"></td>
											<td class="text-center">7</td>
											<td class="text-center">여름에는 어디가?</td>
											<td class="text-center">여행자</td>
											<td class="text-center">김가람</td>
											<td class="text-center">2024-04-05</td>
										</tr>
										<tr class="board_info">
											<td scope="col"><input type="checkbox"></td>
											<td class="text-center">8</td>
											<td class="text-center">더운데 좋다</td>
											<td class="text-center">여름길</td>
											<td class="text-center">김가람</td>
											<td class="text-center">2024-04-05</td>
										</tr>
										<tr class="board_info">
											<td scope="col"><input type="checkbox"></td>
											<td class="text-center">9</td>
											<td class="text-center">놀러가자</td>
											<td class="text-center">어디로</td>
											<td class="text-center">김가람</td>
											<td class="text-center">2024-04-05</td>
										</tr>
									</tbody>
								</table>
								<table class="button_area">
									<tr>
										<td class="text-right inline"><a href=""
											class="btn btn-sm btn-success">저장</a> <a href=""
											class="btn btn-sm btn-success">삭제</a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>