<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
	<!-- (1) LoginWithNaverId Javscript SDK -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

	<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	<script>
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "ADu2lc9ebSDr0cdZSCrY",
				callbackUrl: "http://localhost:8090/muze/views/member/naverCallback.jsp",
				isPopup: false,
				callbackHandle: true
				/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
			}
		);
		naverLogin.init();

		window.addEventListener('load', function () {
		naverLogin.getLoginStatus(function (status) {

		if (status) {
			/* console.log(naverLogin.user); */
			var userEmail = naverLogin.user.getEmail();
			var naverId = naverLogin.user.getId();
			var userName = naverLogin.user.getName();

			$.ajax({
				method:"GET",
				url: '${ path }/member/naverLogin',
				data: { userEmail,
						naverId,
						userName },

						success: function(data) {
							location.href="${ path }/";
                        	alert("네이버 로그인 성공");
							
						},
						 fail: function (error) {
		                	  // 카카오 로그인 실패 시 alert 창
		                	  location.href="${ path }/member/login";
		                	  alert('로그인에 실패하였습니다.');
						}
					})

				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
				});
			});
</script>
