<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp"/>

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
		<form id="formLogin" method="post" action="${ path }/member/login" novalidate="novalidate">
 			<input type="hidden" id="mode" name="mode" value="login">
            <input type="hidden" id="returnUrl" name="returnUrl" value="#">
            	<div class="member_login_box">
                    <!-- 회원 로그인 -->
                    <div class="login_input_sec">
                    	<div>
                        	<input type="text" id="loginId" name="loginId" value="" placeholder="아이디" required="true" aria-required="true">
                        	<input type="password" id="loginPwd" name="loginPwd" value="" placeholder="비밀번호" required="true" aria-required="true">
                      	</div>
                    	<button type="submit">로그인</button>
                    </div>
                    <div class="id_chk">
                    	<span class="form_element">
                        	<input type="checkbox" id="saveId" name="saveId" value="y" checked="">
                            <label for="saveId" class="">아이디 저장</label>
                      	</span>
                    	<!-- <p class="dn js_caution_msg1">아이디, 비밀번호가 일치하지 않습니다. 다시 입력해 주세요.</p> -->
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
			<form id="formOrderLogin" action="../member/member_ps.php" method="post" novalidate="novalidate">
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

<jsp:include page="/views/common/footer.jsp"/>