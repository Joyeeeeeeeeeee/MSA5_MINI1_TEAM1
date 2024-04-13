<%@page import="java.net.URLDecoder"%>
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
<title>Paw Book</title>
<link rel="stylesheet" href="css/style.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
</head>


<%
//아이디 저장
String rememberId = "";
String userId = "";
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (int i = 0; i < cookies.length; i++) {
		Cookie cookie = cookies[i];
		String cookieName = cookie.getName();
		String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
		switch (cookieName) {
	case "userId" :
		userId = cookieValue;
		break;
	case "rememberId" :
		rememberId = cookieValue;
		break;
		}
	}
}

String error = request.getParameter("error");

//세션
String memberId = (String) session.getAttribute("member");
%>



<script>
function logout() {
	window.location.href = 'lib/logout.jsp';
}
</script>

<body>
	<header>
		<h2 class="logo">Logo</h2>
		<nav class="navigation">
			<a href="main.jsp">Home</a>
		</nav>
	</header>

	<div class="wrapper active-popup">
		<span class="icon-close"> <ion-icon name="close"></ion-icon>
		</span>
		<div class="form-box login">
			<h2>Login</h2>
			<form action="./lib/login.jsp">
				<div class="input-box">
					<span class="icon"> <ion-icon name="mail"></ion-icon>
					</span> <input type="text" name="id" value="<%=userId%>" required>
					<label>아이디</label>
				</div>
				<div class="input-box">
					<span class="icon"> <ion-icon name="lock-closed"></ion-icon>
					</span> <input type="password" name="pw" required> <label>비밀번호</label>
				</div>
				<div class="remember-forgot">
					<label for=""><input type="checkbox" name="rememberId"
						<%=(rememberId.equals("on") ? "checked" : "")%>> 아이디저장</label> <a
						href="#">비밀번호 찾기</a>
				</div>
				<button type="submit" class="btn" style="    width: 100%;
    height: 45px;
    background: #fff;
    border: none;
    outline: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 1em;
    color: #162938;
    font-weight: 500;">로그인</button>
				<div class="login-register">
					<p>
						Don't have a account? <a href="#" class="register-link">회원가입</a>
					</p>
				</div>
			</form>
		</div>

		<div class="form-box register">
			<h2>회원가입</h2>
			<form action="./lib/join.jsp">
				<div class="input-box">
					<span class="icon"> <ion-icon name="mail"></ion-icon>
					</span> <input type="text" name="id" required> <label>아이디</label>
				</div>
				<div class="input-box">
					<span class="icon"> <ion-icon name="lock-closed"></ion-icon>
					</span> <input type="password" name="pw" required> <label>비밀번호</label>
				</div>
				<div class="input-box">
					<span class="icon"> <ion-icon name="person"></ion-icon>
					</span> <input type="text" name="name" required> <label>이름</label>
				</div>
				            <div class="input-box">
               <span class="icon"> <ion-icon name="calendar-outline"></ion-icon>
               </span> <input type="date" id="birth" max="2023-12-31" name="birth" required data-placeholder="생일"> 
<!--                <label>생일</label> -->
            </div>
				<div class="input-box">
					<span class="icon"> <ion-icon name="person"></ion-icon>
					</span> <input type="text" name="address" required> <label>주소</label>
				</div>
				<div class="input-box">
					<span class="icon"> <ion-icon name="person"></ion-icon>
					</span> <input type="text" name="phone" required> <label>연락처</label>
				</div>
				<div class="remember-forgot">
					<label for=""><input type="checkbox" required>동의하세요!!</label>
				</div>
				<button type="submit" class="btn">가입하기</button>
				<div class="login-register">
					<p>
						Already have a account? <a href="#" class="login-link">Login</a>
					</p>
				</div>
			</form>
		</div>
	</div>

	<script src="script/jquery-3.7.1.js"></script>
	
	<!-- 회원 가입 유효성 검사 -->
   <script>
   function checkJoin() {
      let form = document.joinForm;   // 이름이 joinform인 폼에서 호출
       let id = form.id.value.trim();

       // 1. 아이디는 필수값, 4~12자 이내, 영어와 숫자로만 구성
       if (id === "") {
           alert('아이디를 입력해주세요.');
           form.id.focus();
           return false;
       }

       if (id.length < 4 || id.length > 12) {
           alert('아이디는 4~12자 이내로 입력 가능합니다.');
           form.id.select();
           return false;
       }

       const idPattern = /^[a-zA-Z0-9]+$/;
       if (!idPattern.test(id)) {
           alert('아이디는 영어와 숫자로만 입력 가능합니다.');
           form.id.select();
           return false;
       }

       // 2. 비밀번호는 필수값, 6자 이상
       let pw = form.pw.value.trim();
       if (pw === "") {
           alert('비밀번호를 입력해주세요.');
           form.pw.focus();
           return false;
       }

       if (pw.length < 6) {
           alert('비밀번호는 6자 이상 입력해야 합니다.');
           form.pw.select();
           return false;
       }
      
      // 3. 이름은 첫글자는 숫자로 사용 불가
      let name = form.name.value
      
      // 이름 입력 여부
      if(name == "") {
         alert('이름을 입력해주세요.')
         form.name.focus()
         return false
      }
      
      if(!isNaN(name.substr(0, 1))) {
         alert('이름은 숫자로 시작할 수 없습니다')
         form.name.select()      
         return false
      }
      
      // 4. 전화번호는 숫자 10자리 또는 11자리만 가능
      let phone = form.phone.value.trim();
       const phonePattern = /^(01[016789])\d{7,8}$/;
       if (!phonePattern.test(콜)) {
           alert('연락처는 숫자 10~11자리만 입력할 수 있습니다.');
           form.phone.select();
           return false;
       }
      
        // 모든 유효성 검사 통과 시 회원가입 진행
        return true;
   }
   
   </script>
	<script src="script/scripts.js"></script>
	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>