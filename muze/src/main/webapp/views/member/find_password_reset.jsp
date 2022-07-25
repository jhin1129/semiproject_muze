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
                                <h2>비밀번호 찾기</h2>
                            </div>
                            <div class="member_cont">
                                <form name="formReset" id="formReset" action="../member/find_password_reset_ps.php" method="post">
                                    <div class="find_password_reset_box">
                                        <h3>비밀번호 변경</h3>
                                        <p>새로운 비밀번호를 등록해 주세요.</p>
                                        <div class="login_input">
                                            <div class="js_input_pw">
                                                <div class="member_warning">
                                                    <input type="password" id="passwordMsg" name="memPw" autocomplete="off" placeholder="영문대/소문자, 숫자, 특수문자 중 2가지 이상 조합하세요" data-min-length="10" data-max-length="16">
                                                </div>
                                            </div>
                                            <div class="js_input_pw">
                                                <div class="member_warning">
                                                    <input type="password" id="newPwRe" name="memPwRe" autocomplete="off" placeholder="새 비밀번호 확인">
                                                </div>
                                            </div>
                                            <div class="btn_center_box">
                                                <button type="button" id="btnConfirm" class="btn_member_ok">확인</button>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- //find_password_reset_box -->
                                </form>
                              </div>
                            <!-- //member_cont -->
                        </div>
                        <!-- //member_wrap -->
                    </form>
                </div>
 			</div> 
		<div class="col"></div>
	</div>
	<!-- //content_box -->
</div>
<!-- //본문 끝 contents -->

<jsp:include page="/views/common/footer.jsp"/>