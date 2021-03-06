<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 메뉴 -->
<div class="ui attached stackable menu">
	<div class="ui container">

		<a class="item" href="main">
			<i class="home icon"></i> Home
		</a> 
		<a class="item" href="movieInfoList?category=0">
			<i class="grid video icon"></i> 영화정보
		</a> 
		<div class="ui simple dropdown item" onclick="location.href='free'">
			<i class="grid layout icon"></i> 게시판
			<div class="menu">
			<a class="item" href="free?board_category=1">
				공지사항
			</a>
			<a class="item" href="free?board_category=2">
				건의사항
			</a>
			<a class="item" href="free?board_category=3">
				질문과답변
			</a>
			<a class="item" href="free?board_category=4">
				자유게시판
			</a>
			</div>
		</div>

		<c:if test="${not empty userDTO}">
			<div class="ui simple dropdown item">
				더 보기 <i class="dropdown icon"></i>
				<div class="menu">
					<a class="item" href="myPage"><i class="edit icon"></i>정보 수정</a>
					<a class="item" href="profile"><i class="address card icon"></i>프로필</a> 
					<c:if test="${userDTO.mem_id eq 'admin'}">
						<a class="item" href="memInfo">
							<i class="setting icon"></i>회원 정보
						</a>
					</c:if>
				</div>
			</div>
		</c:if>
		
		<div class="ui item right">
			<form id="search" action="searchResult" method="post" name="search">
				<div class="ui action input">
					<input type="text" placeholder="Search" name="keyword" id="inputKeyword">
					<div class="ui icon button" onclick="document.search.submit();">
						<i class="search icon"></i>
					</div>
				</div>
			</form>
		</div>
		<c:if test="${empty userDTO}">
			<div class="ui item">
				<div class="ui">
					<a class="ui green basic button" href="signUp">회원 가입</a> <a
						class="ui orange basic button" id="loginBtn">로그인</a>
						<input type="hidden" id="member_num" value="0"/>
				</div>
			</div>
		</c:if>
		<c:if test="${not empty userDTO}">
			<div class="ui item">
				<div class="ui">
					<a>${userDTO.mem_name}님 환영합니다.</a> &nbsp;&nbsp;&nbsp;
					<button class="ui orange basic button" onclick="ktout()">로그아웃</button>
					<input type="hidden" id="member_num" value="${userDTO.mem_num}"/>
				</div>
			</div>
		</c:if>
	</div>
</div>
<div class="ui mini modal login_modal">
	<div class="header">로그인 화면</div>
	<form class="ui form segment" id="loginForm" action="login"
		method="post">
		<div class="input field">
			<label>아이디</label> <input placeholder="아이디 입력" name="mem_id" type="text" id="loginId"/>
		</div>
		
		<div class="input field">
			<label>비밀번호</label> <input placeholder="비밀번호 입력" name="mem_pw"
				type="password" id="loginPassword">
		</div>
		<div class="ui field middle center aligned grid">
			<div class="ui positive tiny button submit">로그인</div>
			<div class="ui black deny tiny button" id="closeBtn">
				<i class="close icon"></i> 닫기
			</div>
		</div>
		<div class="ui error message"></div>
	</form>
	<br />
	<div class="ui center aligned middle grid">
		<a class="ui images" onclick="ktlogin()"> <img alt="카카오톡으로 로그인"
			src="resources/images/loginBtn.png" id="kakaoLoginImage">
		</a>
	</div>
	<br />

	<div class="ui center aligned grid message">
		처음 인가요? <a href="signUp">회원 가입</a>하세요!
		<div class="ui horizontal divider"></div>
		<a class="ui tiny inverted blue button" href="findId"><i
			class="help circle icon"></i>아이디 찾기</a> &nbsp;&nbsp;&nbsp;&nbsp; <a
			class="ui tiny inverted blue button" href="findPw"><i
			class="help circle icon"></i>비밀번호 찾기</a>
	</div>
</div>

<div class="ui tiny modal loginStatus">
	<i class="close icon"></i>
	<div class="ui header">아이디 중복확인</div>
	<div class="actions">
		<div class="ui tiny green button">닫기</div>
	</div>
</div>

<script type="text/javascript">
	var loginStatus = "${loginStatus}";
	var findIdStatus = "${findIdStatus}";
	var findPwStatus = "${findPwStatus}";
	var updateInfoStatus = "${updateInfoStatus}";
	var memUpdateStatus = "${memUpdateStatus}";
	var session_id = '${userDTO.mem_id}';
	var session_num = '${userDTO.mem_num}';
	var profile = '${userDTO.upload}';
</script>
