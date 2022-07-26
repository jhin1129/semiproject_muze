<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp"/>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>


<!-- Login CSS -->
<link rel="stylesheet" href="${path}/resources/css/login/Login.css">

<!-- 내용 전체 컨테이너 -->
<div class="container">
 	<div class="row">
		<div class="col"></div>
			<div class="col-6 ">
				<div class="member_wrap">
              		<div class="member_tit">
                		<h2>로그인</h2>
              		</div>
              		<!-- //member_tit -->
	<div class="member_cont">
		<form id="formLogin" action="${ path }/member/login" method="post" >
 			<input type="hidden" id="mode" name="mode" value="login">
            <input type="hidden" id="returnUrl" name="returnUrl" value="#">
            	<div class="member_login_box">
                    <!-- 회원 로그인 -->
                    <div class="login_input_sec">
                    	<div>
                        	<input type="text" id="loginId" name="loginId" placeholder="아이디" required="true" aria-required="true">
                        	<input type="password" id="loginPwd" name="loginPwd" placeholder="비밀번호" required="true" aria-required="true">
                      	</div>
                    	<button type="submit" onclick="return loginCheck()" >로그인</button>
                    </div>
                    <div class="id_chk">
                    	<span class="form_element">
                        	<input type="checkbox" id="saveId" name="saveId" value="y" checked="">
                            <label for="saveId" class="">아이디 저장</label>
                      	</span>
                    		<p class="dn js_caution_msg1" style="display :none" >아이디, 비밀번호가 일치하지 않습니다. 다시 입력해 주세요.</p>
                    </div>
                </div>
  
			<!-- //login_box -->
			<div class="member_sns_login" style="text-align: center">
				<a href="#" class="btn_kakao_login js_btn_kakao_login" data-kakao-type="login" data-return-url="#"> <img src="${path}/resources/images/login/kakaoLogin.png" class="img-fluid" alt="카카오 아이디 로그인"></a>
                <a href="#" class="btn_naver_login js_btn_naver_login" data-naver-url="#"><img src="${path}/resources/images/login/naverLogin.png" class="img-fluid" alt="네이버 아이디 로그인"></a>
            </div>
			<div class="btn_login_box"  style="text-align: center">
				<button id="btnJoinMember" class="btn_member_join">회원가입</button>
                <button id="btnFindId" class="btn_member_white">아이디 찾기</button>
                <button id="btnFindPwd" class="btn_member_white">비밀번호 찾기</button>
			</div>
 			<!-- //btn_login_box -->
		</form>
        
		<!-- //nonmember_join_box -->
		<div class="nonmember">
			<form id="formOrderLogin" action="${ path }/member/login" method="post">
 				<input type="hidden" name="mode" value="guestOrder">
				<input type="hidden" name="returnUrl" value="../mypage/order_view.php">
					<div class="nonmember_order_box">
                    	<h3>비회원 주문조회 하기</h3>
                    <div class="order_input_sec">
                    	<div>
                        	<input type="text" name="orderNm" placeholder="주문자명">
                       		<input type="text" name="orderNo" placeholder="주문번호">
						</div>
						<button type="submit">확인</button>
					</div>
						<p class="js_caution_msg2">주문번호와 비밀번호를 잊으신 경우, 고객센터로 문의하여 주시기 바랍니다.</p>
					</div>
 				</form>
			</div>
		</div>
          </div>
        	</div>
        	<!-- //member_cont -->
		<div class="col"></div>
	</div>
</div>
<!-- //본문 끝 contents -->

<script type="text/javascript" src="/resources/js/Member/member.js"></script>
<script type="text/javascript">
	var $formLogin;
	$(document).ready(function () {
		$('#btnJoinMember').click(function (e) {
			e.preventDefault();
			location.href = '${path}/member/join_method';
		});
		$('#btnFindId').click(function (e) {
			e.preventDefault();
			location.href = '${path}/member/find_id';
		});
		$('#btnFindPwd').click(function (e) {
			e.preventDefault();
			location.href = '${path}/member/find_password';
		});

		$('#loginId, #loginPwd').focusin(function () {
			$('.js_caution_msg1', '#formLogin').addClass('dn');
		});

		$formLogin = $('#formLogin');
		$formLogin.validate({
			dialog: false,
			rules: {
				loginId: {
					required: true
				},
				loginPwd: {
					required: true
				}
			},
			messages: {
				loginId: {
					required: "아이디를 입력해주세요"
				},
				loginPwd: {
					required: "패스워드를 입력해주세요"
				}
			}, submitHandler: function (form) {
			    if (window.location.search) {
                    var _tempUrl = window.location.search.substring(1);
                    var _tempVal = _tempUrl.split('=');

                    if (_tempVal[1] == 'lnCouponDown') {
                        $('#returnUrl').val(document.referrer);
                    }
                }
				form.target = 'ifrmProcess';
				form.submit();
			}
		});
	});

		// 비회원 주문조회 폼 체크
		$('#formOrderLogin').validate({
			rules: {
				orderNm: 'required',
				orderNo: {
					required: true,
					number: true,
					maxlength: 16
				}
			},
			messages: {
				orderNm: {
					required: "주문자명을 입력해주세요."
				},
				orderNo: {
					required: "주문번호를 입력해주세요.",
					number: "숫자로만 입력해주세요.",
					maxlength: "주문번호는 16자리입니다."
				}
			},
			submitHandler: function (form) {
				$.post(form.action, $(form).serializeObject()).done(function (data, textStatus, jqXhr) {
					console.log(data);
					if (data.result == 0) {
						location.replace('../mypage/order_view.php?orderNo=' + data.orderNo);
					} else {
						$('.js_caution_msg2').empty().html("주문자명과 주문번호가 일치하는 주문이 존재하지 않습니다. 다시 입력해 주세요.<br><span>주문번호와 비밀번호를 잊으신 경우, 고객센터로 문의하여 주시기 바랍니다.</span>");
					}
				});
				return false;
			}
		});
	
</script>


<jsp:include page="/views/common/footer.jsp"/>