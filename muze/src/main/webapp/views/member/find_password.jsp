<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/views/common/header.jsp"/>

<!-- Login CSS -->
<link rel="stylesheet" href="${path}/resources/css/login/Login.css">

<!-- 내용 전체 컨테이너 -->
<div class="container">
	<div class="row">
        <div class="col"></div>
            <div class="col-6 ">
                <div class="content_box">
                    <form name="formFind" id="formFind" action="${ path}/member/find_password" method="post">
                        <div class="member_wrap">
                            <div class="member_tit">
                                <h2>비밀번호 찾기</h2>
                            </div>
                            <div class="member_cont">
                                <div class="find_password_box">
                                    <h3>아이디 입력</h3>
                                    <p>비밀번호를 찾고자 하는 아이디를 입력해 주세요.</p>
                                    <div class="login_input">
                                        <div class="member_warning">
                                            <input type="text" id="memberId" name="memberId" placeholder="아이디">
                                            <p class="info_again">아이디를 모르시나요? <a href="${ path }/member/find_id"  class="js_btn_find_id">아이디 찾기</a></p>
                                            <p class="dn" id="errorMessage"></p>
                                        </div>
                                        <div class="btn_center_box">
                                            <button type="submit" class="btn_member_next">다음</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- //find_password_box -->
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