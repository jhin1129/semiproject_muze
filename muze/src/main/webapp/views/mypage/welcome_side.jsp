<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

    <!-- 사이드 메뉴바 -->
	<div class="mySideMenu">
	<c:if test="${ loginMember.getMemberRole()  == 'MEMBER_ROLE_ARTIST' }">
	   <h5 style="font-weight: 600;" ><a href="${ path }/mypage/artist" style="text-decoration : none">아티스트 페이지</a></h5>
	   <hr>
	     <p id="myListMain"> 판매 정보 </p> 
	       <li id="mylist"><a id="sublist" href="${ path }/mypage/list?type=ORDER">- 주문 / 배송 조회</a></li>
	       <li id="mylist"><a id="sublist" href="${ path }/mypage/list?type=CANCEL">- 취소 / 환불 내역</a></li><br>
<%-- 	       <li id="mylist"><a id="sublist" href="${ path }/mypage/list?type=REFUND">- 환불 / 입금 내역</a></li><br> --%>
	     <p id="myListMain"> 아티스트 정보 </p> 
	       <li id="mylist"><a id="sublist" href="${ path }/mypage/checkinfo?type=UPDATE">- 회원 정보 변경 </a></li>
	       <li id="mylist"><a id="sublist" href="${ path }/mypage/checkinfo?type=DELETE">- 회원 탈퇴 </a></li><br>
	     <p id="myListMain"> 사이트 문의 </p> 
	       <li id="mylist"><a id="sublist" href="${ path }/mypage/community?type=QNA">- 1 : 1 문의</a></li><br>
	     <p id="myListMain"> 커뮤니티</p> 
	       <li id="mylist"><a id="sublist" href="${ path }/mypage/community?type=REVIEW_ART">- 작품 리뷰</a></li>
	       <li id="mylist"><a id="sublist" href="${ path }/mypage/community?type=FREE">- 나의 게시글</a></li><br>
	 </c:if>
	<c:if test="${ loginMember.getMemberRole()  == 'MEMBER_ROLE_USER' }">
	   <h5 style="font-weight: 600;" ><a href="${ path }/mypage/welcome" style="text-decoration : none">마이 페이지</a></h5>
	   <hr>
	     <p id="myListMain"> 구매 정보 </p> 
	       <li id="mylist"><a id="sublist" href="${ path }/mypage/list?type=ORDER">- 주문 / 배송 조회</a></li>
	       <li id="mylist"><a id="sublist" href="${ path }/mypage/list?type=CANCEL">- 취소 / 환불 내역</a></li><br>
<%-- 	       <li id="mylist"><a id="sublist" href="${ path }/mypage/list?type=REFUND">- 환불 / 입금 내역</a></li><br> --%>
	     <p id="myListMain"> 회원 정보 </p> 
	       <li id="mylist"><a id="sublist" href="${ path }/mypage/mileage">- 마일리지</a></li>
	       <li id="mylist"><a id="sublist" href="${ path }/mypage/checkinfo?type=UPDATE">- 회원 정보 변경 </a></li>
	       <li id="mylist"><a id="sublist" href="${ path }/mypage/checkinfo?type=DELETE">- 회원 탈퇴 </a></li><br>
	     <p id="myListMain"> 문의 내역 </p> 
	       <li id="mylist"><a id="sublist" href="${ path }/mypage/community?type=QNA">- 1 : 1 문의</a></li><br>
	     <p id="myListMain"> 내가 쓴 글</p> 
	       <li id="mylist"><a id="sublist" href="${ path }/mypage/community?type=REVIEW">- 구매 후기</a></li>
	       <li id="mylist"><a id="sublist" href="${ path }/mypage/community?type=FREE">- 나의 게시글</a></li><br>
<!-- 	       <iframe src="https://service.dongledongle.com/muze" frameborder="0" width="100%" height="400"></iframe> -->	 
	</c:if>
	 </div>