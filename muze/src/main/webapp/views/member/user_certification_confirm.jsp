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
                <div class="content_box">
                    <form name="formFind" id="formFind" action="../member/user_certification.php" method="post">
                        <div class="member_wrap">
                            <div class="member_tit">
                                <h2>본인인증</h2>
                            </div>
                            <div class="member_cont">
                                <form name="formAuthConfirm" id="formAuthConfirm" method="post" novalidate="novalidate">
                                    <input type="hidden" name="authType" value="authEmail">
                                    <input type="hidden" name="certificationType" value="find_password">
                                    <input type="hidden" name="token" value="MTY1ODI2NTE4NTc1NjIxMjA1NTY0Mjg3NTIzMzQ4NjMyMzA0OTU5NjE2">
                                    <div class="find_password_box">
                                        <h3>인증번호 입력</h3>
                                        <p class="guide">수신된 이메일의 인증번호를 입력해 주세요.</p>
                                        <div class="login_input">
                                            <div class="member_warning">
                                                <input type="text" id="inputCertify" name="inputCertify" class="text" placeholder="인증번호 입력">
                                                <div id="guideMsg">
                                                    <p class="info_again"> 인증메일이 도착하지 않았나요?  <a href="#" name="btnAgain">인증번호 다시받기</a></p>
                                                </div>
                                                <div id="errorMessage" class="dn">
                                                    <!-- <p class="info_again">잘못된 인증번호 입니다. 다시 입력해 주세요. <a href="#" name="btnAgain">인증번호 다시받기</a></p> -->
                                                </div>
                                            </div>
                                            <!-- //member_warning -->
                                            <div class="btn_center_box">
                                                <button type="button" id="btnCancel" class="btn_member_prev">이전</button>
                                                <button type="submit" class="btn_member_next">확인</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <!-- //find_password_box -->
                            </div>
						</div>
					<!-- //member_cont -->
					</div>
				<!-- //member_wrap -->
				</form>
			</div>
		<div class="col"></div>
	</div> 
</div>
<!-- //본문 끝 contents -->

<jsp:include page="/views/common/footer.jsp"/>