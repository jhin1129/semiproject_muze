<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

    <!-- 사이드 메뉴바 -->
	<div class="mySideMenu">
	   <h5 style="font-weight: 600;" >마이 페이지</h5>
	   <hr>
	     <p id="myListMain"> 구매 정보 </p> 
	       <li id="mylist"><a id="sublist" href="../mypage/order_list.php">- 주문 / 배송 조회</a></li>
	       <li id="mylist"><a id="sublist" href="../mypage/cancel_list.php">- 취소 / 반품 내역</a></li>
	       <li id="mylist"><a id="sublist" href="../mypage/cancel_list.php">- 환불 / 입금 내역</a></li><br>
	     <p id="myListMain"> 회원 정보 </p> 
	       <li id="mylist"><a id="sublist" href="../mypage/mileage.php">- 회원 혜택</a></li>
	       <li id="mylist"><a id="sublist" href="../mypage/my_page_password.php">- 회원 정보 변경 </a></li>
	       <li id="mylist"><a id="sublist" href="../mypage/my_page_password.php">- 회원 탈퇴 </a></li><br>
	     <p id="myListMain"> 문의 내역 </p> 
	       <li id="mylist"><a id="sublist" href="../mypage/mypage_qa.php">- 1 : 1 문의</a></li>
	       <li id="mylist"><a id="sublist" href="../mypage/mypage_goods_qa.php">- 상품 문의</a></li><br>
	     <p id="myListMain"> 내가 쓴 글</p> 
	       <li id="mylist"><a id="sublist" href="../mypage/mypage_community.php">- 구매 후기</a></li>
	       <li id="mylist"><a id="sublist" href="../mypage/mypage_community.php">- 나의 게시글</a></li><br>
	 </div>