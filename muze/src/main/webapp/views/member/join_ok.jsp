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
	<div class="row" style="text-align: center">
        <div class="col"></div>
            <div class="col-6 ">
                <div class="content_box">
                    <div class="member_wrap">
                        <div class="member_tit">
                            <h2>회원가입</h2>
                        </div>
                        <!-- //member_tit -->
                        <div class="member_cont">
                            <div class="join_ok_box">
                                <div class="join_ok_tit">
                                    <p class="complete">회원가입이 <strong>완료</strong> 되었습니다.</p>
                                    <p><span>${ join.memberName }</span>님의 회원가입을 축하합니다. <br> 아름다운 작품으로 찾아뵙겠습니다.</p>
                                </div>
                                <!-- //join_ok_tit -->
                                <div class="btn_member_sec" style="text-align: center">
                                    <button type="button" id="btnHome" class="btn_login_home">홈으로</button>
                                    <button type="button" id="btnNext" class="btn_login">로그인</button>    
                                </div>
                                <!-- //btn_member_sec -->
                            </div>
                            <!-- //join_ok_box -->
                        </div>
                        <!-- //member_cont -->
                    </div>
                    <!-- //member_wrap -->
                </div>
			</div>
		<div class="col"></div>
	</div>
	<!-- //content_box -->
</div>
<!-- //본문 끝 contents -->

<script type="text/javascript">
$(document).ready(function () {
	$('#btnNext').click(function (e) {
		e.preventDefault();
		location.href = '${path}/member/login';
	});
	
	$('#btnHome').click(function (e) {
		e.preventDefault();
		location.href = '${path}/';
	});
});
</script>

<jsp:include page="/views/common/footer.jsp"/>