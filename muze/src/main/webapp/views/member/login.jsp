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

<style type="text/css">
.error {
font-size : 13px;
float:left;
}
</style>

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
		<c:if test="${ empty loginMember }">
 			<input type="hidden" id="mode" name="mode" value="login">
            <input type="hidden" id="returnUrl" name="returnUrl" value="#">
            	<div class="member_login_box">
                    <!-- 회원 로그인 -->
                    <div class="login_input_sec">
                    	<div>
                        	<input type="text" id="memId" name="memId" placeholder="아이디" value="${ empty cookie.saveId ? '' : cookie.saveId.value }" aria-required="true" required>
                        	<input type="password" id="memPw" name="memPw" placeholder="비밀번호"  aria-required="true" required>
                      	</div>
                    	<button type="submit" >로그인</button>
                    </div>
                    <div class="id_chk">
                    	<span class="form_element">
                        	<input type="checkbox" id="saveId" name="saveId" ${ empty cookie.saveId ? "" : "checked" } >
                            <label for="saveId" class="">아이디 저장</label>
                      	</span>
                    		<p class="dn js_caution_msg1" style="display :none" >아이디, 비밀번호가 일치하지 않습니다. 다시 입력해 주세요.</p>
                    </div>
                </div>
  			</c:if>
			<!-- //login_box -->
			<div class="member_sns_login" style="text-align: center">
				<a href="#"  class="btn_kakao_login" data-kakao-type="login" data-return-url="#" onclick="kakaoLogin();"> <img src="${path}/resources/images/login/kakaoLogin.png" class="img-fluid" alt="카카오 아이디 로그인"></a>
                <div id="naverIdLogin" style="display:none;"></div>
                <a href="#" id="naverLogin" class="btn_naver_login js_btn_naver_login" onclick="naverLogin();" data-naver-url="#"><img src="${path}/resources/images/login/naverLogin.png" class="img-fluid" alt="네이버 아이디 로그인"></a>
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
				<input type="hidden" name="returnUrl" value="#">
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

<script src="<%=request.getContextPath()%>/resources/js/Member/member.js"></script>
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

		$('#memId, #memPw').focusin(function () {
			$('.js_caution_msg1', '#formLogin').addClass('dn');
		});

		$formLogin = $('#formLogin');
		$formLogin.validate({
			dialog: false,
			rules: {
				memId: {
					required: true
				},
				memPw: {
					required: true
				}
			},
			messages: {
				memId: {
					required: "아이디를 입력해주세요"
				},
				memPw: {
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
						location.replace('${ path }/myPage' + orderDetail.orderNo);
					} else {
						$('.js_caution_msg2').empty().html("주문자명과 주문번호가 일치하는 주문이 존재하지 않습니다. 다시 입력해 주세요.<br><span>주문번호와 비밀번호를 잊으신 경우, 고객센터로 문의하여 주시기 바랍니다.</span>");
					}
				});
				return false;
			}
		});
</script>

<%-- 네이버 스크립트 --%>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script>
const naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "ADu2lc9ebSDr0cdZSCrY",
			callbackUrl: "http://localhost:8090/muze/views/member/naverCallback.jsp",
			loginButton: {color: "white", type: 3, height: 60, width:500}
		}
	);
naverLogin.init();


$(document).on("click", "#naverLogin", function(){
    var naverLogin = document.getElementById("naverIdLogin").firstChild;
    naverLogin.click();
});

</script>

<%-- 카카오 스크립트 --%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

	<script>
        Kakao.init('74b3fafd7b1cd90a5f4cd0cd8b97fc90'); // 카카오에서 발급받은 JavaScript 키 (초기화 함수 호출)
        console.log(Kakao.isInitialized()); // sdk초기화여부판단 (초기화 잘 됐는지 확인하는 함수)
        //카카오로그인
        function kakaoLogin() {
            Kakao.Auth.login({
              success: function (res) {
                Kakao.API.request({
                  url: '/v2/user/me',
                  success: function (res) {
                   		var token = Kakao.Auth.getAccessToken();
                   		Kakao.Auth.setAccessToken(token);			// 토큰 설정
                	  
                        var userEmail = res.kakao_account.email; 	// 카카오 email
                        var userName = res.properties.nickname; 	// 카카오 닉네임(이름)
                        var kakaoId = res.id						// 비밀번호로 사용할 카카오 아이디
                       
                       $.ajax({
                    	method:"GET",
                        url:"${ path }/member/kakaoLogin",
                        data:{ userEmail,
                        	   userName,
                        	   kakaoId,
                        	   token },
                        	   
                        success:function(data){
                        	location.href="${ path }/";
                        	alert("카카오 로그인 성공");
                        }
                    });
                  },
    		     
                  fail: function (error) {
                	  // 카카오 로그인 실패 시 alert 창
                	  alert('로그인에 실패하였습니다.');
                  },
                })
              },
              fail: function (error) {
            	  location.href="${ path }/member/login";
              },
            })
          }
        </script>

<jsp:include page="/views/common/footer.jsp"/>