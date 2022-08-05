<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp"/>

<!-- Login CSS -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${path}/resources/css/login/Login.css">

<!-- 내용 전체 컨테이너 -->
<div class="container">
	<div class="row" style="text-align: center">
		<div class="col"></div>
			<div class="col-6 ">
				<div class="member_cont" >
					<div class="member_join_box ">
						<div class="member_join_shop ">
                 			<a href="${path}/member/join_agreement" id="btnJoin" class="shop_mall_join"><span>쇼핑몰 회원가입</span></a>
                		</div>
                <!-- 두 번째 행 -->
                <div class="row">
                	<div class="member_sns_join"  >
	                    <a
	                      href="#"
	                      class="btn_kakao_join js_btn_kakao_join"
	                      data-kakao-type="join_method"
	                      data-return-url="#"
	                      onclick="kakaoLogin();">
	                      <img src="${path}/resources/images/login/kakao.png"  class="img-fluid" alt="카카오 아이디 회원가입"/>
	                    </a>
	                    <div id="naverIdLogin" style="display:none;"></div>
	                    <a
	                      href="#"
	                      id="naverLogin"
	                      class="btn_naver_join js_btn_naver_join"
	                      data-naver-type="join_method"
	                      data-naver-url="#">
	                      <img src="${path}/resources/images/login/naver.png" class="img-fluid" alt="네이버 아이디 로그인"/>
	                    </a>
                  	</div>
                </div>
                <!-- 세 번째 행 -->
                	<div class="row m-auto">
                  		<strong class="chk_none">
	                    SNS계정을 연동하여 빠르고 쉽고 안전하게 회원가입 할 수 있습니다. <br />
	                    이 과정에서 고객님의 데이터는 철저하게 보호됩니다.
	                  	</strong>
                	</div>
              </div>
              <!-- //member_cont -->
		</div>
	        <div class="member_guide_txt">
	        	<p>이미 쇼핑몰 회원이세요? <a href="${path}/member/login" id="btnLoginMember">로그인</a></p>
	        </div>
        </div>
        	<div class="col"></div>
	</div>
	<!-- //content_box -->
</div>
<!-- //본문 끝 contents -->

<script type="text/javascript">
	$(document).ready(function () {
		$('#btnJoin').click(function () {
			location.href = '${ path }/join_agreement';
		});
		$('#btnLoginMember').click(function () {
			window.location.href = '${ path }/member/login';
		});
	});
</script>

<%-- 네이버 스크립트 --%>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script>
const naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "ADu2lc9ebSDr0cdZSCrY",
			callbackUrl: "http://localhost:8090/muze/naverCallback",
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