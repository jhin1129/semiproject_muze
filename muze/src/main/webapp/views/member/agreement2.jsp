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
        <h2>선택적 개인정보의 수집목적 및 이용목적</h2>
        <hr>
    </div>
    <div class="service_cont">
        - 수집/이용목적 : 주문/결제 시 상품 배송<br>
- 수집항목 : 구매자정보, 상품 구매/취소/반품/교환/환불 정보, 수령인 정보<br>
- 보유/이용기간 : 회원탈퇴 후 5일까지
    </div>
</div>
</div>
<!-- //content_box -->

<jsp:include page="/views/common/footer.jsp"/>