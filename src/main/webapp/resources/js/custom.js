/*jslint browser: true*/
/*global $, document*/

$(document).ready(function() {
	"use strict";

	// 영화 상세보기
	$('.main_movie').on('click', function() {
		var movie_num=$('.movie_num').val();
		var index = $(this).find('input[type="hidden"]').val();
		var modal = '#modal'+index;
		/*
		$.ajax({
			url: 'info?movie_num='+movie_num,
			type:'GET',
			dataType:'json',
			success : function(data){
				//alert(JSON.stringify(data.info[0].movie_kor_title));
				$('.time_sub').remove();
				var comment = "";
					for(var i=0; i<data.comment.length; i++){
					comment +=
						'<li class=time_sub id="'+data.comment[i].comment_num+'">'+
						'<p>'+data.comment[i].mem_id+'</p>'+
						'<p>'+data.comment[i].replytext+'</p>'+
						'<p>'+data.comment[i].regdate+'</p>'+
						'<p> <button>delete</button> <button>update</button>'+
						'</p>'+
						'</li>'
					}
				$(comment).appendTo("#bb");
			}
		})
		*/
		
		$(modal).modal('show');
		
	})
	
	//아이디 중복체크
	$('#checkId').on('click',function(e){

		if($('#id').val() == '') {
			$('.idFail .ui.header').text("아이디를 입력해주세요.");
			$('.ui.tiny.modal.idFail').modal('show');
			e.preventDefault();
		} else {
			$.ajax({
				type:'POST',
				dataType:'text',
				url:'chkId',
				data:'mem_id='+$('#id').val(),
				success:function(rs){
					if(rs == 1){
						$('.idFail .ui.header').text("아이디가 이미 존재합니다.");
						$('.ui.tiny.modal.idFail').modal('show');
						$('#id_ck').val(1);
					}else{
						$('.idFail .ui.header').text("사용할 수 있는 아이디입니다.");
						$('.ui.tiny.modal.idFail').modal('show');
						$('#id_ck').val(2);
					}
				},
				error:function(request,status,error){
		            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		           }
			});
		}
	});
	
	// 중복확인창 닫기
	$('.idFail .actions .ui.button').on('click', function(e) {
		$('.ui.tiny.modal.idFail').modal('hide');
	});
	
	// 별점
	$('.ui.rating')
	  .rating();

	// 카카오톡 로그인
	$('#kakaoLoginImage').on('mouseenter', function() {
		$(this).prop('src', 'resources/images/loginBtnHover.png');
		$(this).css('cursor', 'pointer');
	})

	$('#kakaoLoginImage').on('mouseleave', function() {
		$(this).prop('src', 'resources/images/loginBtn.png');
		$(this).css('cursor', 'default');
	})

	// 로그인 창 띄우기
	$('#loginBtn').on('click', function() {
		$('.ui.modal.login_modal').modal('show');
	});

	// 로그인 창 닫기
	$('#closeBtn').on('click', function() {
		$('.ui.modal.login_modal').modal('hide');
	});

	// 메인 페이지 카드
	$('.special.cards .image.main_movie').dimmer({
		on : 'hover'
	});

	// 메뉴 드랍 다운
	$('.ui.dropdown').dropdown();

	// 로그인 유효성 검사
	$('.ui.form#loginForm').form({
		on : 'blur',
		fields : {
			id : {
				identifier : 'id',
				rules : [ {
					type : 'empty',
					prompt : '아이디를 입력해주세요.'
				} ]
			},
			password : {
				identifier : 'password',
				rules : [ {
					type : 'empty',
					prompt : '비밀번호를 입력하세요.'
				}, {
					type : 'minLength[6]',
					prompt : '비밀번호 : 최소 {ruleValue} 글자 이상 입력 하세요.'
				} ]
			}
		}
	});

	// 회원가입 유효성 검사
	$('.ui.form#signUpForm').form({
		on : 'blur',
		fields : {
			id : {
				identifier : 'id',
				rules : [ {
					type : 'empty',
					prompt : '아이디를 입력해주세요.'
				} ]
			},
			id_ck : {
				identifier : 'id_ck',
				rules : [ {
					type : 'not[0]',
					prompt : '중복 체크를 하지 않으셨습니다. 중복체크 해주세요.'
				} , {
					type : 'not[1]',
					prompt : '중복된 아이디입니다.'
				} ]
			},
			password : {
				identifier : 'password',
				rules : [ {
					type : 'empty',
					prompt : '비밀번호를 입력하세요.'
				}, {
					type : 'minLength[6]',
					prompt : '비밀번호 : 최소 {ruleValue} 글자 이상 입력 하세요.'
				} ]
			},
			passwordConfirm : {
				identifier : 'passwordConfirm',
				rules : [ {
					type : 'empty',
					prompt : '비밀번호 확인란에도 입력하세요.'
				}, {
					type : 'minLength[6]',
					prompt : '비밀번호 확인 : 최소 {ruleValue} 글자 이상 입력 하세요.'
				}, {
					type : 'match[password]',
					prompt : '{ruleValue} 와 동일해야합니다. '
				} ]
			},
			name : {
				identifier : 'name',
				rules : [ {
					type : 'empty',
					prompt : '이름을 입력해주세요.'
				} ]
			},
			gender : {
				identifier : 'gender',
				rules : [ {
					type : 'empty',
					prompt : '성별을 선택해 주세요.'
				} ]
			},
			email : {
				identifier : 'email',
				rules : [ {
					type : 'email',
					prompt : '이메일 형식으로 입력해주세요.'
				} ]
			},
			terms : {
				identifier : 'terms',
				rules : [ {
					type : 'checked',
					prompt : '회원가입 약관에 동의해야 합니다.'
				} ]
			}
		}
	});
});

// <![CDATA[
// 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('331f6e91bdb4a956167313811ffb0d23');

// 카카오 로그인 버튼을 생성합니다.
function ktlogin() {
	Kakao.Auth.login({
		success : function(authObj) {
			Kakao.API.request({
				url : '/v1/user/me',
				success : function(res) {
					alert(res.properties.nickname + '님 로그인 되었습니다.');
					// location.href="login.do?name="+res.properties.nickname;
					location.href = "loginsuccess?kid=" + res.kaccount_email
					persistAccessToken: false;
				},
			})
			// persistAccessToken: false,
		},
		fail : function(err) {
			alert(JSON.stringify(err));
		}
	});
};

// 카카오톡 로그아웃
function ktout() {
	Kakao.Auth.logout(function() {
		setTimeout(function() {
			location.href = "logout";
			persistAccessToken: false;
			alert('로그아웃 되엇습니다');
		}, 1000); // 로그아웃 처리되는 타임을 임시적으로 1000설정
	});
};
// ]]>

