<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/views/common/header.jsp"/>

<div class="container my-5" style="height: 400px;">
<div class="content_box">
  <div class="service_tit">
    <h2>이용약관</h2>
    <hr>
  </div>
  <div class="service_cont">
        1. - 목적 : 이용자 식별 및 본인여부 확인<br>
    - 항목 : 이름, 아이디, 비밀번호<br>
    - 보유 및 이용기간 : 회원탈퇴 후 5일까지<br>
<br>
2. - 목적 : 민원 등 고객 고충처리<br>
    - 항목 : 이메일, 휴대전화번호<br>
    - 보유 및 이용기간 : 회원탈퇴 후 5일까지<br>
<br>
3. - 목적 : 만 14세 미만 아동 확인<br>
    - 항목 : 법정 생년월일<br>
    - 보유 및 이용기간 : 회원탈퇴 후 5일까지
    </div>
</div>
</div>
<!-- //content_box -->

<jsp:include page="/views/common/footer.jsp"/>