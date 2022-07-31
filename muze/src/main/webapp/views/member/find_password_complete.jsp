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
                    <form name="formFind" id="formFind" action="${ path }/member/find_password_complete" method="post">
                        <div class="member_wrap">
                            <div class="member_tit">
                                <h2>비밀번호 찾기</h2>
                            </div>
                            <div class="member_cont">
                                <div class="find_password_complete_box">
                                    <p>비밀번호가 정상적으로 변경되었습니다.</p>
                                    <div class="btn_center_box">
                                        <button type="button" id="btn_comfirm" class="btn_comfirm" >로그인</button>
                                    </div>
                                </div>
                                <!-- //find_password_complete_box -->
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

<script type="text/javascript">
$(document).ready(function () {
	$('#btn_comfirm').click(function (e) {
		e.preventDefault();
		location.href = '${path}/member/login';
	});
});
</script>
<jsp:include page="/views/common/footer.jsp"/>