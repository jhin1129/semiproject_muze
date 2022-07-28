<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

	<!-- 첫번째 행 -->
	<div class="row">
	  <div class="col-sm-12">
	    <!-- 카드 그룹 -->
	    <div class="card-group">
	      <!-- 첫번째 카드 -->
	      <div class="card">
	        <img src="${path}/resources/images/mypage/welcome.png" class="card-img-top" >
	        <div class="card-body">
	          <h5 class="card-title">${ myOrder.orderName } 님</h5>
	          <p class="card-text">
	            환영합니다.
	          </p>
	        </div>
	      </div>
	      <!-- 두번째 카드 -->
	      <div class="card">
	        <img src="${path}/resources/images/mypage/mileage.png" class="card-img-mid" >
	        <div class="card-body">
	          <h5 class="card-title">마일리지</h5>
	          <p class="card-text"> 
	            <a href="${path}/mypage/mileage">${ welcome.mileageNow } 원</a>
	          </p>
	        </div>
	      </div>
	      <!-- 세번째 카드 -->
	      <div class="card">
	        <img src="${path}/resources/images/mypage/write.png" class="card-img-top" >
	        <div class="card-body">
	          <h5 class="card-title">나의 후기</h5>
	          <p class="card-text">
	            <a href="${path}/mypage/review">${ welcome.boardCount } 개</a>
	          </p>
	        </div>
	      </div>
	    </div>
	    <!-- 카드그룹 끝 -->
	  </div>
	</div>
	<!-- 행 끝 -->